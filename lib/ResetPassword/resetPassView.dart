import 'dart:ui';
import 'package:alsharq/allQuestions/allQuestionsController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../global/globalVars.dart' as Global;

class ResetPass extends StatelessWidget {
  AllQuestionsController _allQuestionsCont = Get.put(AllQuestionsController());

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
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
                physics: NeverScrollableScrollPhysics(),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
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
                        'Please enter your username'.tr,
                        //textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white.withOpacity(.7),
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _allQuestionsCont.usernameController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          fillColor: Colors.grey[200],
                          filled: true,
                          hintText: 'UserName'.tr,
                        ),
                        validator: (value) =>
                            value.trim().isEmpty ? 'emptyerror'.tr : null,
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
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            print(
                                "id ${_allQuestionsCont.usernameController.text.toString()}");

                            Global.Gv = 't';
                            Global.id = _allQuestionsCont
                                .usernameController.text
                                .toString();
                            {
                              Get.toNamed('/allQuestions', //loginView
                                  arguments: [
                                    Global.id,
                                    Global.Gv,
                                    // Global.Gpin
                                  ]);
                            }
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
    );
  }
}
