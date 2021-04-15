import 'dart:io';
import 'dart:ui';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'MesssageController.dart';

class MassegeView extends StatelessWidget {
  final MessageController _messageController = Get.put(MessageController());

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
          backgroundColor: Color(0xff8e0016),
          title: Text(
            'Send Message'.tr,
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
          padding: EdgeInsets.only(left: 20, right: 20, top: 80, bottom: 100),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Form(
              key: _formKey,
              child: Container(
                //height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.only(top: 40, left: 10, right: 10),
                decoration: BoxDecoration(
                  color: Color(0xff585f67).withOpacity(0.6),
                ),
                child:
                    //ListView(shrinkWrap: true,
                    SingleChildScrollView(
                  // physics: NeverScrollableScrollPhysics(),
                  child: SizedBox(
                    // height: MediaQuery.of(context).size.height,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        // Image.asset(
                        //   'assets/images/bank.png',
                        //   width: 150,
                        //   height: Get.width / 4,
                        // ),

                        Text(
                          'Message'.tr,
                          // textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white.withOpacity(.7),
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 30),
                        TextFormField(
                          keyboardType: TextInputType.multiline,

                          decoration: InputDecoration(
                            fillColor: Colors.grey[200],
                            filled: true,
                            hintText: 'Message hint'.tr,
                            contentPadding: const EdgeInsets.only(
                                top: 10, bottom: 150, left: 10),
                          ),

                          controller: _messageController.messController,

                          //   validator: (value) =>
                          //   value.isEmpty ? 'Password can\'t be empty' : null,
                          //   onSaved: (value) => _sr = value.trim(),
                          // ),

                          validator: (value) =>
                              value.trim().isEmpty ? 'emptyerror'.tr : null,
                        ),
                        SizedBox(height: 50),

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
                              if (_messageController.isLoading = true) {
                                showDialog(
                                    builder: (context) => Center(
                                            child: SpinKitFadingCircle(
                                          color: Color(0xff8e0016),
                                        )),
                                    barrierColor: Colors.white.withOpacity(0.5),
                                    context: context);
                              }

                              print('send');
                              _messageController.apiMessage();
                            }
                          },
                        ),
                        SizedBox(height: 10),
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
