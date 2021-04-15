import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:get/get.dart';
import 'firstTimeController.dart';

class newPassword extends StatelessWidget {
  final firstLogInConrtoller passwordController =
      Get.put(firstLogInConrtoller());
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:
          // SingleChildScrollView(
          //   // scrollDirection: Axis.vertical,
          //   child:
          Container(
        // height: 400,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/back.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.only(left: 20, right: 20, top: 80, bottom: 100),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Form(
            key: _formKey,
            child: Container(
              padding: EdgeInsets.only(top: 40, left: 10, right: 10),
              decoration: BoxDecoration(
                color: Color(0xff585f67).withOpacity(0.6),
              ),
              child: SingleChildScrollView(
                // physics: NeverScrollableScrollPhysics(),
                child: SizedBox(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/bank.png',
                        width: 150,
                        height: Get.width / 4,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Please fill the fields',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                      SizedBox(height: 10),
                      passWordInput(
                        passwordController:
                            passwordController.oldpasswordTextController,
                        textHint: 'oldpassHint'.tr,
                      ),
                      SizedBox(height: 16),
                      passWordInput(
                          passwordController:
                              passwordController.new1passwordTextController,
                          textHint: 'hintNewPass1'.tr),
                      SizedBox(height: 16),
                      passWordInput(
                          passwordController:
                              passwordController.new2passwordTextController,
                          textHint: 'hintNewPass2'.tr),
                      SizedBox(height: 16),
                      TextFormField(
                        textAlign: TextAlign.center,
                        controller: passwordController.pinController,
                        decoration: InputDecoration(
                          fillColor: Colors.grey[200],
                          filled: true,
                          hintText: 'Pincode'.tr,
                        ),
                        validator: (value) =>
                            value.trim().isEmpty ? ' required' : null,
                      ),
                      SizedBox(height: 16),
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
                        ),
                        onPressed: () => {},
                        //passwordController.submitNewQ(),
                      )
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

class passWordInput extends StatelessWidget {
  TextEditingController passwordController;
  String textHint;
  passWordInput({@required this.passwordController, @required this.textHint});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.center,
      obscureText: true,
      controller: passwordController,
      decoration: InputDecoration(
        fillColor: Colors.grey[200],
        filled: true,
        hintText: textHint.tr,
      ),
      validator: (value) => value.trim().isEmpty ? 'passrequired' : null,
    );
  }
}
