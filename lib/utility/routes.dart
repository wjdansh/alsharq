import 'package:alsharq/ChangePIN/pinchView.dart';
import 'package:alsharq/ChangePassword/passView.dart';
import 'package:alsharq/LogOut/logOut.dart';

import 'package:alsharq/Message/MesssageView.dart';
import 'package:alsharq/MyDashboard/StatementsAccountView.dart';
import 'package:alsharq/MyDashboard/AccountsView.dart';
import 'package:alsharq/ResetPassword/resetPassView.dart';
import 'package:alsharq/allQuestions/fpassView.dart';

import '../main/aminatedContent.dart';
import '../Complaint/complaintView.dart';

import '../allQuestions/allQuestionsView.dart';
import '../confirmLogin/confirmLoginView.dart';
import '../log-in/loginView.dart';
import 'package:get/get.dart';
import '../first-time/firstTimeView.dart';
import '../view/splash.dart';
import '../main/mainMenu.dart';

class viewsRouter {
  static final route = [
    GetPage(
      name: '/SplashScreen',
      page: () => SplashScreen1(),
    ),
    GetPage(
      name: '/loginView',
      page: () => logInView(),
    ),
    GetPage(
      name: '/firtTimepass',
      page: () => newPassword(),
    ),
    GetPage(
      name: '/allQuestions',
      page: () => questions(),
    ),
    GetPage(
      name: '/confirm',
      page: () => confirmLogin(),
    ),
    GetPage(
      name: '/mainMenu',
      page: () => dashBoard(),
    ),
    GetPage(
      name: '/changePass',
      page: () => PassView(),
    ),
    GetPage(
      name: '/fPass',
      page: () => fPassView(),
    ),

    GetPage(
      name: '/changePin',
      page: () => PinView(),
    ),

    GetPage(
      name: '/MyAccount',
      page: () => MyAccount(),
    ),

    GetPage(
      name: '/Mydashboard',
      page: () => Mydashboard(),
    ),
    // GetPage(
    //   name: '/complaint',
    //   page: () => complaintMSG(),
    // ),
    // GetPage(
    //   name: '/accounts',
    //   page: () => accountsAll(),
    // ),

    GetPage(
      name: '/animat',
      page: () => animatedContent(),
    ),

    GetPage(
      name: '/sendreport',
      page: () => sendreport(),
    ),
    GetPage(
      name: '/MassegeView',
      page: () => MassegeView(),
    ),

    GetPage(
      name: '/ResetPass',
      page: () => ResetPass(),
    ),
  ];
}
