import 'package:alsharq/confirmLogin/confirmLoginController.dart';
import 'package:alsharq/first-time/firstTimeView.dart';
import 'package:alsharq/main/aminatedContent.dart';
import 'package:alsharq/view/test.dart';
import 'package:get/get.dart';

import '../log-in/loginView.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';
//import '../global/globalVars.dart' as Global;

import 'package:shared_preferences/shared_preferences.dart';

import '../main/mainMenu.dart';

final confirmController _confimC = Get.put(confirmController());

class SplashScreen1 extends StatelessWidget {
  static const String id = 'splash_screen';

  @override
  Widget build(BuildContext context) {
    // print(' 11 ${f}');
    // print (' 1122 ${ _confimC.getStringValuesSF()}');
    //
    // gg() async {
    //   // f = await _confimC.getStringValuesSF();
    //   SharedPreferences prefs = await SharedPreferences.getInstance();
    //
    //   String f = prefs.getString('token');
    //
    //   return f;
    // }

    //print(' 11 ${gg()}');
    return SplashScreen(
      seconds: 2,

      navigateAfterSeconds: new logInView(),
      // gg() != null ? new dashBoard() : new logInView(),
      //animatedContent(),
      //dashBoard(),
      // newPassword(),

      title: new Text(
        'Al Sharq Bank',
        textScaleFactor: 2,
      ),
      image: Image.asset('assets/images/bank.png'),
      loadingText: Text("Starting....."),
      photoSize: 100.0,
      loaderColor: Color(0xff8e0016),
    );
  }
}
