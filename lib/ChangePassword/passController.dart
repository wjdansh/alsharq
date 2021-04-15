import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../global/globalVars.dart' as Global;
import 'dart:convert';
import 'package:get/route_manager.dart';
import 'package:get/get.dart';

import 'passModel.dart';

class passController extends GetxController {
  TextEditingController oldpasswordTextController;
  TextEditingController new1passwordTextController;
  TextEditingController new2passwordTextController;
  TextEditingController pinTextController;

  passModel passwordModel;
  Datapass passListData;

  String LogToken;
  String OldPass;
  String newpass;
  String PIN;
  String pa;
  bool isLoading = true;

  @override
  void onInit() {
    oldpasswordTextController = TextEditingController();
    new1passwordTextController = TextEditingController();
    new2passwordTextController = TextEditingController();
    pinTextController = TextEditingController();
    //PIN = pinTextController.text;

    super.onInit();
  }

  void submitNewQ() {
    print('submit q');
    print(oldpasswordTextController.text);
    print(new1passwordTextController.text);
    print(new2passwordTextController.text);
    print(pinTextController.text);

    if (oldpasswordTextController.text != Global.Gpass) {
      Get.back();
      Get.snackbar(
        'currentPassError'.tr,
        'old password not correct'.tr,
        backgroundColor: Color(0XFFFFDDDA),
        icon: Icon(
          Icons.error_sharp,
          color: Color(0xff8e0016),
        ),
      );
      return;
    } else if (new1passwordTextController.text !=
        new2passwordTextController.text) {
      Get.back();
      Get.snackbar(
        'newpassError'.tr,
        'NewPassword not match'.tr,
        backgroundColor: Color(0XFFFFDDDA),
        icon: Icon(
          Icons.error_sharp,
          color: Color(0xff8e0016),
        ),
      );
      print('not equal');
      return;
    } else if (new1passwordTextController.text ==
        oldpasswordTextController.text) {
      Get.back();
      Get.snackbar(
        'newpassError'.tr,
        'the new password should not equal the old password'.tr,
        backgroundColor: Color(0XFFFFDDDA),
        duration: Duration(seconds: 6),
        icon: Icon(
          Icons.error_sharp,
          color: Color(0xff8e0016),
        ),
      );

      return;
    } else
      print(" ttt  ${Global.Gv}");
    apiChangePass(Global.Gv == 'true' ? Global.Gtoken : Global.Gt,
        new1passwordTextController.text, pinTextController.text);
  }

  Future apiChangePass(String token, String pass, String pin) async {
    print(" token   ${token}");
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Authorization': token.toString(),
    };
    try {
      final http.Response response = await http.post(
        'http://185.194.124.200:8051/api/Account/changePassword',
        headers: header,
        body: jsonEncode(<String, String>{
          'password': oldpasswordTextController.text, //
          'newPassword': pass,
          'pinCode': pin,
        }),
      );
      print(response.statusCode);
      print(response.body);
      final ac = json.decode(response.body) as Map<String, dynamic>;
      // final List<Account> ad = ac['data'].map((s) => s as String).toList();

      //passwordModel = passModel.fromJson(json.decode(response.body));
      // print(' 55 ${passwordModel.valid}');

      if (response.statusCode == 200 && ac['valid']) {
        Get.back();

        oldpasswordTextController.clear();
        new1passwordTextController.clear();
        new2passwordTextController.clear();
        pinTextController.clear();
        Global.Gpass = pass;
        Get.back();
        Get.snackbar("  ", 'Password changed successfully'.tr,
            backgroundColor: Colors.white.withOpacity(0.8),
            icon: Icon(
              Icons.check_circle,
              color: Color(0xff149931),
            ));
      }
    } catch (e) {
      Get.back();
      Get.snackbar(
        ('update failed'.tr),
        'check  pin'.tr,
        backgroundColor: Color(0XFFFFDDDA),
        icon: Icon(
          Icons.error_sharp,
          color: Color(0xff8e0016),
        ),
      );
      print(e);
    }
  }
}
