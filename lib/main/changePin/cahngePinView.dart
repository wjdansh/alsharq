// import 'package:flutter/material.dart';
// import 'dart:ui';
// import 'package:get/get.dart';
// import 'changePinController.dart';
//
// class changePinCode extends StatelessWidget {
//   final _formKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: SingleChildScrollView(
//           child: Container(
//             padding: EdgeInsets.only(left: 20, right: 20, top: 80, bottom: 100),
//             child: Form(
//               key: _formKey,
//               child: Container(
//                 padding: EdgeInsets.only(left: 10, right: 10),
//                 child: SizedBox(
//                   height: MediaQuery.of(context).size.height,
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: <Widget>[
//                       SizedBox(height: 20),
//                       Text(
//                         'Change PIN',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 22,
//                         ),
//                       ),
//                       SizedBox(height: 10),
//                       passWordInput(
//                         passwordController:
//                             _changeController.passwordController,
//                         textHint: 'oldpassHint'.tr,
//                       ),
//                       SizedBox(height: 16),
//                       TextFormField(
//                         textAlign: TextAlign.center,
//                         controller: _changeController.pinController,
//                         decoration: InputDecoration(
//                           fillColor: Colors.grey[200],
//                           filled: true,
//                           hintText: 'Pincode'.tr,
//                         ),
//                         validator: (value) =>
//                             value.trim().isEmpty ? ' required' : null,
//                       ),
//                       TextFormField(
//                         textAlign: TextAlign.center,
//                         controller: _changeController.pinController,
//                         decoration: InputDecoration(
//                           fillColor: Colors.grey[200],
//                           filled: true,
//                           hintText: 'Pincode'.tr,
//                         ),
//                         validator: (value) =>
//                             value.trim().isEmpty ? ' required' : null,
//                       ),
//                       SizedBox(height: 16),
//                       MaterialButton(
//                         color: Color(0xff8e0016),
//                         splashColor: Color(0xff8e0016),
//                         height: 50,
//                         minWidth: Get.width / 2,
//                         child: Text(
//                           'Change PIN',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 20,
//                           ),
//                         ),
//                         onPressed: () => _changeController.apiChangePin(),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class passWordInput extends StatelessWidget {
//   TextEditingController passwordController;
//   String textHint;
//   passWordInput({@required this.passwordController, @required this.textHint});
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       textAlign: TextAlign.center,
//       obscureText: true,
//       controller: passwordController,
//       decoration: InputDecoration(
//         fillColor: Colors.grey[200],
//         filled: true,
//         hintText: textHint.tr,
//       ),
//       validator: (value) => value.trim().isEmpty ? 'pass required' : null,
//     );
//   }
// }
