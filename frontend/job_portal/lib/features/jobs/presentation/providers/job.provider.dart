import 'package:job_portal/features/credentials/domain/credential_wrapper.dart';
import 'package:job_portal/features/jobs/domain/entities/job.dart';
import 'package:job_portal/features/jobs/domain/entities/job_state_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'job.provider.g.dart';

@Riverpod(keepAlive: true)
class JobState extends _$JobState {
  @override
  JobStateModel build() {
    return JobStateModel(
      job: Job(),
      certificates: [
        // CredentialWrapper(
        //   vc: {
        //     "@context": [
        //       "https://www.w3.org/2018/credentials/v1",
        //       {
        //         "credentialSchema": {
        //           "@id": "https://www.w3.org/2018/credentials#credentialSchema",
        //           "@type": "@id"
        //         },
        //         "email": {
        //           "@id": "schema-id:email",
        //           "@type": "https://schema.org/Text"
        //         },
        //         "studentName": {
        //           "@id": "schema-id:studentName",
        //           "@type": "https://schema.org/Text"
        //         },
        //         "courseName": {
        //           "@id": "schema-id:courseName",
        //           "@type": "https://schema.org/Text"
        //         },
        //         "instituteName": {
        //           "@id": "schema-id:instituteName",
        //           "@type": "https://schema.org/Text"
        //         },
        //         "instituteLogo": {
        //           "@id": "schema-id:instituteLogo",
        //           "@type": "https://schema.org/Text"
        //         },
        //         "dateOfCompletion": {
        //           "@id": "schema-id:dateOfCompletion",
        //           "@type": "https://schema.org/Text"
        //         },
        //         "scoreAchieved": {
        //           "@id": "schema-id:score",
        //           "@type": "https://schema.org/Text"
        //         }
        //       }
        //     ],
        //     "type": ["VerifiableCredential"],
        //     "issuanceDate": "2024-11-18T14:40:05.855Z",
        //     "holder": {
        //       "id":
        //           "did:web:oid4vci.demo.cord.network:3zKcL2oAsvZZwFA5uPxtysk5jsai2TGx4AvrpJcBYmAwzGyN"
        //     },
        //     "id": "cord:e68dd545-aa61-4dc3-abe0-dc90d01cd35b",
        //     "credentialSubject": {
        //       "id":
        //           "did:web:oid4vci.demo.cord.network:3zKcL2oAsvZZwFA5uPxtysk5jsai2TGx4AvrpJcBYmAwzGyN",
        //       "email": "amar@dhiway.com",
        //       "studentName": "Amar Tumballi",
        //       "courseName": "Masters in Data Analytics (Dhiway) ",
        //       "instituteName": "Hogwarts University",
        //       "instituteLogo": "",
        //       "dateOfCompletion": "2024-11-18T14:40:05.805Z",
        //       "scoreAchieved": "450/500"
        //     },
        //     "issuer":
        //         "did:key:zQ3sheZGT2rqZ58hFsUfjCMrB96Kkd4cGk4Zu6j5EaL6MXzid",
        //     "proof": {
        //       "type": "EcdsaSecp256k1Signature2019",
        //       "created": "2024-11-18T14:40:05Z",
        //       "verificationMethod":
        //           "did:key:zQ3sheZGT2rqZ58hFsUfjCMrB96Kkd4cGk4Zu6j5EaL6MXzid#zQ3sheZGT2rqZ58hFsUfjCMrB96Kkd4cGk4Zu6j5EaL6MXzid",
        //       "proofPurpose": "assertionMethod",
        //       "jws":
        //           "eyJhbGciOiJFUzI1NksiLCJiNjQiOmZhbHNlLCJjcml0IjpbImI2NCJdfQ..buXUqfDzGoa_fRgq3LJe7nohmAgMWdPzrinyN3dDXKl-faQhK1I03-zTseuDfr9YmrqLV_Y0wF4FXUu-NSRFLw"
        //     }
        //   },
        // ),
      ],
    );
  }

  setJob({required Job job}) {
    state = state.copyWith(job: job);
  }

  addCertificates({required List<CredentialWrapper> certificates}) {
    state = state.copyWith(certificates: [
      ...state.certificates,
      ...certificates,
    ]);
  }

  void clear() {
    state = JobStateModel(
      job: Job(),
      certificates: [],
    );
  }
}
