// import 'dart:async';
// import 'dart:convert';

// import 'package:chopper/chopper.dart';
// import 'package:job_portal/local_models/serializable-models/serialized-course.dart';
// import 'package:job_portal/local_models/serializable-models/serialized-job.dart';
// import 'package:job_portal/providers/authentication-state.provider.dart';
// import 'package:job_portal/services/user-data.service.dart';
// import 'package:job_portal/swagger_models_apis/user_management_api.swagger.dart'
//     as usermanagement;
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:provider/provider.dart';

// class UserState with ChangeNotifier {
//   usermanagement.UserProfile? _userProfile;

//   void setUserProfile({
//     required usermanagement.UserProfile? user,
//     required BuildContext context,
//   }) {
//     _userProfile = user;
//     Provider.of<usermanagement.UserManagementApi>(
//       context,
//       listen: false,
//     )
//         .userItemEmailGet(email: user!.email.toLowerCase())
//         .then((Response<usermanagement.UserItems> response) {
//       if (response.isSuccessful) {
//         Map<String, dynamic> responseMap = jsonDecode(response.bodyString);
//         List<SerializedCourse> appliedCourses = [];
//         List<SerializedCourse> savedCourses = [];
//         Map<String, dynamic> allCourses =
//             responseMap["courses"] as Map<String, dynamic>;
//         List<Map<String, dynamic>> appliedCoursesMapList =
//             (allCourses["applied"].cast<Map<String, dynamic>>());

//         (appliedCoursesMapList).forEach((Map<String, dynamic> element) {
//           appliedCourses.add(SerializedCourse.fromJson(element));
//         });
//         List<Map<String, dynamic>> savedCoursesMapList =
//             (allCourses["saved"].cast<Map<String, dynamic>>());

//         (savedCoursesMapList).forEach((Map<String, dynamic> element) {
//           savedCourses.add(SerializedCourse.fromJson(element));
//         });
//         UserDataService().updateSavedCourses(courses: savedCourses);
//         UserDataService().updateAppliedCourses(courses: appliedCourses);

//         List<SerializedJob> appliedJobs = [];
//         List<SerializedJob> savedJobs = [];
//         Map<String, dynamic> allJobs =
//             responseMap["jobs"] as Map<String, dynamic>;
//         List<Map<String, dynamic>> appliedJobsMapList =
//             (allJobs["applied"].cast<Map<String, dynamic>>());

//         (appliedJobsMapList).forEach((Map<String, dynamic> element) {
//           appliedJobs.add(SerializedJob.fromJson(element));
//         });
//         List<Map<String, dynamic>> savedJobsMapList =
//             (allJobs["saved"].cast<Map<String, dynamic>>());

//         (savedJobsMapList).forEach((Map<String, dynamic> element) {
//           savedJobs.add(SerializedJob.fromJson(element));
//         });
//         UserDataService().updateSavedJobs(jobs: savedJobs);
//         UserDataService().updateAppliedJobs(jobs: appliedJobs);
//       }
//     });

//     notifyListeners();
//   }

//   updateCity({required String city}) {
//     // if (_userProfile != null) {
//     //   _userProfile!.city = city;
//     //   notifyListeners();
//     // }
//   }

//   get userProfile => _userProfile;
// }
