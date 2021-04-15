import 'package:flutter/cupertino.dart';
import '../Complaint/complaintModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../global/globalVars.dart' as Global;
import 'dart:convert';
import 'package:get/route_manager.dart';
import 'package:get/get.dart';

import 'complaintModel.dart';

class ComplaintController extends GetxController {
  TextEditingController scController;

  TextEditingController ssController;
  bool isLoading;
  String time;
  String sub;
  String rad;
  String dd = Get.arguments[1].toString();

  // Data userListData;
  ComplaintModel complaintModel;
  Dataa complaintListData;

  @override
  void onInit() {
    scController = TextEditingController();
    ssController = TextEditingController();
    isLoading = true;
    super.onInit();
  }

  void updateValuedu(String newVal) {
    time = newVal;
    // update();
  }

  void updateValuesub(String newVal) {
    sub = newVal;
    update();
  }

  void updateValuerad(newVal) {
    rad = newVal;
    //update();
  }

  Future apiComplaint() async {
    print("${Global.Gtoken}");
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Authorization': Global.Gtoken,
    };

    try {
      final http.Response response = await http.post(
        'http://185.194.124.200:8051/api/ClientOperation/Complaint',
        headers: header,
        body: jsonEncode(<String, dynamic>{
          'id': 0,
          'subject': sub,
          'complaintContent': scController.text,
          'state': 1,
          'createDate': 'nn',
          'suggestionContnet': ssController.text,
          'firstComplaint': true,
          'preferredTime': time,
        }),
      );
      time == null
          ? {
              Get.back(),
              // ignore: unnecessary_statements
              Get.snackbar('Error'.tr, 'Select time for contact'.tr,
                  backgroundColor: Color(0XFFFFDDDA),
                  icon: Icon(
                    Icons.error_sharp,
                    color: Color(0xff8e0016),
                  ))
            }
          : print(response.statusCode);
      sub == null
          ? {
              Get.back(),
              // ignore: unnecessary_statements
              Get.snackbar('Error'.tr, 'Select complaint subject'.tr,
                  backgroundColor: Color(0XFFFFDDDA),
                  icon: Icon(
                    Icons.error_sharp,
                    color: Color(0xff8e0016),
                  ))
            }
          : print(response.statusCode);
      print(response.body);
      isLoading = false;
      complaintModel = ComplaintModel.fromJson(json.decode(response.body));
      // isLoading(false);
      complaintListData = complaintModel.data;
      //Global.Gtoken = complaintListData.token as RxString;
      Global.timeout(complaintModel);

      if (response.statusCode == 200 && complaintModel.valid == true) {
        scController.clear();
        ssController.clear();
        Get.back();
        Get.back();
        Get.snackbar('complaint sent successfully'.tr, "",
            backgroundColor: Colors.white.withOpacity(0.8),
            icon: Icon(
              Icons.check_circle,
              color: Color(0xff149931),
            ));
        // arguments: [

        //   // Get.arguments[0].toString(),
        //   Get.arguments[2].toString(),
        //   // userListData.token.toString()
        //    ]
        // );
      }
    } catch (e) {
      Get.back();

      Get.snackbar('Error'.tr, 'Not Send'.tr,
          backgroundColor: Color(0XFFFFDDDA),
          icon: Icon(
            Icons.error_sharp,
            color: Color(0xff8e0016),
          ));
      print(e);
    }
  }
}
