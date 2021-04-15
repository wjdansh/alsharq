// import 'dart:convert';
// import 'package:alsharq/global/globalVars.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class complaintControl extends GetxController {
//   TextEditingController subjectController;
//   TextEditingController complaintController;
//   TextEditingController suggestController;
//   TextEditingController preferTimeController;
//   TextEditingController suggesttroller;
//   bool first = false.obs as bool;
//   bool checkedBox = false.obs as bool;
//
//   @override
//   void onInit() {
//     subjectController = TextEditingController();
//     complaintController = TextEditingController();
//     suggestController = TextEditingController();
//     preferTimeController = TextEditingController();
//     suggestController = TextEditingController();
//     super.onInit();
//   }
//
//   Future apiComplaint() async {
//     print('api new pass in is called');
//     Map<String, String> header = {
//       'Content-Type': 'application/json',
//       'Authorization': _globalVars.G_token.toString(),
//     };
//     try {
//       final http.Response response = await http.post(
//         'http://185.194.124.200:8051/api/ClientOperation/Complaint',
//         headers: header,
//         body: jsonEncode(<String, String>{
//           "Subject": subjectController.text,
//           "ComplaintContent": complaintController.text,
//           "SuggestionContnet": suggestController.text,
//           "PreferredTime": preferTimeController.text,
//           "FirstComplaint": first.toString()
//         }),
//       );
//       print(response.statusCode);
//       print(response.body);
//       if (response.statusCode == 200) {
//         //go to home
//       }
//     } catch (e) {
//       Get.snackbar('Error', e.toString());
//     }
//
//     // Get.back();
//     // Get.offNamed('/MenuDashboardLayout');
//   }
//
// // @override
// // void onClose() {
// //   // emailTextController?.dispose();
// //   // passwordTextController?.dispose();
// //   super.onClose();
// // }
// }
