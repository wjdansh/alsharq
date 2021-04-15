// import 'package:flutter/material.dart';
// import 'dart:ui';
// import 'package:get/get.dart';
//
// import 'complaintCotroller.dart';
//
// class complaint extends StatelessWidget {
//   final _formKey = GlobalKey<FormState>();
//   final complaintControl _complaintControl = Get.put(complaintControl());
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: SingleChildScrollView(
//           child: Container(
//             padding: EdgeInsets.only(right: 20, top: 80, bottom: 100),
//             child: Form(
//               key: _formKey,
//               child: Container(
//                 padding: EdgeInsets.only(top: 40, left: 10, right: 10),
//                 child: SizedBox(
//                   height: MediaQuery.of(context).size.height,
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: <Widget>[
//                       SizedBox(height: 20),
//                       Text(
//                         'Complaint',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 22,
//                         ),
//                       ),
//                       TextFormField(
//                         textAlign: TextAlign.center,
//                         controller: _complaintControl.subjectController,
//                         decoration: InputDecoration(
//                           fillColor: Colors.grey[200],
//                           filled: true,
//                           hintText: 'Subject',
//                         ),
//                         validator: (value) =>
//                             value.trim().isEmpty ? ' required' : null,
//                       ),
//                       SizedBox(height: 10),
//                       TextFormField(
//                         controller: _complaintControl.complaintController,
//                         minLines: 6,
//                         keyboardType: TextInputType.multiline,
//                         maxLines: null,
//                       ),
//                       TextFormField(
//                         controller: _complaintControl.suggestController,
//                         minLines: 6,
//                         keyboardType: TextInputType.multiline,
//                         maxLines: null,
//                       ),
//                       SizedBox(height: 16),
//                       TextFormField(
//                         textAlign: TextAlign.center,
//                         controller: _complaintControl.preferTimeController,
//                         decoration: InputDecoration(
//                           fillColor: Colors.grey[200],
//                           filled: true,
//                           hintText: 'Prefered Time',
//                         ),
//                         validator: (value) =>
//                             value.trim().isEmpty ? ' required' : null,
//                       ),
//                       SizedBox(height: 16),
//                       Obx(
//                         () => CheckboxListTile(
//                           controlAffinity: ListTileControlAffinity.leading,
//                           title: Text('First Time'),
//                           value: _complaintControl.checkedBox,
//                           onChanged: (value) {
//                             _complaintControl.checkedBox =
//                                 !_complaintControl.checkedBox;
//                           },
//                         ),
//                       ),
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
//                         onPressed: () => _complaintControl.apiComplaint(),
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
