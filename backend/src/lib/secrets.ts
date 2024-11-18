// private environment secrets for backend

const requiredEnvs: string[] = [
  "PROJECT_ID",
  "TOKEN_ID",
  "PRIVATE_KEY",
];
const missingEnvs = requiredEnvs.filter((name) => !process.env[name]);
if (missingEnvs.length !== 0) {
  throw new Error(
    `Required environment secrets are not provided: ${missingEnvs.join(
      ", "
    )}. Please check README file.`
  );
}

export const logLevel = process.env.LOG_LEVEL || "info";
export const providerClientId = process.env.PROVIDER_CLIENT_ID!;
export const providerClientSecret = process.env.PROVIDER_CLIENT_SECRET!;
export const providerIssuer = process.env.PROVIDER_ISSUER!;
export const providerRedirectUrl = process.env.PROVIDER_REDIRECT_URL!;

// TDK requires these variables
export const projectId = process.env.PROJECT_ID!
export const tokenId = process.env.TOKEN_ID!
export const privateKey = process.env.PRIVATE_KEY!
export const publicKey = process.env.PUBLIC_KEY!
export const passphrase = process.env.PASSPHRASE!
export const keyId = process.env.KEY_ID!
