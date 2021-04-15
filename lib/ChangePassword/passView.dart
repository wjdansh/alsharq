import 'dart:ui';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../global/globalVars.dart' as Global;
import 'passController.dart';

class PassView extends StatelessWidget {
  final passController passwoController = Get.put(passController());

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
                          'Old Password'.tr,
                          style: TextStyle(
                            color: Colors.white.withOpacity(.7),
                            fontSize: 20,
                          ),
                        ),

                        SizedBox(height: 10),
                        passWordInput(
                            passwordController:
                                passwoController.oldpasswordTextController,
                            Type: TextInputType.text),
                        SizedBox(height: 16),
                        Text(
                          'New Password'.tr,
                          style: TextStyle(
                            color: Colors.white.withOpacity(.7),
                            fontSize: 20,
                          ),
                        ),

                        SizedBox(height: 10),
                        passWordInput(
                            passwordController:
                                passwoController.new1passwordTextController,
                            Type: TextInputType.text),
                        SizedBox(height: 16),
                        Text(
                          'Confirm New Password'.tr,
                          style: TextStyle(
                            color: Colors.white.withOpacity(.7),
                            fontSize: 20,
                          ),
                        ),

                        SizedBox(height: 10),
                        passWordInput(
                            passwordController:
                                passwoController.new2passwordTextController,
                            Type: TextInputType.text),
                        SizedBox(height: 16),
                        Text(
                          'Pin'.tr,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 20,
                          ),
                        ),

                        SizedBox(height: 10),
                        TextFormField(
                          controller: passwoController.pinTextController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            fillColor: Colors.grey[200],
                            filled: true,
                            // hintText: textHint.tr,
                          ),
                          validator: (value) =>
                              value.trim().isEmpty ? 'emptyerror' : null,
                        ),
                        // passWordInput(
                        //     passwordController:
                        //         passwoController.pinTextController,
                        //     obscureText: false,
                        //     Type: TextInputType.number),
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
                            'Send'.tr,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              if (passwoController.isLoading = true) {
                                showDialog(
                                    builder: (context) => Center(
                                            child: SpinKitFadingCircle(
                                          color: Color(0xff8e0016),
                                        )),
                                    barrierColor: Colors.white.withOpacity(0.5),
                                    context: context);
                              }
                              print('send');

                              passwoController.submitNewQ();
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
  // bool obscureText;
  TextInputType Type;
  passWordInput(
      {@required this.passwordController,
      // @required this.obscureText,
      @required this.Type});

  @override
  _passWordInputState createState() => _passWordInputState();
}

class _passWordInputState extends State<passWordInput> {
  bool passwordVisibility = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
      keyboardType: widget.Type,
      // decoration: InputDecoration(
      //   fillColor: Colors.grey[200],
      //   filled: true,
      //   // hintText: textHint.tr,
      // ),
      validator: (value) => value.trim().isEmpty ? 'emptyerror' : null,
    );
  }
}
