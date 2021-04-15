import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../global/globalVars.dart' as Global;
import 'dart:convert';
import 'package:get/route_manager.dart';
import 'package:get/get.dart';

import 'pinchModel.dart';

class PinController extends GetxController {
  TextEditingController oldpinController;
  TextEditingController new1pinController;
  TextEditingController new2pinController;
  TextEditingController passwoController;

  PinModel pinModel;
  Datapin pinListData;

  String LogToken;
  String OldPin;
  String newpin;
  String Passw;
  bool isLoading = true;

  @override
  void onInit() {
    oldpinController = TextEditingController();
    new1pinController = TextEditingController();
    new2pinController = TextEditingController();
    passwoController = TextEditingController();

    // LogToken = Get.arguments[0];
    // //OldPin = ;
    // //newpin = Get.arguments[2];
    // Passw = Get.arguments[1];

    super.onInit();
  }

  void submitNewpin() {
    print('submit q');
    print(oldpinController.text);
    print(new1pinController.text);
    print(new2pinController.text);
    print(passwoController.text);
    // print(Get.arguments[0].toString());
    // if (oldpinController.text != Get.arguments[1].toString()) {
    //   Get.snackbar('currentPinError'.tr, 'currentPinErrorMsg'.tr);
    //   print('not old');
    //   return;
    // } else    the new password should not equal the old password
    if (new1pinController.text != new2pinController.text) {
      Get.snackbar(
        'newpinError'.tr,
        'NewPin not match'.tr,
        backgroundColor: Color(0XFFFFDDDA),
        icon: Icon(
          Icons.error_sharp,
          color: Color(0xff8e0016),
        ),
      );
      print('not equal');
      return;
    } else if (new1pinController.text == oldpinController.text) {
      Get.snackbar(
          'newpinError'.tr, 'the new pin should not equal the old pin'.tr,
          backgroundColor: Color(0XFFFFDDDA),
          icon: Icon(
            Icons.error_sharp,
            color: Color(0xff8e0016),
          ));
      print('  the new pin should not equal the old pin');
      return;
    } else {
      apiChangePin(
          Global.Gtoken, new1pinController.text, passwoController.text);
    }
  }

  Future apiChangePin(String token, String pin, String pass) async {
    // print("${Get.arguments[1].toString()}");
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Authorization': token.toString(),
    };
    try {
      final http.Response response = await http.post(
        'http://185.194.124.200:8051/api/Account/ChangePinCode',
        headers: header,
        body: jsonEncode(<String, String>{
          "newPinCode": pin,
          "pinCode": oldpinController.text,
          "password": pass
        }),
      );
      print(response.statusCode);
      print(response.body);
      pinModel = PinModel.fromJson(json.decode(response.body));

      Global.timeout(pinModel);
      if (response.statusCode == 200 && pinModel.valid == true) {
        oldpinController.clear();
        new1pinController.clear();
        new2pinController.clear();
        passwoController.clear();
        Get.back();
        Get.back();

        Get.snackbar("  ", 'Pin changed successfully'.tr,
            backgroundColor: Colors.white.withOpacity(0.8),
            icon: Icon(
              Icons.check_circle,
              color: Color(0xff149931),
            ));
      } else if (response.statusCode == 200) {
        Get.back();
        Get.snackbar(('update faild'.tr), 'check  old pin and password'.tr,
            backgroundColor: Color(0XFFFFDDDA),
            icon: Icon(
              Icons.error_sharp,
              color: Color(0xff8e0016),
            ));
      }
    } catch (e) {
      Get.back();
      Get.snackbar(('Error'.tr), '',
          backgroundColor: Color(0XFFFFDDDA),
          icon: Icon(
            Icons.error_sharp,
            color: Color(0xff8e0016),
          ));
      print(e);
    }
  }
}
