// import 'dart:convert';
// import 'package:alsharq/global/globalVars.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class changePinController extends GetxController {
//   TextEditingController passwordController;
//   TextEditingController newPinController;
//   TextEditingController pinController;
//
//   @override
//   void onInit() {
//     passwordController = TextEditingController();
//     newPinController = TextEditingController();
//     pinController = TextEditingController();
//     super.onInit();
//   }
//
//   Future apiChangePin() async {
//     print('api new pass in is called');
//     Map<String, String> header = {
//       'Content-Type': 'application/json',
//       'Authorization': _globalVars.G_token.toString(),
//     };
//     try {
//       final http.Response response = await http.post(
//         'http://185.194.124.200:8051/api/Account/ChangePinCode',
//         headers: header,
//         body: jsonEncode(<String, String>{
//           'Password': passwordController.text,
//           'NewPinCode': newPinController.text,
//           'pinCode': pinController.text,
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
