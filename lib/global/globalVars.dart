import 'package:alsharq/view/dialogView.dart';
import 'package:alsharq/view/test.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

String Gtoken;
String Gpass;
String Gt;
String Gpin;
String Gv;
String id;

timeout(model) {
  if ((model.error != null) && (model.error.errorAr == "TokenNotValid")) {
    Get.back();
    // showCustomDialog show = new showCustomDialog();
    // show.show_dialog(
    //   'Must login again'.tr,
    //   '',
    //   'OK',
    // );
    Get.dialog(
        CustomDialogBox(descriptions: 'Must login again'.tr, B2: 'OK', B1: ''));

    //     Stack(
    //   alignment: Alignment.center,
    //   children: [
    //     Dialog(
    //       backgroundColor: Colors.white.withOpacity(0.9),
    //       shape:
    //           RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    //       elevation: 16,
    //       child: Container(
    //         height: 150.0,
    //         width: 75.0,
    //         child: ListView(
    //           children: <Widget>[
    //             SizedBox(height: 20),
    //             Padding(
    //               padding: const EdgeInsets.all(20.0),
    //               child: Text(
    //                 'Must login again'.tr,
    //                 style: TextStyle(
    //                   fontSize: 20,
    //                 ),
    //               ),
    //             ),
    //             SizedBox(height: 10),
    //             Padding(
    //               padding: EdgeInsets.only(left: 20, right: 20),
    //               child: Container(
    //                 child: FlatButton(
    //                   onPressed: () {
    //                     Get.offAllNamed('/loginView');
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
    //     //   bottom: 400,
    //     Align(
    //       alignment: Alignment(0, -0.2),
    //       child: Image.asset(
    //         'assets/images/Logo-Icon.png',
    //         width: 90,
    //         height: 70,
    //       ),
    //     ),
    //   ],
    // )
    //);
  }
}
