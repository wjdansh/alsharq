// import 'package:alsharq/confirmLogin/confirmLoginController.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class logout extends StatelessWidget {
//   final confirmController confimCont = Get.put(confirmController());
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         child: showDialog(
//               context: context,
//               child: AlertDialog(
//                 title: Text('LogOut'),
//                 content: Text('Do you want to exit this application?'),
//                 actions: <Widget>[
//                   FlatButton(
//                     onPressed: () {
//                       print("you choose no");
//                       // Navigator.of(context).pop(false);
//                       Get.back();
//                     },
//                     child: Text('No'),
//                   ),
//                   FlatButton(
//                     onPressed: () {
//                       //confimCont.removeSF();
//                       Get.toNamed('/loginView');
//                     },
//                     child: Text('Yes'),
//                   ),
//                 ],
//               ),
//             ) ??
//             false);
//   }
// }
