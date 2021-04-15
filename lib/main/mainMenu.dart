import 'dart:async';

import 'package:alsharq/LogOut/logOut.dart';
import 'package:alsharq/log-in/loginController.dart';
import 'package:alsharq/utility/langServices.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'aminatedContent.dart';
import 'manuItems.dart';
import 'menuController.dart';

class dashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [
                0.1,
                0.4,
                0.6,
                0.9
              ],
              colors: [
                Color(0xff1f544c),
                Color(0xff204e5b),
                Color(0xff204d64),
                Color(0xff24487c),
              ]),
        ),
        child: AppContainer(),
      ),
    );
  }
}

class AppContainer extends StatefulWidget {
  // @override
//   _AppContainerState createState() => _AppContainerState();
// }

// class _AppContainerState extends State<AppContainer> {
  @override
  _AppContainerState createState() => _AppContainerState();
}

class _AppContainerState extends State<AppContainer> {
  final menuControl _menuContoller = Get.put(menuControl());

  final MenuItem manuitem = MenuItem();

  final List<String> menuItems = [
    'Change Password'.tr,
    'Change Pin'.tr,
    'Change Questions'.tr,
    'LogOut'.tr
  ];

  final List<IconData> menuIcons = [
    Icons.settings,
    Icons.settings,
    Icons.settings,
    Icons.logout
  ];

  final LoginController _loginController = Get.put(LoginController());

  LocalizationService tran = new LocalizationService();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                //Side bar Items
                Align(
                  alignment: Alignment.bottomLeft,
                  child: DropdownButtonHideUnderline(
                    child: Padding(
                      padding:
                          // const
                          EdgeInsets.only(
                        top: 50,
                        left: 10,
                        // left: MediaQuery.of(context).size.width / 5,
                        // right: MediaQuery.of(context).size.height / 3,
                      ),
                      // alignedDropdown: true,
                      child: DropdownButton<dynamic>(
                        hint: Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 30),
                          child: Text('AR\nEN',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white)),
                        ),
                        // isExpanded: true,
                        underline: SizedBox(),
                        icon:
                            Icon(Icons.language, color: Colors.white, size: 25),
                        onChanged: (val) {
                          _menuContoller.setSidebarState();
                          Get.offAllNamed('/mainMenu');
                          setState(() {
                            _loginController.lan = val;
                            tran.change(_loginController.lan);
                          });
                          //Timer(Duration(seconds: 3), v(val));

                          print('22  ${_loginController.lan}');
                        },
                        items: tran.langs.map((item) {
                          return DropdownMenuItem(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Icon(item == 'Arabic'
                                //     ?
                                Container(
                                  width: 25,
                                  height: 40,
                                  child: item == 'Arabic'
                                      ? Image.asset("assets/images/sy.jpg")
                                      : Image.asset("assets/images/en.jpg"),
                                ),
                                Text(item),
                              ],
                            ),
                            value: item.toString(),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Expanded(
                    child: new ListView.builder(
                      itemCount: menuItems.length,
                      itemBuilder: (context, index) => GetBuilder<menuControl>(
                        builder: (controller) {
                          return GestureDetector(
                            onTap: () {
                              _menuContoller.sidebarOpen = false;
                              _menuContoller.selectedMenuItem = index;
                              _menuContoller.setSidebarState();
                              _menuContoller.ChangeNumber(
                                  _menuContoller.selectedMenuItem);
                              print('menu taped');
                            },
                            child: manuitem.buildMenuItem(
                              menuIcons[index],
                              menuItems[index],
                              //selected:_menuContoller.selectedMenuItem,
                              //position:
                              index,
                              // ontap:

                              index == 0
                                  ? '/changePass'
                                  : index == 1
                                      ? '/changePin'
                                      : index == 2
                                          ? '/allQuestions'
                                          : '/loginView',
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),

                //sideBar Bottom
                Container(
                    padding: EdgeInsets.only(bottom: 20),
                    alignment: Alignment.bottomCenter,
                    child: RichText(
                      text: TextSpan(
                        text: 'Developed by ',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Madarat',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(
          //     left:(Get.width)/3,
          //   ),
          // Align(
          //   alignment: Alignment.topRight,
          //   child: DropdownButtonHideUnderline(
          //     child: Padding(
          //       padding:
          //           // const
          //           EdgeInsets.only(
          //         top: 50,
          //         bottom: 50,
          //         left: MediaQuery.of(context).size.height / 10,
          //         right: MediaQuery.of(context).size.height / 3,
          //       ),
          //       // alignedDropdown: true,
          //       child: DropdownButton<dynamic>(
          //         hint: Text('AR\nEN',
          //             style: TextStyle(fontSize: 16, color: Colors.white)),
          //         isExpanded: true,
          //         underline: SizedBox(),
          //         icon: Icon(
          //           Icons.language,
          //           color: Colors.white,
          //           size: 30,
          //         ),
          //         onChanged: (val) {
          //           _menuContoller.setSidebarState();
          //           Get.offAllNamed('/mainMenu');
          //           setState(() {
          //             _loginController.lan = val;
          //             tran.change(_loginController.lan);
          //           });
          //           //Timer(Duration(seconds: 3), v(val));
          //
          //           print('22  ${_loginController.lan}');
          //         },
          //         items: tran.langs.map((item) {
          //           return DropdownMenuItem(
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 // Icon(item == 'Arabic'
          //                 //     ?
          //                 Container(
          //                   width: 25,
          //                   height: 40,
          //                   child: item == 'Arabic'
          //                       ? Image.asset("assets/images/sy.jpg")
          //                       : Image.asset("assets/images/en.jpg"),
          //                 ),
          //                 Text(item),
          //               ],
          //             ),
          //             value: item.toString(),
          //           );
          //         }).toList(),
          //       ),
          //     ),
          //   ),
          // ),
          //  ),
          // Obx(
          //   () =>
          animatedContent(),
          //   //  changePassPassword()
          //   //    complaintMSG()
          //   //  changePinCode()
          //   //  accountsAll()
          // ),
        ],
      ),
    );
  }
}
