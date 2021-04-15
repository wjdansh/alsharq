import 'dart:io';
import 'dart:ui';
import 'package:alsharq/ChangePassword/passController.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

import '../confirmLogin/confirmLoginController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../global/globalVars.dart' as Global;

class fPassView extends StatelessWidget {
  final passController passwwController = Get.put(passController());

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
          backgroundColor: Color(0xff8e0016),
          title: Text(
            'Change Password'.tr,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          )),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/back.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          padding: EdgeInsets.only(left: 20, right: 20, top: 80, bottom: 100),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Container(
                  padding: EdgeInsets.only(top: 40, left: 10, right: 10),
                  decoration: BoxDecoration(
                    color: Color(0xff585f67).withOpacity(0.6),
                  ),
                  child:
                      //ListView(shrinkWrap: true,
                      SingleChildScrollView(
                    // physics: NeverScrollableScrollPhysics(),
                    // child: SizedBox(
                    //height: MediaQuery.of(context).size.height,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        // Image.asset(
                        //   'assets/images/bank.png',
                        //   width: 150,
                        //   height: Get.width / 4,
                        // ),

                        Text(
                          'New Password'.tr,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white.withOpacity(.7),
                            fontSize: 20,
                          ),
                        ),

                        SizedBox(height: 10),
                        passWordInput(
                          passwordController:
                              passwwController.new1passwordTextController,
                          // textHint: 'hintNewPass1'.tr
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Confirm New Password'.tr,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white.withOpacity(.7),
                            fontSize: 20,
                          ),
                        ),

                        SizedBox(height: 10),
                        passWordInput(
                          passwordController:
                              passwwController.new2passwordTextController,
                          // textHint: 'hintNewPass2'.tr
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Pin'.tr,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white.withOpacity(.7),
                            fontSize: 20,
                          ),
                        ),

                        SizedBox(height: 10),
                        passWordInput(
                          passwordController:
                              passwwController.pinTextController,
                          // textHint: 'hintNewPass2'.tr
                        ),
                        SizedBox(height: 16),

                        // SizedBox(height: 10),
                        // TextFormField(
                        //   keyboardType: TextInputType.text,
                        //
                        //   decoration: InputDecoration(
                        //     fillColor: Colors.grey[200],
                        //     filled: true,
                        //     // labelText: 'Complaint',
                        //     hintText: 'Write Your Message Here.....'.tr,
                        //     contentPadding: const EdgeInsets.only(
                        //         top: 10, bottom: 150, left: 10),
                        //   ),
                        //
                        //   controller: _messageController.messController,
                        //
                        //   //   validator: (value) =>
                        //   //   value.isEmpty ? 'Password can\'t be empty' : null,
                        //   //   onSaved: (value) => _sr = value.trim(),
                        //   // ),
                        //
                        //   validator: (value) => value.trim().isEmpty
                        //       ? 'please fill the fields'.tr
                        //       : null,
                        // ),
                        // SizedBox(height: 16),

                        MaterialButton(
                          color: Color(0xff8e0016),
                          splashColor: Color(0xff8e0016),
                          height: 50,
                          minWidth: Get.width / 2,
                          child: Text(
                            'Next'.tr,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              print('send');
                              Global.Gpass = passwwController
                                  .new1passwordTextController.text;
                              Global.Gpin =
                                  passwwController.pinTextController.text;
                              Global.Gv = 'false';
                              {
                                Get.toNamed('/allQuestions', //loginView
                                    arguments: [
                                      Global.Gt,
                                      Global.Gpass,
                                      //passController.new1passwordTextController,
                                      Global.Gv,
                                      //Global.Gpass,
                                      Global.Gpin
                                    ]);
                              }
                              //  passController.submitNewQ();}
                              // passwwController.oldpasswordTextController
                              //     .clear();
                              // passwwController.new1passwordTextController
                              //     .clear();
                              // passwwController.new2passwordTextController
                              //     .clear();
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
      ),
      // ),
    );
  }
}

class passWordInput extends StatefulWidget {
  TextEditingController passwordController;
  String textHint;
  passWordInput({@required this.passwordController, this.textHint});

  @override
  _passWordInputState createState() => _passWordInputState();
}

class _passWordInputState extends State<passWordInput> {
  @override
  Widget build(BuildContext context) {
    bool passwordVisibility = true;
    return TextFormField(
      autofocus: true,
      decoration: InputDecoration(
          fillColor: Colors.grey[200],
          filled: true,
          suffixIcon: IconButton(
              icon: Icon(passwordVisibility == true
                  ? Icons.visibility
                  : Icons.visibility_off),
              onPressed: () {
                setState(() {
                  passwordVisibility = !passwordVisibility;
                });
              })),

      obscureText: passwordVisibility,
      controller: widget.passwordController,
      // decoration: InputDecoration(
      //   //isCollapsed: true,
      //   fillColor: Colors.grey[200],
      //   filled: true,
      //   hintText: textHint.tr,
      // ),
      validator: (value) => value.trim().isEmpty ? 'emptyerror'.tr : null,
    );
  }
}
