import 'dart:ui';
import 'dart:async';
import 'package:alsharq/confirmLogin/confirmLoginController.dart';
import 'package:alsharq/utility/routes.dart';
import 'package:alsharq/view/dialogView.dart';
import 'package:alsharq/view/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../global/globalVars.dart' as Global;

class MenuItem extends GetxController //StatelessWidget
{
  // final String itemText;
  // final String itemIcon;
  // final int selected;
  // final int position;
  // final String linkedPath;
  // final String ontap;
  // MenuItem(
  //     {this.itemText,
  //     this.itemIcon,
  //     this.selected,
  //     this.linkedPath,
  //     this.position,
  //     this.ontap});

  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     child: Row(
  //       children: <Widget>[
  //         Container(
  //             padding: const EdgeInsets.all(20),
  //             child: Image.asset("assets/images/$itemIcon.png")),

  // Container(
  //   padding: const EdgeInsets.all(20),
  //   child: GestureDetector(
  //     child: Text(
  //       itemText,
  //       style: TextStyle(
  //           color: Colors.white,
  //           fontSize: 18,
  //           fontWeight: FontWeight.w900),
  //     ),
  //     onTap: () {
  //       return Navigator.of(context).pushNamed(ontap);
  //     },
  //   ),
  // )
  //     ],
  //   ),
  // );
  //}

  ListTile buildMenuItem(IconData icon, String title, int index, String s,
      {double opacity = 0.3, Color color: Colors.black}) {
    // final _formKey = GlobalKey<FormState>();
    //  final confirmController confimCont = Get.put(confirmController());
    // final navigatorKey = GlobalKey<NavigatorState>();
    // final context = navigatorKey.currentState.overlay.context;
    // navigatorKey.currentState.overlay.insert(anyDialog);

    return ListTile(
      //selected: index == _selectedIndex,
      // tileColor: Colors.white,

      //hoverColor: Colors.teal,
      onTap: () async {
        Global.Gv = 'true';
        if (index == 3) {
          showCustomDialog show = new showCustomDialog();
          //   // Get.dialog(
          //   await Future.delayed(
          //       Duration.zero,
          //       () =>
          show.show_dialog(
            Get.context,
            'Do you want to exit this application?'.tr,
            'No'.tr,
            'Yes'.tr,
            //  )
          );

          // );

          // Get.dialog(
          //   CustomDialogBox(
          //     descriptions: 'Do you want to exit this application?'.tr,
          //     B2: 'Yes'.tr,
          //     B1: 'No'.tr,
          //   ),
          // );
          //   AspectRatio(
          // aspectRatio: 1 / 2,
          // child:
          // Stack(alignment: Alignment.center, children: [
          //   Dialog(
          //     backgroundColor: Colors.white.withOpacity(0.9),
          //     shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(20)),
          //     elevation: 16,
          //     child: Container(
          //       height: 175.0,
          //       width: 75.0,
          //       child: ListView(
          //         children: <Widget>[
          //           SizedBox(height: 20),
          //           Padding(
          //             padding: const EdgeInsets.all(20.0),
          //             child: Text(
          //               'Do you want to exit this application?'.tr,
          //               style: TextStyle(
          //                 fontSize: 18,
          //               ),
          //             ),
          //           ),
          //           // SizedBox(height: 10),
          //           Padding(
          //             padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          //             child: Container(
          //               child: Row(
          //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                 children: [
          //                   FlatButton(
          //                     onPressed: () {
          //                       Get.back();
          //                     },
          //                     child: Text(
          //                       'No'.tr,
          //                       style: TextStyle(
          //                         color: Color(0xff8e0016).withOpacity(0.7),
          //                         fontSize: 16,
          //                       ),
          //                     ),
          //                   ),
          //                   FlatButton(
          //                     onPressed: () {
          //                       Get.offAllNamed('/loginView');
          //                     },
          //                     child: Text(
          //                       'Yes'.tr,
          //                       style: TextStyle(
          //                         color: Color(0xff8e0016).withOpacity(0.7),
          //                         fontSize: 16,
          //                       ),
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          //   Align(
          //     alignment: Alignment(0, -0.25),
          //     // right: Get.width / 3.5,
          //     // // left: Get.width / 4,
          //     // top: Get.height / 3,
          //     // bottom: Get.height / 5,
          //     child: Image.asset(
          //       'assets/images/Logo-Icon.png',
          //       width: 90,
          //       height: 70,
          //     ),
          //   ),
          // ]),
          //)
          // );
          //  await confimCont.removeSF();
          // Get.dialog(
          //   //   Dialog(
          //   // child: Alert
          //         Dialog(
          //     title: Text('LogOut'),
          //     content: Text('Do you want to exit this application?'),
          //     actions: <Widget>[
          //       FlatButton(
          //         onPressed: () {
          //           print("you choose no");
          //           // Navigator.of(context).pop(false);
          //           Get.back();
          //         },
          //         child: Text('No'),
          //       ),
          //       FlatButton(
          //         onPressed: () {
          //           //confimCont.removeSF();
          //           Get.toNamed('/loginView');
          //         },
          //         child: Text('Yes'),
          //       ),
          //     ],
          //   ),
          // ));
          // Get.offAllNamed(s, arguments: [
          //   Global.Gpass,
          //   Global.Gtoken,
          //   Global.Gv,
          // ]);

          // showDialog(
          //     builder: (context) => Center(
          //             child: SpinKitFadingCircle(
          //           color: Color(0xff8e0016),
          //         )),
          //     barrierColor: Colors.white.withOpacity(0.5),
          //     context: Get.context);
          // dispose();
        }

        //??
        // false
        else
          Get.toNamed(s, arguments: [
            Global.Gpass,
            Global.Gtoken,
            Global.Gv,
          ]);
        // Navigator.pushNamed(
        //     context,
        //   MaterialPageRoute(builder: (context) => Account()),);

        // colorp = (_color=true )? Colors.teal:Colors.black;
        //});
      },

      leading: Icon(
        icon,
        size: 30.0,
        color: Colors.white,
      ),

      contentPadding: (EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0)),
      title: Text(title,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
              color: Colors.white)),
    );
    //     ),
    //   ),
    // );
  }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  // }
}
