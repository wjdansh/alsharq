import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class firstLogInConrtoller extends GetxController {
  TextEditingController oldpasswordTextController;
  TextEditingController new1passwordTextController;
  TextEditingController new2passwordTextController;
  TextEditingController pinController;
  String token = Get.arguments[0];
  String oldPass = Get.arguments[1];

  String LogToken;
  String OldPass;
  String firstTime;
  String PIN;
  @override
  void onInit() {
    oldpasswordTextController = TextEditingController();
    new1passwordTextController = TextEditingController();
    new2passwordTextController = TextEditingController();
    pinController = TextEditingController();

    // LogToken = Get.arguments[0];
    // OldPass = Get.arguments[1];
    // firstTime = Get.arguments[2];
    // PIN = '1234';
  }

  void submitNewQ() {
    print('submit q');
    print(oldpasswordTextController.text);
    print(new1passwordTextController.text);
    print(new2passwordTextController.text);
    print(pinController.text);
    // print(Get.arguments[0].toString());
    if (oldpasswordTextController.text != Get.arguments[1].toString()) {
      Get.snackbar('currentPassError'.tr, 'currentPassErrorMsg'.tr);
      print('not old');
      return;
    } else if (new1passwordTextController.text !=
        new2passwordTextController.text) {
      Get.snackbar('newpassError'.tr, 'newPassErrorMsg'.tr);
      print('not equal');
      return;
    } else {
      apiChangePass(Get.arguments[0], new1passwordTextController.text,
          pinController.text);
    }
  }

  Future apiChangePass(String token, String pass, String pin) async {
    print('api new pass in is called');
    Map<String, String> header = {
      'Authorization': token,
      'Content-Type': 'application/json',
    };
    try {
      final http.Response response = await http.post(
        'http://185.194.124.200:8051/api/Account/changePassword',
        headers: header,
        body: jsonEncode(<String, String>{
          'password': Get.arguments[1].toString(),
          'newPassword': pass.toString(),
          'pinCode': pin.toString(),
        }),
      );
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        Get.snackbar("success", "  ");
        //Get.toNamed('/loginView');
        // arguments: [LogToken, OldPass, firstTime, PIN]);
        //" /allQuestions",
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
