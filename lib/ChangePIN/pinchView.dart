import 'dart:io';
import 'dart:ui';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../confirmLogin/confirmLoginController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pinchController.dart';

class PinView extends StatefulWidget {
  @override
  _PinViewState createState() => _PinViewState();
}

class _PinViewState extends State<PinView> {
  final PinController pinController = Get.put(PinController());

  bool passwordVisibility = true;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
          backgroundColor: Color(0xff8e0016),
          title: Text(
            'Change Pin'.tr,
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
                padding: EdgeInsets.only(top: 40, left: 10, right: 10),
                decoration: BoxDecoration(
                  color: Color(0xff585f67).withOpacity(0.6),
                ),
                child:
                    //ListView(shrinkWrap: true,
                    SingleChildScrollView(
                  // physics: NeverScrollableScrollPhysics(),
                  child: SizedBox(
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
                          'Old Pin'.tr,
                          style: TextStyle(
                            color: Colors.white.withOpacity(.7),
                            fontSize: 20,
                          ),
                        ),

                        SizedBox(height: 10),
                        TInput(
                            TController: pinController.oldpinController,
                            obscureText: false,
                            Type: TextInputType.number),
                        SizedBox(height: 16),
                        Text(
                          'New Pin'.tr,
                          style: TextStyle(
                            color: Colors.white.withOpacity(.7),
                            fontSize: 20,
                          ),
                        ),

                        SizedBox(height: 10),
                        TInput(
                            TController: pinController.new1pinController,
                            obscureText: false,
                            Type: TextInputType.number),
                        SizedBox(height: 16),
                        Text(
                          'Confirm New Pin'.tr,
                          style: TextStyle(
                            color: Colors.white.withOpacity(.7),
                            fontSize: 20,
                          ),
                        ),

                        SizedBox(height: 10),
                        TInput(
                            TController: pinController.new2pinController,
                            obscureText: false,
                            Type: TextInputType.number),
                        SizedBox(height: 16),
                        Text(
                          'password'.tr,
                          style: TextStyle(
                            color: Colors.white.withOpacity(.7),
                            fontSize: 20,
                          ),
                        ),

                        SizedBox(height: 10),
                        TextFormField(
                          controller: pinController.passwoController,
                          keyboardType: TextInputType.text,
                          obscureText: passwordVisibility,
                          decoration: InputDecoration(
                              fillColor: Colors.grey[200],
                              filled: true,
                              hintText: 'password'.tr,
                              suffixIcon: IconButton(
                                  icon: Icon(passwordVisibility == true
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      passwordVisibility = !passwordVisibility;
                                    });
                                  })),
                          validator: (value) =>
                              value.trim().isEmpty ? 'password'.tr : null,
                        ),

                        SizedBox(height: 16),

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
                              if (pinController.isLoading = true) {
                                showDialog(
                                    builder: (context) => Center(
                                            child: SpinKitFadingCircle(
                                          color: Color(0xff8e0016),
                                        )),
                                    barrierColor: Colors.white.withOpacity(0.5),
                                    context: context);
                              }
                              print('send');
                              pinController.submitNewpin();
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
    );
  }
}

class TInput extends StatelessWidget {
  TextEditingController TController;
  bool obscureText;
  TextInputType Type;
  TInput(
      {@required this.TController,
      @required this.obscureText,
      @required this.Type});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: TController,
      keyboardType: Type,
      decoration: InputDecoration(
        fillColor: Colors.grey[200],
        filled: true,
        //hintText: obscureText.tr,
      ),
      validator: (value) => value.trim().isEmpty ? 'emptyerror'.tr : null,
    );
  }
}
