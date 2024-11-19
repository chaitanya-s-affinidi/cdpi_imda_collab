import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
dotenv.config();

import { Issuer, generators, BaseClient, AuthorizationParameters } from 'openid-client';
import { fetchIotaVpResponse, initiateIotaRequest } from './src/lib/clients/iota';
import { providerClientId, providerIssuer, providerRedirectUrl } from './src/lib/secrets';
import { CodeVerifier, CompleteBody } from './src/lib/types';
import { iotaInitShareSchema, iotaResponseSchema } from './src/lib/schema';
import * as WebSocket from 'ws';
import { DefaultApi, Configuration, VerifyCredentialInput } from '@affinidi-tdk/credential-verification-client';
import { getAuthProvider } from './src/lib/clients/auth-provider';
const http = require('http');
const app = express();
const server = http.createServer(app);
app.use(express.json());
app.use(express.urlencoded({ extended: false }));

const PORT = process.env.PORT|| 3001;
// const PORT = 3001;
const WEBSOCKETPORT = 3010;

const code_verifier: CodeVerifier = generators.codeVerifier();

const getClient = async (): Promise<BaseClient> => { // Use Promise for asynchronous function
    try {
        const affinidi = await Issuer.discover(providerIssuer);
        const client = new affinidi.Client({
            client_id: providerClientId,
            redirect_uris: [providerRedirectUrl],
            response_types: ['code'],
            token_endpoint_auth_method: 'none',
        });
        return client;

    } catch (error) {
        console.error('getClient error:', error);
        throw new Error('getClient failed');  // Throw specific error
    }
};


const initializeServer = async () => {
    let webSocket: WebSocket;
    app.get('/', (req, res, next) => {
        res.json({ success: 'Express' });
    });

    app.use(cors({ credentials: true, origin: true }));
    app.set('trust proxy', 1);

    if (providerClientId) {
        app.get('/api/affinidi-auth/init', async (req, res, next) => {

            const state = generators.state();
            // const code_verifier = generators.codeVerifier(); // Removed as already defined

            const params: AuthorizationParameters = {
                code_challenge: generators.codeChallenge(code_verifier),
                code_challenge_method: 'S256',
                response_type: 'code',
                scope: 'openid',
                state,
            }

            const client = await getClient();

            const authorizationUrl = client.authorizationUrl(params);

            res.send({ authorizationUrl });
        });

        app.post('/api/affinidi-auth/complete', async (req, res, next) => {

            const { code, state }: CompleteBody = req.body; // Use destructuring and type assertion
            if (!code || !state || !code_verifier) {
                res.status(400).send({
                    error: 'Invalid data code/state is missing'
                });
                return;
            }
            try {

                const client = await getClient();

                const tokenSet = await client.callback(providerRedirectUrl, { code, state },
                    { state, code_verifier });
                console.log('tokenSet', tokenSet);

                const id_token = tokenSet.id_token;
                const token = JSON.parse(Buffer.from(id_token!.split('.')[1], 'base64').toString());

                console.log('id_token', token);
                const user = {
                    ...token
                };

                res.send({ user });
            } catch (error: any) {
                res.status(400).send({
                    error: error.message
                });
            }

        });
    }


    //   app.use('/.well-known/assetlinks.json', express.static('assetlinks.json'));
    //   app.use('/.well-known/did.json', express.static('879ea1b09c909e90548ff0ac3fb568dc-did-document.json'));

    //   app.use('/testlink', express.static('testlink.html'));
    app.post('/api/iota/start-redirect-flow', async (req, res, next) => {
        try {
            console.log("iota-redirect body", req.body);
            const { configurationId, queryId, nonce, redirectUri } = iotaInitShareSchema.parse(req.body);

            const { correlationId, transactionId, jwt } = await initiateIotaRequest(configurationId, queryId, nonce, redirectUri) || {};

            res.json({ correlationId, transactionId, jwt });

        } catch (error: any) {
            res
                .status(500)
                .json({ message: "Unable to get Iota credentials", details: error });
            console.log(error);
        }
    });

    app.post('/api/iota/iota-response', async (req, res, next) => {
        try {
            console.log("iota-response body", req.body);
            const { responseCode, configurationId, correlationId, transactionId } = iotaResponseSchema.parse(req.body);

            const iotaVpResponse = await fetchIotaVpResponse(responseCode, configurationId, correlationId, transactionId) || {};

            res.json({ vp: JSON.parse(iotaVpResponse.vpToken), nonce: iotaVpResponse.nonce });

        } catch (error: any) {
            res
                .status(500)
                .json({ message: "Unable to get Iota vp token", details: error });
            console.log(error);
        }
    });

    app.post('/inji/callback', async (req, res, next) => {
        try {
            console.log("inji callback body", req.body);

            webSocket.send(JSON.stringify(req.body));

            res.status(200).json({});

        } catch (error: any) {
            // res
            //     .status(500)
            //     .json({});
            // console.log(error);
        }
    });

    app.post('/api/iota/verify', async (req, res, next) => {
        try {
            const authProvider = getAuthProvider();
            const api = new DefaultApi(
                new Configuration({
                    apiKey: authProvider.fetchProjectScopedToken.bind(authProvider),
                })
            );
            const apiData: VerifyCredentialInput = {
                verifiableCredentials: req.body.vcs,
            };
            
            const { data: verificationResponse } = await api.verifyCredentials(apiData);
            res.status(verificationResponse.isValid ? 200: 400).json(verificationResponse);

        } catch (error: any) {
            res
                .status(500)
                .json({ message: "Unable to get Iota credentials", details: error });
            console.log(error);
        }
    });


    //Start server
    app.listen(PORT, () => {
        console.log(`Server listening on ${PORT}`);
    });

    // const wss = new WebSocket.Server({ server: server });
    const wss = new WebSocket.Server({ port: WEBSOCKETPORT });
    wss.on('connection', (ws: WebSocket) => {
        console.log('A client connected');
        webSocket = ws;
        const heartbeatInterval = setInterval(() => {
            webSocket.send('ping');
        }, 4000); // Send a ping every 30 seconds
    
        // ws.send('ping')
        // setTimeout(()=>{
        //     ws.send(JSON.stringify({
        //         vp_token: `{"verifiableCredential":["{\\"format\\":\\"ldp_vc\\",\\"identifier\\":\\"StayProtected:OpenId4VCI:238be590-cc69-430f-984e-5918347366a6\\",\\"generatedOn\\":\\"2024-11-11T09:49:02.136Z\\",\\"vcMetadata\\":{\\"idType\\":\\"\\",\\"requestId\\":\\"238be590-cc69-430f-984e-5918347366a6\\",\\"isPinned\\":false,\\"id\\":\\"238be590-cc69-430f-984e-5918347366a6 + '_' + StayProtected\\",\\"issuer\\":\\"StayProtected\\",\\"protocol\\":\\"OpenId4VCI\\",\\"timestamp\\":\\"\\",\\"isVerified\\":true,\\"displayId\\":\\"7579-195-131\\",\\"format\\":\\"ldp_vc\\",\\"downloadKeyType\\":\\"RS256\\"},\\"verifiableCredential\\":{\\"credential\\":{\\"@context\\":[\\"https://www.w3.org/2018/credentials/v1\\",\\"https://holashchand.github.io/test_project/insurance-context.json\\",\\"https://w3id.org/security/suites/ed25519-2020/v1\\"],\\"credentialSubject\\":{\\"id\\":\\"did:jwk:eyJrdHkiOiJSU0EiLCJlIjoiQVFBQiIsInVzZSI6InNpZyIsImtpZCI6InRaa0VQME0tb1hZb3pfNmI5RDJvWkh0N3pqeFhUbVdoQndQb2JNQXM3RTgiLCJhbGciOiJSUzI1NiIsIm4iOiIwcTFGcjVNUEFEbzJCQlhEdlZrZ2ZYRlJBQ3RzcHpQTzg4d3FqS0x6d05RMFpqTXFIRmxmaVA1cDM0dlFRRFBMY1pOakd4bFNaUzkwUnBlZFR3U3lBVy1xWDRWTWN5LU5zdkIwc3JNbWpvcW1paTN3N0pLZElhNTF0amdzSWk0aW8zLUZnYk9ZeG1TLUFaYWcyTWFGUHRaSUdFQUJpeWZ1T0dPSzQ4TlJGdTJ3Mmh5di1pQ3pQM25sY0kzTlp5YnBiREViVlpTbVR6SEZ1RWZyNEcwd2dhUTdqUU8yNERlMGYtZG9QNy13THdNZG1nR3gyTjBQbi1VMmx4WHV5OURFM1RTRjdRdDFkbzZVTG9oZVM0U0oteG5uYk9iUmo3RlRmRG03SjRFZXRxN25qU3FWb29RTXZ2SV9sQzF6UzA3ZXFPQTBmdThRZE85S0FpZGtSVzV0VXcifQ==\\",\\"dob\\":\\"2000-07-07\\",\\"email\\":\\"chaitanya@gmail.com\\",\\"gender\\":\\"Male\\",\\"mobile\\":\\"9886216812\\",\\"benefits\\":[\\"Critical Surgery\\",\\"Full body checkup\\"],\\"fullName\\":\\"Chaitanya Samprajan\\",\\"policyName\\":\\"StayProtected Health Pro\\",\\"policyNumber\\":\\"7579-195-131\\",\\"policyIssuedOn\\":\\"2024-11-07\\",\\"policyExpiresOn\\":\\"2025-11-07\\"},\\"expirationDate\\":\\"2024-12-11T09:49:00.821Z\\",\\"id\\":\\"did:rcw:238be590-cc69-430f-984e-5918347366a6\\",\\"issuanceDate\\":\\"2024-11-11T09:49:00.826Z\\",\\"issuer\\":\\"did:web:api.dev1.mosip.net:identity-service:8ebda1d0-665b-4bb7-abc7-d4bf56b6ee09\\",\\"proof\\":{\\"created\\":\\"2024-11-11T09:49:01Z\\",\\"proofPurpose\\":\\"assertionMethod\\",\\"proofValue\\":\\"z5hLgfiyJ5f3G6K59RdaphmStMk4dMqxNfX5MnCkZVZAWRuUA3oChM52VzEjBSqUq8n3k1qHkQq8Pzn58S4znN9z4\\",\\"type\\":\\"Ed25519Signature2020\\",\\"verificationMethod\\":\\"did:web:api.dev1.mosip.net:identity-service:8ebda1d0-665b-4bb7-abc7-d4bf56b6ee09#key-0\\"},\\"type\\":[\\"VerifiableCredential\\",\\"InsuranceCredential\\"]},\\"wellKnown\\":\\"https://injicertify-insurance.collab.mosip.net/v1/certify/issuance/.well-known/openid-credential-issuer\\",\\"credentialConfigurationId\\":\\"InsuranceCredential\\",\\"issuerLogo\\":{\\"url\\":\\"https://raw.githubusercontent.com/tw-mosip/file-server/master/StayProtectedInsurance.png\\",\\"alt_text\\":\\"a square logo of a StayProtected\\"}}}"],"id":"162969b4-826e-42ff-9eae-57eaa17caba3","holder":"","proof":{"type":"RsaSignature2018","created":"2024-11-11T20:19:22Z","challenge":"NUfki5MRgXXmMgXHDeX/6Q","domain":"OpenID4VP","jws":"eyJhbGciOiJSUzI1NiIsImp3ayI6eyJrdHkiOiJSU0EiLCJraWQiOiJ0WmtFUDBNLW9YWW96XzZiOUQyb1pIdDd6anhYVG1XaEJ3UG9iTUFzN0U4IiwibiI6IjBxMUZyNU1QQURvMkJCWER2VmtnZlhGUkFDdHNwelBPODh3cWpLTHp3TlEwWmpNcUhGbGZpUDVwMzR2UVFEUExjWk5qR3hsU1pTOTBScGVkVHdTeUFXLXFYNFZNY3ktTnN2QjBzck1tam9xbWlpM3c3SktkSWE1MXRqZ3NJaTRpbzMtRmdiT1l4bVMtQVphZzJNYUZQdFpJR0VBQml5ZnVPR09LNDhOUkZ1MncyaHl2LWlDelAzbmxjSTNOWnlicGJERWJWWlNtVHpIRnVFZnI0RzB3Z2FRN2pRTzI0RGUwZi1kb1A3LXdMd01kbWdHeDJOMFBuLVUybHhYdXk5REUzVFNGN1F0MWRvNlVMb2hlUzRTSi14bm5iT2JSajdGVGZEbTdKNEVldHE3bmpTcVZvb1FNdnZJX2xDMXpTMDdlcU9BMGZ1OFFkTzlLQWlka1JXNXRVdyIsImUiOiJBUUFCIiwiYWxnIjoiUlMyNTYiLCJ1c2UiOiJzaWcifX0.eyJ2ZXJpZmlhYmxlQ3JlZGVudGlhbCI6WyJ7XCJmb3JtYXRcIjpcImxkcF92Y1wiLFwiaWRlbnRpZmllclwiOlwiU3RheVByb3RlY3RlZDpPcGVuSWQ0VkNJOjIzOGJlNTkwLWNjNjktNDMwZi05ODRlLTU5MTgzNDczNjZhNlwiLFwiZ2VuZXJhdGVkT25cIjpcIjIwMjQtMTEtMTFUMDk6NDk6MDIuMTM2WlwiLFwidmNNZXRhZGF0YVwiOntcImlkVHlwZVwiOlwiXCIsXCJyZXF1ZXN0SWRcIjpcIjIzOGJlNTkwLWNjNjktNDMwZi05ODRlLTU5MTgzNDczNjZhNlwiLFwiaXNQaW5uZWRcIjpmYWxzZSxcImlkXCI6XCIyMzhiZTU5MC1jYzY5LTQzMGYtOTg0ZS01OTE4MzQ3MzY2YTYgKyAnXycgKyBTdGF5UHJvdGVjdGVkXCIsXCJpc3N1ZXJcIjpcIlN0YXlQcm90ZWN0ZWRcIixcInByb3RvY29sXCI6XCJPcGVuSWQ0VkNJXCIsXCJ0aW1lc3RhbXBcIjpcIlwiLFwiaXNWZXJpZmllZFwiOnRydWUsXCJkaXNwbGF5SWRcIjpcIjc1NzktMTk1LTEzMVwiLFwiZm9ybWF0XCI6XCJsZHBfdmNcIixcImRvd25sb2FkS2V5VHlwZVwiOlwiUlMyNTZcIn0sXCJ2ZXJpZmlhYmxlQ3JlZGVudGlhbFwiOntcImNyZWRlbnRpYWxcIjp7XCJAY29udGV4dFwiOltcImh0dHBzOi8vd3d3LnczLm9yZy8yMDE4L2NyZWRlbnRpYWxzL3YxXCIsXCJodHRwczovL2hvbGFzaGNoYW5kLmdpdGh1Yi5pby90ZXN0X3Byb2plY3QvaW5zdXJhbmNlLWNvbnRleHQuanNvblwiLFwiaHR0cHM6Ly93M2lkLm9yZy9zZWN1cml0eS9zdWl0ZXMvZWQyNTUxOS0yMDIwL3YxXCJdLFwiY3JlZGVudGlhbFN1YmplY3RcIjp7XCJpZFwiOlwiZGlkOmp3azpleUpyZEhraU9pSlNVMEVpTENKbElqb2lRVkZCUWlJc0luVnpaU0k2SW5OcFp5SXNJbXRwWkNJNkluUmFhMFZRTUUwdGIxaFpiM3BmTm1JNVJESnZXa2gwTjNwcWVGaFViVmRvUW5kUWIySk5RWE0zUlRnaUxDSmhiR2NpT2lKU1V6STFOaUlzSW00aU9pSXdjVEZHY2pWTlVFRkViekpDUWxoRWRsWnJaMlpZUmxKQlEzUnpjSHBRVHpnNGQzRnFTMHg2ZDA1Uk1GcHFUWEZJUm14bWFWQTFjRE0wZGxGUlJGQk1ZMXBPYWtkNGJGTmFVemt3VW5CbFpGUjNVM2xCVnkxeFdEUldUV041TFU1emRrSXdjM0pOYldwdmNXMXBhVE4zTjBwTFpFbGhOVEYwYW1kelNXazBhVzh6TFVabllrOVplRzFUTFVGYVlXY3lUV0ZHVUhSYVNVZEZRVUpwZVdaMVQwZFBTelE0VGxKR2RUSjNNbWg1ZGkxcFEzcFFNMjVzWTBrelRscDVZbkJpUkVWaVZscFRiVlI2U0VaMVJXWnlORWN3ZDJkaFVUZHFVVTh5TkVSbE1HWXRaRzlRTnkxM1RIZE5aRzFuUjNneVRqQlFiaTFWTW14NFdIVjVPVVJGTTFSVFJqZFJkREZrYnpaVlRHOW9aVk0wVTBvdGVHNXVZazlpVW1vM1JsUm1SRzAzU2pSRlpYUnhOMjVxVTNGV2IyOVJUWFoyU1Y5c1F6RjZVekEzWlhGUFFUQm1kVGhSWkU4NVMwRnBaR3RTVnpWMFZYY2lmUT09XCIsXCJkb2JcIjpcIjIwMDAtMDctMDdcIixcImVtYWlsXCI6XCJjaGFpdGFueWFAZ21haWwuY29tXCIsXCJnZW5kZXJcIjpcIk1hbGVcIixcIm1vYmlsZVwiOlwiOTg4NjIxNjgxMlwiLFwiYmVuZWZpdHNcIjpbXCJDcml0aWNhbCBTdXJnZXJ5XCIsXCJGdWxsIGJvZHkgY2hlY2t1cFwiXSxcImZ1bGxOYW1lXCI6XCJDaGFpdGFueWEgU2FtcHJhamFuXCIsXCJwb2xpY3lOYW1lXCI6XCJTdGF5UHJvdGVjdGVkIEhlYWx0aCBQcm9cIixcInBvbGljeU51bWJlclwiOlwiNzU3OS0xOTUtMTMxXCIsXCJwb2xpY3lJc3N1ZWRPblwiOlwiMjAyNC0xMS0wN1wiLFwicG9saWN5RXhwaXJlc09uXCI6XCIyMDI1LTExLTA3XCJ9LFwiZXhwaXJhdGlvbkRhdGVcIjpcIjIwMjQtMTItMTFUMDk6NDk6MDAuODIxWlwiLFwiaWRcIjpcImRpZDpyY3c6MjM4YmU1OTAtY2M2OS00MzBmLTk4NGUtNTkxODM0NzM2NmE2XCIsXCJpc3N1YW5jZURhdGVcIjpcIjIwMjQtMTEtMTFUMDk6NDk6MDAuODI2WlwiLFwiaXNzdWVyXCI6XCJkaWQ6d2ViOmFwaS5kZXYxLm1vc2lwLm5ldDppZGVudGl0eS1zZXJ2aWNlOjhlYmRhMWQwLTY2NWItNGJiNy1hYmM3LWQ0YmY1NmI2ZWUwOVwiLFwicHJvb2ZcIjp7XCJjcmVhdGVkXCI6XCIyMDI0LTExLTExVDA5OjQ5OjAxWlwiLFwicHJvb2ZQdXJwb3NlXCI6XCJhc3NlcnRpb25NZXRob2RcIixcInByb29mVmFsdWVcIjpcIno1aExnZml5SjVmM0c2SzU5UmRhcGhtU3RNazRkTXF4TmZYNU1uQ2taVlpBV1J1VUEzb0NoTTUyVnpFakJTcVVxOG4zazFxSGtRcThQem41OFM0em5OOXo0XCIsXCJ0eXBlXCI6XCJFZDI1NTE5U2lnbmF0dXJlMjAyMFwiLFwidmVyaWZpY2F0aW9uTWV0aG9kXCI6XCJkaWQ6d2ViOmFwaS5kZXYxLm1vc2lwLm5ldDppZGVudGl0eS1zZXJ2aWNlOjhlYmRhMWQwLTY2NWItNGJiNy1hYmM3LWQ0YmY1NmI2ZWUwOSNrZXktMFwifSxcInR5cGVcIjpbXCJWZXJpZmlhYmxlQ3JlZGVudGlhbFwiLFwiSW5zdXJhbmNlQ3JlZGVudGlhbFwiXX0sXCJ3ZWxsS25vd25cIjpcImh0dHBzOi8vaW5qaWNlcnRpZnktaW5zdXJhbmNlLmNvbGxhYi5tb3NpcC5uZXQvdjEvY2VydGlmeS9pc3N1YW5jZS8ud2VsbC1rbm93bi9vcGVuaWQtY3JlZGVudGlhbC1pc3N1ZXJcIixcImNyZWRlbnRpYWxDb25maWd1cmF0aW9uSWRcIjpcIkluc3VyYW5jZUNyZWRlbnRpYWxcIixcImlzc3VlckxvZ29cIjp7XCJ1cmxcIjpcImh0dHBzOi8vcmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbS90dy1tb3NpcC9maWxlLXNlcnZlci9tYXN0ZXIvU3RheVByb3RlY3RlZEluc3VyYW5jZS5wbmdcIixcImFsdF90ZXh0XCI6XCJhIHNxdWFyZSBsb2dvIG9mIGEgU3RheVByb3RlY3RlZFwifX19Il0sImlkIjoiMTYyOTY5YjQtODI2ZS00MmZmLTllYWUtNTdlYWExN2NhYmEzIiwiaG9sZGVyIjoiIn0.g_W9QCVE7fee4YtxFmmvbwuTGPOSPtDvXgbdhrpdtrXYZg60QRd4xUxYkvSe7_nFhpo5536h15v9\\ni111Tl0as16p-PgaQizBCcSz6blMirbSfEER6476dGhRUAdbN7a5ZfM-7p3BizkrN3UWYsjkeipn\\nRg_h2gxfp-2JTXAUytKsj70v5-YN6fgTj60C3IvX9oabUqhG3ePwBvTx7V5gQE_N22Q4Eulc-6xw\\nWjVAGfdDk2EiqWzFlgmssjzW8laaQkzbnqjwGK4cNCwHQbhNRR0_OPyLt75lJ3X0uHuJ10t-rFts\\nyNtHN9wYbjEfhysdDXhHPD9_K01LWxTxlDgcEg==\\n","verificationMethod":"-----BEGIN PUBLIC KEY-----\\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA0q1Fr5MPADo2BBXDvVkg\\nfXFRACtspzPO88wqjKLzwNQ0ZjMqHFlfiP5p34vQQDPLcZNjGxlSZS90RpedTwSy\\nAW+qX4VMcy+NsvB0srMmjoqmii3w7JKdIa51tjgsIi4io3+FgbOYxmS+AZag2MaF\\nPtZIGEABiyfuOGOK48NRFu2w2hyv+iCzP3nlcI3NZybpbDEbVZSmTzHFuEfr4G0w\\ngaQ7jQO24De0f+doP7+wLwMdmgGx2N0Pn+U2lxXuy9DE3TSF7Qt1do6ULoheS4SJ\\n+xnnbObRj7FTfDm7J4Eetq7njSqVooQMvvI/lC1zS07eqOA0fu8QdO9KAidkRW5t\\nUwIDAQAB\\n-----END PUBLIC KEY-----\\n"}}`,
        //         presentation_submission: '{"id":"4c6eab81-0bd5-44f4-b8f9-63c5ead1e293","definition_id":"vp token example","descriptor_map":[{"id":"id card credential","format":"ldp_vp","path":"$.verifiableCredential[0]"}]}'
        //       },),);
            
        //     // {"verifiableCredential":["{\\"format\\":\\"ldp_vc\\",\\"identifier\\":\\"StayProtected:OpenId4VCI:238be590-cc69-430f-984e-5918347366a6\\",\\"generatedOn\\":\\"2024-11-11T09:49:02.136Z\\",\\"vcMetadata\\":{\\"idType\\":\\"\\",\\"requestId\\":\\"238be590-cc69-430f-984e-5918347366a6\\",\\"isPinned\\":false,\\"id\\":\\"238be590-cc69-430f-984e-5918347366a6 + '_' + StayProtected\\",\\"issuer\\":\\"StayProtected\\",\\"protocol\\":\\"OpenId4VCI\\",\\"timestamp\\":\\"\\",\\"isVerified\\":true,\\"displayId\\":\\"7579-195-131\\",\\"format\\":\\"ldp_vc\\",\\"downloadKeyType\\":\\"RS256\\"},\\"verifiableCredential\\":{\\"credential\\":{\\"@context\\":[\\"https://www.w3.org/2018/credentials/v1\\",\\"https://holashchand.github.io/test_project/insurance-context.json\\",\\"https://w3id.org/security/suites/ed25519-2020/v1\\"],\\"credentialSubject\\":{\\"id\\":\\"did:jwk:eyJrdHkiOiJSU0EiLCJlIjoiQVFBQiIsInVzZSI6InNpZyIsImtpZCI6InRaa0VQME0tb1hZb3pfNmI5RDJvWkh0N3pqeFhUbVdoQndQb2JNQXM3RTgiLCJhbGciOiJSUzI1NiIsIm4iOiIwcTFGcjVNUEFEbzJCQlhEdlZrZ2ZYRlJBQ3RzcHpQTzg4d3FqS0x6d05RMFpqTXFIRmxmaVA1cDM0dlFRRFBMY1pOakd4bFNaUzkwUnBlZFR3U3lBVy1xWDRWTWN5LU5zdkIwc3JNbWpvcW1paTN3N0pLZElhNTF0amdzSWk0aW8zLUZnYk9ZeG1TLUFaYWcyTWFGUHRaSUdFQUJpeWZ1T0dPSzQ4TlJGdTJ3Mmh5di1pQ3pQM25sY0kzTlp5YnBiREViVlpTbVR6SEZ1RWZyNEcwd2dhUTdqUU8yNERlMGYtZG9QNy13THdNZG1nR3gyTjBQbi1VMmx4WHV5OURFM1RTRjdRdDFkbzZVTG9oZVM0U0oteG5uYk9iUmo3RlRmRG03SjRFZXRxN25qU3FWb29RTXZ2SV9sQzF6UzA3ZXFPQTBmdThRZE85S0FpZGtSVzV0VXcifQ==\\",\\"dob\\":\\"2000-07-07\\",\\"email\\":\\"chaitanya@gmail.com\\",\\"gender\\":\\"Male\\",\\"mobile\\":\\"9886216812\\",\\"benefits\\":[\\"Critical Surgery\\",\\"Full body checkup\\"],\\"fullName\\":\\"Chaitanya Samprajan\\",\\"policyName\\":\\"StayProtected Health Pro\\",\\"policyNumber\\":\\"7579-195-131\\",\\"policyIssuedOn\\":\\"2024-11-07\\",\\"policyExpiresOn\\":\\"2025-11-07\\"},\\"expirationDate\\":\\"2024-12-11T09:49:00.821Z\\",\\"id\\":\\"did:rcw:238be590-cc69-430f-984e-5918347366a6\\",\\"issuanceDate\\":\\"2024-11-11T09:49:00.826Z\\",\\"issuer\\":\\"did:web:api.dev1.mosip.net:identity-service:8ebda1d0-665b-4bb7-abc7-d4bf56b6ee09\\",\\"proof\\":{\\"created\\":\\"2024-11-11T09:49:01Z\\",\\"proofPurpose\\":\\"assertionMethod\\",\\"proofValue\\":\\"z5hLgfiyJ5f3G6K59RdaphmStMk4dMqxNfX5MnCkZVZAWRuUA3oChM52VzEjBSqUq8n3k1qHkQq8Pzn58S4znN9z4\\",\\"type\\":\\"Ed25519Signature2020\\",\\"verificationMethod\\":\\"did:web:api.dev1.mosip.net:identity-service:8ebda1d0-665b-4bb7-abc7-d4bf56b6ee09#key-0\\"},\\"type\\":[\\"VerifiableCredential\\",\\"InsuranceCredential\\"]},\\"wellKnown\\":\\"https://injicertify-insurance.collab.mosip.net/v1/certify/issuance/.well-known/openid-credential-issuer\\",\\"credentialConfigurationId\\":\\"InsuranceCredential\\",\\"issuerLogo\\":{\\"url\\":\\"https://raw.githubusercontent.com/tw-mosip/file-server/master/StayProtectedInsurance.png\\",\\"alt_text\\":\\"a square logo of a StayProtected\\"}}}"],"id":"162969b4-826e-42ff-9eae-57eaa17caba3","holder":"","proof":{"type":"RsaSignature2018","created":"2024-11-11T20:19:22Z","challenge":"NUfki5MRgXXmMgXHDeX/6Q","domain":"OpenID4VP","jws":"eyJhbGciOiJSUzI1NiIsImp3ayI6eyJrdHkiOiJSU0EiLCJraWQiOiJ0WmtFUDBNLW9YWW96XzZiOUQyb1pIdDd6anhYVG1XaEJ3UG9iTUFzN0U4IiwibiI6IjBxMUZyNU1QQURvMkJCWER2VmtnZlhGUkFDdHNwelBPODh3cWpLTHp3TlEwWmpNcUhGbGZpUDVwMzR2UVFEUExjWk5qR3hsU1pTOTBScGVkVHdTeUFXLXFYNFZNY3ktTnN2QjBzck1tam9xbWlpM3c3SktkSWE1MXRqZ3NJaTRpbzMtRmdiT1l4bVMtQVphZzJNYUZQdFpJR0VBQml5ZnVPR09LNDhOUkZ1MncyaHl2LWlDelAzbmxjSTNOWnlicGJERWJWWlNtVHpIRnVFZnI0RzB3Z2FRN2pRTzI0RGUwZi1kb1A3LXdMd01kbWdHeDJOMFBuLVUybHhYdXk5REUzVFNGN1F0MWRvNlVMb2hlUzRTSi14bm5iT2JSajdGVGZEbTdKNEVldHE3bmpTcVZvb1FNdnZJX2xDMXpTMDdlcU9BMGZ1OFFkTzlLQWlka1JXNXRVdyIsImUiOiJBUUFCIiwiYWxnIjoiUlMyNTYiLCJ1c2UiOiJzaWcifX0.eyJ2ZXJpZmlhYmxlQ3JlZGVudGlhbCI6WyJ7XCJmb3JtYXRcIjpcImxkcF92Y1wiLFwiaWRlbnRpZmllclwiOlwiU3RheVByb3RlY3RlZDpPcGVuSWQ0VkNJOjIzOGJlNTkwLWNjNjktNDMwZi05ODRlLTU5MTgzNDczNjZhNlwiLFwiZ2VuZXJhdGVkT25cIjpcIjIwMjQtMTEtMTFUMDk6NDk6MDIuMTM2WlwiLFwidmNNZXRhZGF0YVwiOntcImlkVHlwZVwiOlwiXCIsXCJyZXF1ZXN0SWRcIjpcIjIzOGJlNTkwLWNjNjktNDMwZi05ODRlLTU5MTgzNDczNjZhNlwiLFwiaXNQaW5uZWRcIjpmYWxzZSxcImlkXCI6XCIyMzhiZTU5MC1jYzY5LTQzMGYtOTg0ZS01OTE4MzQ3MzY2YTYgKyAnXycgKyBTdGF5UHJvdGVjdGVkXCIsXCJpc3N1ZXJcIjpcIlN0YXlQcm90ZWN0ZWRcIixcInByb3RvY29sXCI6XCJPcGVuSWQ0VkNJXCIsXCJ0aW1lc3RhbXBcIjpcIlwiLFwiaXNWZXJpZmllZFwiOnRydWUsXCJkaXNwbGF5SWRcIjpcIjc1NzktMTk1LTEzMVwiLFwiZm9ybWF0XCI6XCJsZHBfdmNcIixcImRvd25sb2FkS2V5VHlwZVwiOlwiUlMyNTZcIn0sXCJ2ZXJpZmlhYmxlQ3JlZGVudGlhbFwiOntcImNyZWRlbnRpYWxcIjp7XCJAY29udGV4dFwiOltcImh0dHBzOi8vd3d3LnczLm9yZy8yMDE4L2NyZWRlbnRpYWxzL3YxXCIsXCJodHRwczovL2hvbGFzaGNoYW5kLmdpdGh1Yi5pby90ZXN0X3Byb2plY3QvaW5zdXJhbmNlLWNvbnRleHQuanNvblwiLFwiaHR0cHM6Ly93M2lkLm9yZy9zZWN1cml0eS9zdWl0ZXMvZWQyNTUxOS0yMDIwL3YxXCJdLFwiY3JlZGVudGlhbFN1YmplY3RcIjp7XCJpZFwiOlwiZGlkOmp3azpleUpyZEhraU9pSlNVMEVpTENKbElqb2lRVkZCUWlJc0luVnpaU0k2SW5OcFp5SXNJbXRwWkNJNkluUmFhMFZRTUUwdGIxaFpiM3BmTm1JNVJESnZXa2gwTjNwcWVGaFViVmRvUW5kUWIySk5RWE0zUlRnaUxDSmhiR2NpT2lKU1V6STFOaUlzSW00aU9pSXdjVEZHY2pWTlVFRkViekpDUWxoRWRsWnJaMlpZUmxKQlEzUnpjSHBRVHpnNGQzRnFTMHg2ZDA1Uk1GcHFUWEZJUm14bWFWQTFjRE0wZGxGUlJGQk1ZMXBPYWtkNGJGTmFVemt3VW5CbFpGUjNVM2xCVnkxeFdEUldUV041TFU1emRrSXdjM0pOYldwdmNXMXBhVE4zTjBwTFpFbGhOVEYwYW1kelNXazBhVzh6TFVabllrOVplRzFUTFVGYVlXY3lUV0ZHVUhSYVNVZEZRVUpwZVdaMVQwZFBTelE0VGxKR2RUSjNNbWg1ZGkxcFEzcFFNMjVzWTBrelRscDVZbkJpUkVWaVZscFRiVlI2U0VaMVJXWnlORWN3ZDJkaFVUZHFVVTh5TkVSbE1HWXRaRzlRTnkxM1RIZE5aRzFuUjNneVRqQlFiaTFWTW14NFdIVjVPVVJGTTFSVFJqZFJkREZrYnpaVlRHOW9aVk0wVTBvdGVHNXVZazlpVW1vM1JsUm1SRzAzU2pSRlpYUnhOMjVxVTNGV2IyOVJUWFoyU1Y5c1F6RjZVekEzWlhGUFFUQm1kVGhSWkU4NVMwRnBaR3RTVnpWMFZYY2lmUT09XCIsXCJkb2JcIjpcIjIwMDAtMDctMDdcIixcImVtYWlsXCI6XCJjaGFpdGFueWFAZ21haWwuY29tXCIsXCJnZW5kZXJcIjpcIk1hbGVcIixcIm1vYmlsZVwiOlwiOTg4NjIxNjgxMlwiLFwiYmVuZWZpdHNcIjpbXCJDcml0aWNhbCBTdXJnZXJ5XCIsXCJGdWxsIGJvZHkgY2hlY2t1cFwiXSxcImZ1bGxOYW1lXCI6XCJDaGFpdGFueWEgU2FtcHJhamFuXCIsXCJwb2xpY3lOYW1lXCI6XCJTdGF5UHJvdGVjdGVkIEhlYWx0aCBQcm9cIixcInBvbGljeU51bWJlclwiOlwiNzU3OS0xOTUtMTMxXCIsXCJwb2xpY3lJc3N1ZWRPblwiOlwiMjAyNC0xMS0wN1wiLFwicG9saWN5RXhwaXJlc09uXCI6XCIyMDI1LTExLTA3XCJ9LFwiZXhwaXJhdGlvbkRhdGVcIjpcIjIwMjQtMTItMTFUMDk6NDk6MDAuODIxWlwiLFwiaWRcIjpcImRpZDpyY3c6MjM4YmU1OTAtY2M2OS00MzBmLTk4NGUtNTkxODM0NzM2NmE2XCIsXCJpc3N1YW5jZURhdGVcIjpcIjIwMjQtMTEtMTFUMDk6NDk6MDAuODI2WlwiLFwiaXNzdWVyXCI6XCJkaWQ6d2ViOmFwaS5kZXYxLm1vc2lwLm5ldDppZGVudGl0eS1zZXJ2aWNlOjhlYmRhMWQwLTY2NWItNGJiNy1hYmM3LWQ0YmY1NmI2ZWUwOVwiLFwicHJvb2ZcIjp7XCJjcmVhdGVkXCI6XCIyMDI0LTExLTExVDA5OjQ5OjAxWlwiLFwicHJvb2ZQdXJwb3NlXCI6XCJhc3NlcnRpb25NZXRob2RcIixcInByb29mVmFsdWVcIjpcIno1aExnZml5SjVmM0c2SzU5UmRhcGhtU3RNazRkTXF4TmZYNU1uQ2taVlpBV1J1VUEzb0NoTTUyVnpFakJTcVVxOG4zazFxSGtRcThQem41OFM0em5OOXo0XCIsXCJ0eXBlXCI6XCJFZDI1NTE5U2lnbmF0dXJlMjAyMFwiLFwidmVyaWZpY2F0aW9uTWV0aG9kXCI6XCJkaWQ6d2ViOmFwaS5kZXYxLm1vc2lwLm5ldDppZGVudGl0eS1zZXJ2aWNlOjhlYmRhMWQwLTY2NWItNGJiNy1hYmM3LWQ0YmY1NmI2ZWUwOSNrZXktMFwifSxcInR5cGVcIjpbXCJWZXJpZmlhYmxlQ3JlZGVudGlhbFwiLFwiSW5zdXJhbmNlQ3JlZGVudGlhbFwiXX0sXCJ3ZWxsS25vd25cIjpcImh0dHBzOi8vaW5qaWNlcnRpZnktaW5zdXJhbmNlLmNvbGxhYi5tb3NpcC5uZXQvdjEvY2VydGlmeS9pc3N1YW5jZS8ud2VsbC1rbm93bi9vcGVuaWQtY3JlZGVudGlhbC1pc3N1ZXJcIixcImNyZWRlbnRpYWxDb25maWd1cmF0aW9uSWRcIjpcIkluc3VyYW5jZUNyZWRlbnRpYWxcIixcImlzc3VlckxvZ29cIjp7XCJ1cmxcIjpcImh0dHBzOi8vcmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbS90dy1tb3NpcC9maWxlLXNlcnZlci9tYXN0ZXIvU3RheVByb3RlY3RlZEluc3VyYW5jZS5wbmdcIixcImFsdF90ZXh0XCI6XCJhIHNxdWFyZSBsb2dvIG9mIGEgU3RheVByb3RlY3RlZFwifX19Il0sImlkIjoiMTYyOTY5YjQtODI2ZS00MmZmLTllYWUtNTdlYWExN2NhYmEzIiwiaG9sZGVyIjoiIn0.g_W9QCVE7fee4YtxFmmvbwuTGPOSPtDvXgbdhrpdtrXYZg60QRd4xUxYkvSe7_nFhpo5536h15v9\\ni111Tl0as16p-PgaQizBCcSz6blMirbSfEER6476dGhRUAdbN7a5ZfM-7p3BizkrN3UWYsjkeipn\\nRg_h2gxfp-2JTXAUytKsj70v5-YN6fgTj60C3IvX9oabUqhG3ePwBvTx7V5gQE_N22Q4Eulc-6xw\\nWjVAGfdDk2EiqWzFlgmssjzW8laaQkzbnqjwGK4cNCwHQbhNRR0_OPyLt75lJ3X0uHuJ10t-rFts\\nyNtHN9wYbjEfhysdDXhHPD9_K01LWxTxlDgcEg==\\n","verificationMethod":"-----BEGIN PUBLIC KEY-----\\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA0q1Fr5MPADo2BBXDvVkg\\nfXFRACtspzPO88wqjKLzwNQ0ZjMqHFlfiP5p34vQQDPLcZNjGxlSZS90RpedTwSy\\nAW+qX4VMcy+NsvB0srMmjoqmii3w7JKdIa51tjgsIi4io3+FgbOYxmS+AZag2MaF\\nPtZIGEABiyfuOGOK48NRFu2w2hyv+iCzP3nlcI3NZybpbDEbVZSmTzHFuEfr4G0w\\ngaQ7jQO24De0f+doP7+wLwMdmgGx2N0Pn+U2lxXuy9DE3TSF7Qt1do6ULoheS4SJ\\n+xnnbObRj7FTfDm7J4Eetq7njSqVooQMvvI/lC1zS07eqOA0fu8QdO9KAidkRW5t\\nUwIDAQAB\\n-----END PUBLIC KEY-----\\n"}}`);
        //     return;
        // }, 10000);
      ws.on('message', (message: string) => {
        console.log(`Received message: ${message}`);
    
        if (message === 'ping') {
          ws.send('pong');
        }
      });
    
      ws.on('close', () => {
        console.log('A client disconnected');
        clearInterval(heartbeatInterval);

      });
    });




    console.log(`WebSocket server started on port ${WEBSOCKETPORT}`);
}

initializeServer();