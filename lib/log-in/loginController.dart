import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'loginModel.dart';
import '../global/globalVars.dart' as Global;

class LoginController extends GetxController {
  TextEditingController emailTextController;
  TextEditingController passwordTextController;
  var isLoading; //= true.obs;
  var logToken;
  var lan;
  String PIN;

  logInUserModel logUserModel;
  Data userListData;

  @override
  void onInit() {
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
    isLoading = false;
    super.onInit();
  }

  Future apiLogin() async {
    print('api called');
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Authorization': '',
    };
    try {
      final http.Response response = await http.post(
        'http://185.194.124.200:8051/api/Account/Login',
        headers: header,
        body: jsonEncode(<String, String>{
          'UserName': emailTextController.text,
          'Password': passwordTextController.text,
          'otp': '1234',
        }),
      );
      print(response.statusCode);
      print(response.body);

      isLoading = false;
      logUserModel = logInUserModel.fromJson(json.decode(response.body));

      userListData = logUserModel.data;
      Global.Gt = userListData.token.toString();
      Global.Gpass = passwordTextController.text.toString();
      logToken = userListData.token.toString();
      Global.Gv = 'false';

      PIN = userListData.pinCode;

      if (response.statusCode == 200 && userListData.firstTime) {
        emailTextController.clear();
        passwordTextController.clear();
        Get.back();
        Get.toNamed("/fPass",
            //"/firtTimepass",

            arguments: [
              Global.Gt,
              passwordTextController.text.toString(),
              'false',
              PIN
            ]);
      } else if (response.statusCode == 200 &&
          userListData.mustChangePassword) {
        emailTextController.clear();
        passwordTextController.clear();
        Get.back();
        print('3333 ${Global.Gv}');

        Get.toNamed("/changePass",
            arguments: [Global.Gt, Global.Gpass, 'true', PIN]);
        Get.snackbar('Change Password', 'Must change password',
            duration: Duration(seconds: 6),
            backgroundColor: Colors.green.withOpacity(0.6));
      } else if (response.statusCode == 200 && !logUserModel.data.firstTime) {
        emailTextController.clear();
        passwordTextController.clear();
        Get.back();
        print(passwordTextController.text);
        Get.toNamed('/confirm', arguments: [Global.Gt, Global.Gpass, PIN]);
      }
    } catch (e) {
      Get.back();
      //   Get.snackbar('Please check internet connection'.tr, '',
      Get.snackbar('Error'.tr, 'Please check user name and password'.tr,
          duration: Duration(seconds: 6),
          // backgroundColor: Color(0xff8e0016).withOpacity(0.2),
          backgroundColor: Color(0XFFFFDDDA),
          icon: Icon(
            Icons.error_sharp,
            color: Color(0xff8e0016),
          ));
      print(e.toString());
    }
  }

  // @override
  // void onClose() {

  //   super.onClose();
  // }
}
