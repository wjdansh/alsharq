import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../global/globalVars.dart' as Global;
import 'dart:convert';
import 'package:get/route_manager.dart';
import 'package:get/get.dart';
import 'MesssageModel.dart';

class MessageController extends GetxController {
  TextEditingController messController = new TextEditingController();
  String sc;
  bool isLoading;
  MesssageModel messageModel;
  Datam messageListData;
  // bool isLoading = false;

  @override
  void onInit() {
    messController = TextEditingController();
    isLoading = true;
    super.onInit();
  }

  Future apiMessage() async {
    // print("${Get.arguments[1].toString()}");
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Authorization': Global.Gtoken,
    };
    try {
      final http.Response response = await http.post(
        'http://185.194.124.200:8051/api/ClientOperation/MessageToBank',
        headers: header,
        body: jsonEncode(<String, dynamic>{
          "id": 0,
          "messageContent": messController.text,
          "reply": "string",
          "state": 0,
          "createDate": "string"
        }),
      );
      print(response.statusCode);
      print('{$messController.text}');

      print(response.body);
      isLoading = false;
      messageModel = MesssageModel.fromJson(json.decode(response.body));
      // isLoading(false);
      messageListData = messageModel.data;
      Global.timeout(messageModel);

      if (response.statusCode == 200 && messageModel.valid == true) {
        messController.clear();
        Get.back();
        Get.back();
        Get.snackbar('Message sent successfully'.tr, '',
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
