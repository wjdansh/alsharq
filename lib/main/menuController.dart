import 'package:alsharq/MyDashboard/AccountController.dart';
import 'package:alsharq/MyDashboard/StatementsAccuontController.dart';
import 'package:alsharq/log-in/loginController.dart';
import 'package:alsharq/main/mainMenu.dart';
import 'package:get/get.dart';
import '../global/globalVars.dart' as Global;
import 'package:alsharq/confirmLogin/confirmLoginController.dart';
import 'package:get/get.dart';

class menuControl extends GetxController {
  bool sidebarOpen;
  double yOffset;
  double xOffset;
  double pageScale;
  int selectedMenuItem;
  int menuNumber;
  final LoginController _loginController = Get.put(LoginController());
  final AccountsController _accountControlle = Get.put(AccountsController());
  //final confirmController _confimC = Get.put(confirmController());

  @override
  Future<void> onInit() async {
    sidebarOpen = false;
    yOffset = 0;
    xOffset = 0;
    pageScale = 1;
    selectedMenuItem = 0;
    menuNumber = 0;
    _accountControlle.onInit();
    super.onInit();
  }

  void setSidebarState() {
    sidebarOpen = !sidebarOpen;
    xOffset = (sidebarOpen && _loginController.lan == 'Arabic')
        ? -150
        : ((sidebarOpen && _loginController.lan == 'English') || sidebarOpen)
            ? 265
            : 0;
    yOffset = sidebarOpen ? 90 : 0;
    pageScale = sidebarOpen ? 0.7 : 1;
    update();
  }

  void ChangeNumber(intX) {
    menuNumber = intX;
    update();
  }
}
