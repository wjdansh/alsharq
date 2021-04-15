import 'package:alsharq/log-in/loginModel.dart';
import 'package:alsharq/view/dialogView.dart';
import 'package:alsharq/view/test.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../global/globalVars.dart' as Global;
import 'dart:convert';
import 'dart:async';
import 'package:get/route_manager.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class confirmController extends GetxController {
  TextEditingController otpTextController;
  logInUserModel logUserModel;
  Data userListData;
  bool isLoading;
  String PIN;
  Timer timeout;

  int percent = 0;
  Timer timer;
  // String token;
  showCustomDialog show = new showCustomDialog();

  @override
  void onInit() {
    otpTextController = TextEditingController();
    isLoading = true;
    timeout = null;
    super.onInit();
  }

  Future apiConfirm() async {
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Authorization': Global.Gt,
    };
    try {
      final http.Response response = await http.post(
        'http://185.194.124.200:8051/api/Account/ConfirmLogin?Otp=${otpTextController.text.toString()}',
        headers: header,
        // body: jsonEncode(<String, String>{
        //   'Otp': otpTextController.text,
        // }),
      );
      print(response.statusCode);
      print(response.body);
      logUserModel = logInUserModel.fromJson(json.decode(response.body));
      isLoading = false;
      userListData = logUserModel.data;

      Global.timeout(logUserModel);

      if (logUserModel.valid == true) {
        await addStringToSF();
        Global.Gtoken = await getStringValuesSF();
        print('token ${await getStringValuesSF()}');

        Global.Gpin = PIN;
        Global.Gv = 'true';

        Get.offAllNamed('/mainMenu', arguments: [
          Global.Gpass,
          Global.Gtoken,
          Global.Gv,
          //Global.Gpin,
          //userListData.token.toString(),
          // getStringValuesSF(),
        ]);
        timeout = Timer(Duration(minutes: 5), removeSF);
      } else {
        Get.back();
        Get.snackbar('OTP not valid'.tr, '',
            //  backgroundColor: Color(0xff8e0016).withOpacity(0.2)

            backgroundColor: Color(0XFFFFDDDA),
            icon: Icon(
              Icons.error_sharp,
              color: Color(0xff8e0016),
            ));
      }
    } catch (e) {
      Get.back();
      Get.snackbar('Error'.tr, 'OTP not valid'.tr,
          //backgroundColor: Color(0xff8e0016).withOpacity(0.2)

          backgroundColor: Color(0XFFFFDDDA),
          icon: Icon(
            Icons.error_sharp,
            color: Color(0xff8e0016),
          ));
      print(e);
    }
  }

  addStringToSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // String tok = jsonEncode(userListData.token);
    prefs.setString('token', userListData.token.toString());
  }

  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String token = prefs.getString('token');
    //ttt = token.toString();

    if (token != null && token.isNotEmpty) {
      return token; //json.decode(token)
    } else
      return null;
  }

  void removeSF() async {
    Global.Gt = null;
    Global.Gtoken = null;
    Global.Gpass = null;
    timeout = null;
    //await getStringValuesSF();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();

    Get.offAllNamed('/loginView');

    show.show_dialog(
      Get.context,
      'timeout mess'.tr,
      'OK',
      '',
    );

    // Get.dialog(
    //     CustomDialogBox(descriptions: 'timeout mess'.tr, B2: 'OK', B1: ''));

    //     Stack(
    //   alignment: Alignment.center,
    //   children: [
    //     Dialog(
    //       backgroundColor: Colors.white.withOpacity(0.9),
    //       shape:
    //           RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    //       elevation: 16,
    //       child: Container(
    //         height: 175.0,
    //         width: 75.0,
    //         child: ListView(
    //           children: <Widget>[
    //             SizedBox(height: 20),
    //             Padding(
    //               padding: const EdgeInsets.all(20.0),
    //               child: Text(
    //                 'timeout mess'.tr,
    //                 style: TextStyle(
    //                   fontSize: 18,
    //                 ),
    //               ),
    //             ),
    //             // SizedBox(height: 10),
    //             Padding(
    //               padding: EdgeInsets.only(left: 20, right: 20, top: 20),
    //               child: Container(
    //                 child: FlatButton(
    //                   onPressed: () {
    //                     Get.back();
    //                     // Get.offAllNamed('/loginView');
    //                   },
    //                   child: Text(
    //                     ' OK'.tr,
    //                     textAlign: TextAlign.left,
    //                     style: TextStyle(
    //                       color: Color(0xff8e0016).withOpacity(0.7),
    //                       fontSize: 20,
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //     // Positioned(
    //     //   right: 155,
    //     //   bottom: 410,
    //     Align(
    //       alignment: Alignment(0, -0.25),
    //       child: Image.asset(
    //         'assets/images/Logo-Icon.png',
    //         width: 90,
    //         height: 70,
    //       ),
    //     ),
    //   ],
    // ));
  }

  @override
  void dispose() {
    timeout.cancel();
    super.dispose();
  }
}
