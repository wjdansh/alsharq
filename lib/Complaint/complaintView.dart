import 'dart:io';
import 'dart:ui';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../confirmLogin/confirmLoginController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'complaintController.dart';

class sendreport extends StatelessWidget {
  final ComplaintController complaintController =
      Get.put(ComplaintController());

  List _dur = ['9:00-11:00', '11:00-14:00', '14:00-16:00'];
  List _subj = ['Bank Account ', 'Cards', 'Loan'];

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
          backgroundColor: Color(0xff8e0016),
          title: Text(
            'Send Complaint'.tr,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          )),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/back.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          padding: EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 100),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Form(
              key: _formKey,
              child: Container(
                padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                decoration: BoxDecoration(
                  color: Color(0xff585f67).withOpacity(0.6),
                ),
                child:
                    //ListView(shrinkWrap: true,
                    SingleChildScrollView(
                  // physics: NeverScrollableScrollPhysics(),
                  // child: SizedBox(
                  //   height: MediaQuery.of(context).size.height,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      // Image.asset(
                      //   'assets/images/bank.png',
                      //   width: 150,
                      //   height: Get.width / 4,
                      // ),

                      // SizedBox(height: 20),  complaintController   builder: (controller)
                      GetBuilder<ComplaintController>(builder: (controller) {
                        return DropdownButtonFormField<dynamic>(
                          iconSize: 40,
                          isDense: true,
                          iconEnabledColor: Colors.black,
                          iconDisabledColor: Colors.blue,
                          // underline: SizedBox(),
                          decoration: InputDecoration(
                            labelText: 'Preferred time'.tr,
                            border: OutlineInputBorder(),
                            enabledBorder: InputBorder.none,
                          ),

                          isExpanded: true,

                          focusColor: Colors.blue,

                          elevation: 3,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          items: _dur.map((item) {
                            return DropdownMenuItem(
                              child: new Text(item),
                              value: item.toString(),
                            );
                          }).toList(),

                          onChanged: (newVal) {
                            complaintController.updateValuedu(newVal);
                          },

                          value: complaintController.time,
                        );
                        //   ],
                        // );

                        // } else {
                        //   return Text("error");
                        // }
                      }),
                      SizedBox(height: 2),

                      GetBuilder<ComplaintController>(builder: (controller) {
                        return DropdownButtonFormField(
                          iconSize: 40,
                          iconEnabledColor: Colors.black,
                          // iconDisabledColor: Colors.blue,
                          // underline: SizedBox(),
                          decoration: InputDecoration(
                            labelText: 'Complaint subject      '.tr,
                            border: OutlineInputBorder(),
                            enabledBorder: InputBorder.none,
                          ),

                          //  borderSide: BorderSide(color: Colors.white))),

                          isExpanded: true,
                          value: complaintController.sub,

                          elevation: 3,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          items: _subj.map((item) {
                            return DropdownMenuItem(
                              child: Text(item),
                              value: item,
                            );
                          }).toList(),

                          onChanged: (newVall) {
                            complaintController.updateValuesub(newVall);
                          },
                        );
                        //   ],
                        // );
                      }),
                      // SizedBox(height: 10),
                      // SingleChildScrollView(
                      //   scrollDirection: Axis.horizontal,
                      //   child: Column(
                      //     children: <Widget>[
                      //       ListTile(
                      //         title: const Text('Yes'),
                      //         leading: Radio(
                      //           value: 'yes',
                      //           groupValue: complaintController.rad,
                      //           onChanged: (newVal) {
                      //             complaintController.updateValuerad(newVal);
                      //           },
                      //         ),
                      //       ),
                      //       ListTile(
                      //         title: const Text('No'),
                      //         leading: Radio(
                      //           value: 'no',
                      //           groupValue: complaintController.rad,
                      //           onChanged: (newVal) {
                      //             complaintController.updateValuerad(newVal);
                      //           },
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      SizedBox(height: 20),
                      Text(
                        'Complaint'.tr,
                        // textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.white.withOpacity(.7),
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: InputDecoration(
                          fillColor: Colors.grey[200],
                          filled: true,
                          // labelText: 'Complaint',
                          hintText: 'complaint hint'.tr,
                          contentPadding: const EdgeInsets.only(
                              top: 10, bottom: 70, left: 10),
                        ),
                        controller: complaintController.scController,
                        validator: (value) =>
                            value.trim().isEmpty ? 'emptyerror'.tr : null,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Suggestion'.tr,
                        // textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.white.withOpacity(.7),
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: InputDecoration(
                          //isCollapsed: true,
                          fillColor: Colors.grey[200],
                          filled: true,
                          // labelText: 'Complaint',
                          hintText: 'Suggestion hint'.tr,
                          contentPadding: const EdgeInsets.only(
                              top: 10, bottom: 70, left: 10),
                        ),

                        controller: complaintController.ssController,

                        //   validator: (value) =>
                        //   value.isEmpty ? 'Password can\'t be empty' : null,
                        //   onSaved: (value) => _sr = value.trim(),
                        // ),

                        validator: (value) =>
                            value.trim().isEmpty ? 'emptyerror'.tr : null,
                      ),
                      SizedBox(height: 20),
                      MaterialButton(
                        color: Color(0xff8e0016),
                        splashColor: Color(0xff8e0016),
                        height: 50,
                        minWidth: Get.width / 2,
                        child: Text(
                          'Send'.tr,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            if (complaintController.isLoading = true) {
                              showDialog(
                                  builder: (context) => Center(
                                          child: SpinKitFadingCircle(
                                        color: Color(0xff8e0016),
                                      )),
                                  barrierColor: Colors.white.withOpacity(0.5),
                                  context: context);
                            }

                            print('send');
                            print('${complaintController.time}');
                            complaintController.apiComplaint();
                          }
                        },
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      // ),
    );
  }
}
