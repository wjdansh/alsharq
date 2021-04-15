import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'allQuestionsController.dart';
import 'package:get/get.dart';
import '../global/globalVars.dart' as Global;

class questions extends StatefulWidget {
  @override
  _questionsState createState() => _questionsState();
}

class _questionsState extends State<questions> {
  AllQuestionsController _allQuestionsController =
      Get.put(AllQuestionsController());

  final _formKey = GlobalKey<FormState>();

  //final LoginController loginInfo = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
            backgroundColor: Color(0xff8e0016),
            title: Text(
              'Set Questions'.tr,
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
            padding: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 30),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Form(
                key: _formKey,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                  decoration: BoxDecoration(
                    color: Color(0xff585f67).withOpacity(0.6),
                  ),
                  child: SingleChildScrollView(
                    // physics: NeverScrollableScrollPhysics(),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: GetBuilder<AllQuestionsController>(
                          builder: (controller) {
                        while (_allQuestionsController.QListData == null) {
                          return Center(
                              child: SpinKitFadingCircle(
                            color: Color(0xff8e0016),
                          ));
                        }
                        return Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              // Image.asset(
                              //   'assets/images/bank.png',
                              //   width: 150,
                              //   height: Get.width / 4,
                              // ),
                              SizedBox(height: 10),
                              Container(
                                // height: 90,
                                child: bb(),
                              ),
                              //bb(),
                              GetBuilder<AllQuestionsController>(
                                  builder: (controller) {
                                return DropdownButtonFormField<dynamic>(
                                  isExpanded: true,
                                  value: _allQuestionsController.firstQuestion,
                                  focusColor: Colors.blue,
                                  iconSize: 40,
                                  iconEnabledColor: Colors.black,
                                  decoration: InputDecoration(
                                    labelText: 'Select Question'.tr,
                                    border: OutlineInputBorder(),
                                    enabledBorder: InputBorder.none,
                                  ),
                                  elevation: 3,
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                  items: _allQuestionsController.QListData.map(
                                      (item) => DropdownMenuItem<dynamic>(
                                            child: Text(
                                              item.questionContent,
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            value: item.questionContent,
                                          )).toList(),
                                  onChanged: (value) {
                                    _allQuestionsController.updateValue1(value);
                                  },
                                );
                              }),
                              SizedBox(height: 10),
                              TextFormField(
                                controller: _allQuestionsController
                                    .firstAnswerController,
                                decoration: InputDecoration(
                                  fillColor: Colors.grey[200],
                                  filled: true,
                                  hintText: 'answer the question'.tr,
                                ),
                                validator: (value) => value.trim().isEmpty
                                    ? 'emptyerror'.tr
                                    : null,
                              ),
                              SizedBox(height: 10),
                              GetBuilder<AllQuestionsController>(
                                  builder: (controller) {
                                return DropdownButtonFormField<dynamic>(
                                  isExpanded: true,
                                  value: _allQuestionsController.secondQuestion,
                                  focusColor: Colors.blue,
                                  iconSize: 40,
                                  iconEnabledColor: Colors.black,
                                  decoration: InputDecoration(
                                    labelText: 'Select Question'.tr,
                                    border: OutlineInputBorder(),
                                    enabledBorder: InputBorder.none,
                                  ),
                                  style: TextStyle(color: Colors.black),
                                  elevation: 3,
                                  items:
                                      (_allQuestionsController.QListData.where(
                                              (element) =>
                                                  (element.questionContent !=
                                                      (_allQuestionsController
                                                          .firstQuestion))))
                                          .map((item) {
                                    return DropdownMenuItem<dynamic>(
                                      child: Text(
                                        item.questionContent,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      value: item.questionContent,
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    _allQuestionsController.updateValue2(value);
                                  },
                                );
                              }),
                              SizedBox(height: 10),
                              TextFormField(
                                controller: _allQuestionsController
                                    .secondAnswerController,
                                decoration: InputDecoration(
                                  fillColor: Colors.grey[200],
                                  filled: true,
                                  hintText: 'answer the question'.tr,
                                ),
                                validator: (value) => value.trim().isEmpty
                                    ? 'emptyerror'.tr
                                    : null,
                              ),
                              SizedBox(height: 10),
                              GetBuilder<AllQuestionsController>(
                                  builder: (controller) {
                                return DropdownButtonFormField<dynamic>(
                                  isExpanded: true,
                                  value: _allQuestionsController.thirdQuestion,
                                  focusColor: Colors.blue,
                                  iconSize: 40,
                                  iconEnabledColor: Colors.black,
                                  decoration: InputDecoration(
                                    labelText: 'Select Question'.tr,
                                    border: OutlineInputBorder(),
                                    enabledBorder: InputBorder.none,
                                  ),
                                  style: TextStyle(color: Colors.black),
                                  elevation: 3,
                                  items: _allQuestionsController.QListData
                                          .where((element) =>
                                              (element.questionContent !=
                                                  _allQuestionsController
                                                      .firstQuestion) &&
                                              (element.questionContent !=
                                                  _allQuestionsController
                                                      .secondQuestion))
                                      .map((item) => DropdownMenuItem<dynamic>(
                                            child: Text(
                                              item.questionContent,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            value: item.questionContent,
                                          ))
                                      .toList(),
                                  onChanged: (value) {
                                    _allQuestionsController.updateValue3(value);
                                  },
                                );
                              }),
                              SizedBox(height: 10),
                              TextFormField(
                                controller: _allQuestionsController
                                    .thirdAnswerController,
                                decoration: InputDecoration(
                                  fillColor: Colors.grey[200],
                                  filled: true,
                                  hintText: 'answer the question'.tr,
                                ),
                                validator: (value) => value.trim().isEmpty
                                    ? 'emptyerror'.tr
                                    : null,
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
                                  ),
                                  onPressed: () {
                                    if (_formKey.currentState.validate()) {
                                      // if ((_allQuestionsController
                                      //             .secondQuestion ==
                                      //         _allQuestionsController
                                      //             .firstQuestion) ||
                                      //     (_allQuestionsController
                                      //             .thirdQuestion ==
                                      //         _allQuestionsController
                                      //             .firstQuestion) ||
                                      //     (_allQuestionsController
                                      //             .thirdQuestion ==
                                      //         _allQuestionsController
                                      //             .secondQuestion)) {
                                      //   // showDialog(
                                      //   //     barrierColor:
                                      //   //         Colors.white.withOpacity(0.5),
                                      //   //     context: context,
                                      //   //     child: Center(
                                      //   //         child: SpinKitFadingCircle(
                                      //   //       color: Color(0xff8e0016),
                                      //   //     )));
                                      //   showDialog(
                                      //     context: context,
                                      //     child: AlertDialog(
                                      //         backgroundColor: Colors.white,
                                      //         actionsPadding:
                                      //             EdgeInsets.fromLTRB(
                                      //                 100.0, 25.0, 120.0, 25.0),
                                      //         title: Text('Alert'),
                                      //         content: Text(
                                      //             'Enter different Questions'),
                                      //         actions: <Widget>[
                                      //           FlatButton(
                                      //             onPressed: () {
                                      //               Get.back();
                                      //             },
                                      //             child: Text(
                                      //               ' OK'.tr,
                                      //               textAlign: TextAlign.left,
                                      //               style: TextStyle(
                                      //                 color: Colors.green
                                      //                     .withOpacity(0.7),
                                      //                 fontSize: 16,
                                      //               ),
                                      //             ),
                                      //           ),
                                      //         ]),
                                      //   );
                                      // } else {
                                      if (_allQuestionsController.isLoading =
                                          true) {
                                        showDialog(
                                            builder: (context) => Center(
                                                    child: SpinKitFadingCircle(
                                                  color: Color(0xff8e0016),
                                                )),
                                            barrierColor:
                                                Colors.white.withOpacity(0.5),
                                            context: context);
                                        // showDialog(
                                        //   context: context,
                                        //   child: AlertDialog(
                                        //       backgroundColor:
                                        //           Colors.white.withOpacity(0.8),
                                        //       actionsPadding:
                                        //           EdgeInsets.fromLTRB(
                                        //               100.0, 25.0, 120.0, 25.0),
                                        //       // content:
                                        //       actions: [
                                        //         Center(
                                        //             child:
                                        //                 CircularProgressIndicator())
                                        //       ]),
                                        // );
                                        //  }

                                        _allQuestionsController
                                            .answersAndQuestions
                                            .clear();
                                        _allQuestionsController.mapQandA(
                                            _allQuestionsController
                                                .firstAnswerController.text,
                                            _allQuestionsController
                                                .firstQuestion);
                                        _allQuestionsController.mapQandA(
                                            _allQuestionsController
                                                .secondAnswerController.text,
                                            _allQuestionsController
                                                .secondQuestion);
                                        _allQuestionsController.mapQandA(
                                            _allQuestionsController
                                                .thirdAnswerController.text,
                                            _allQuestionsController
                                                .thirdQuestion);
                                        _allQuestionsController.apiSetAnswers();
                                      }
                                    }
                                  }),
                              SizedBox(height: 20),
                            ]);
                      }),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  bb() {
    if ((_allQuestionsController.pa == 'true') || (Global.Gv == 't')) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Enter your Pin'.tr,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.black.withOpacity(0.7),
              fontSize: 16,
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            // obscureText: true,
            controller: _allQuestionsController.pinController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              fillColor: Colors.grey[200],
              filled: true,
              hintText: 'PIN',
            ),
            validator: (value) => value.trim().isEmpty ? 'emptyerror'.tr : null,
          ),
        ],
      );
    } else
      return SizedBox(height: 10);
  }
}
