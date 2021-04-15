import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'allQuestionsModel.dart';
import 'setAnswrsModel.dart';
import '../global/globalVars.dart' as Global;

class AllQuestionsController extends GetxController {
  TextEditingController firstAnswerController;
  TextEditingController secondAnswerController;
  TextEditingController thirdAnswerController;
  TextEditingController pinController;
  TextEditingController usernameController = TextEditingController();
  String firstQuestion;
  String secondQuestion;
  String thirdQuestion;
  List<AnsAndQu> answersAndQuestions = [];
  AllQuestionsModel allQuestionsList;
  AllQuestionsModel allQuestionsList2;
  AllQuestionsModel allQuestionsList3;
  String logToken;
  String Password;
  String firstTime;
  String PIN;
  String pa;
  bool isLoading;
  String url;

  List<Data> QListData;
  AllQuestionsModel allquestionsModel;
  List<DataQ> setQandA = [];

  @override
  // ignore: must_call_super
  Future<void> onInit() async {
    pa = Global.Gv;

    QListData = await apiGetAllQ();

    firstAnswerController = TextEditingController();
    secondAnswerController = TextEditingController();
    thirdAnswerController = TextEditingController();
    pinController = TextEditingController();
    //usernameController = TextEditingController();

    Password = Global.Gpass;
    // firstTime = Get.arguments[2];

    logToken = (Global.Gv == 'false') ? Global.Gt : Global.Gtoken;
    //: '';
    // if (pa == 'true') {
    //   PIN = pinController.text;
    //   update();
    // } else {
    //   PIN = Global.Gpin;
    //   update();
    // }

    isLoading = true;
    update();
    super.onInit();

    //Get.arguments[3];
  }

  Future<List<Data>> apiGetAllQ() async {
    print('api get all Q is called');

    try {
      final http.Response response = await http.get(
          'http://185.194.124.200:8051/api/Account/AllQuestion?page=1&pagesize=10');

      print(response.statusCode);
      print(response.body);

      allquestionsModel =
          AllQuestionsModel.fromJson(json.decode(response.body));
      Global.timeout(allquestionsModel);

      if (response.statusCode == 200) {
        // while (allquestionsModel.data == null) {
        //   // showDialog(
        //   //   // context: context,
        //   //   child:
        //   AlertDialog(
        //       backgroundColor: Colors.white.withOpacity(0.8),
        //       actionsPadding: EdgeInsets.fromLTRB(100.0, 25.0, 120.0, 25.0),
        //       // content:
        //       actions: [Center(child: CircularProgressIndicator())] //),
        //       );
        // }
        // Get.back();

        allQuestionsList = allquestionsModel;
        allQuestionsList2 = allquestionsModel;
        update();
        print('decoder');
        print('111  $pa ');
        print(json.decode(response.body));
        print('model');
        print(allquestionsModel.data[0].id);
        isLoading = false;

        return allQuestionsList.data;
      }
    } catch (e) {
      print(e);
    }
  }

  void updateValue1(String newVal) {
    firstQuestion = newVal;
    update();
  }

  void updateValue2(String newVal) {
    secondQuestion = newVal;
    update();
  }

  void updateValue3(String newVal) {
    thirdQuestion = newVal;
    update();
  }

  void mapQandA(String answer, String question) {
    for (var item in allQuestionsList.data) {
      if (item.questionContent == question) {
        AnsAndQu x =
            AnsAndQu(id: item.id, answer: answer, ArQ: item.questionContentAr);
        this.answersAndQuestions.add(x);
        this.answersAndQuestions.forEach(
          (ans) {
            print(ans.answer);
          },
        );
        return;
      }
    }
  }

  Future apiSetAnswers() async {
    print('api set answers called');

    Map<String, String> header = {
      'Authorization': logToken,
      'Content-Type': 'application/json'
    };

    try {
      print('decode');

      List<DataQ> data1 = [
        DataQ(
            answer: firstAnswerController.text,
            question_id: answersAndQuestions[0].id,
            id: 0,
            question: firstQuestion,
            question_Ar: answersAndQuestions[0].ArQ),
        DataQ(
            answer: secondAnswerController.text,
            question_id: answersAndQuestions[1].id,
            id: 0,
            question: secondQuestion,
            question_Ar: answersAndQuestions[1].ArQ),
        DataQ(
            answer: thirdAnswerController.text,
            question_id: answersAndQuestions[2].id,
            id: 0,
            question: thirdQuestion,
            question_Ar: answersAndQuestions[2].ArQ),
      ];
      String jsonTags = jsonEncode(data1);
      SetAnswersM AandQ = SetAnswersM(
          data: data1,
          pinCode: Global.Gv == 'false' ? Global.Gpin : pinController.text,
          password: Global.Gv == 't' ? usernameController.text : Password);
      dynamic jsonAandQ = jsonEncode(AandQ);
      print('Json answers and Question ${jsonAandQ}');
      Global.Gv == 'false'
          ? {url = 'http://185.194.124.200:8051/api/Account/SetUserAnswer'}
          : (Global.Gv == 'true')
              ? {
                  url =
                      'http://185.194.124.200:8051/api/Account/UpdateUserAnswer'
                }
              : {url = 'http://185.194.124.200:8051/api/Account/ResetPassword'};

      final http.Response response =
          await http.post(url, headers: header, body: jsonAandQ);

      print(response.statusCode);
      print('body: ${response.body}');

      if (response.statusCode == 200) {
        if ((Global.Gv == 'false') || (Global.Gv == 't')) {
          Get.snackbar('Done..'.tr, " ",
              backgroundColor: Colors.white.withOpacity(0.8),
              icon: Icon(
                Icons.check_circle,
                color: Color(0xff149931),
              ),
              duration: Duration(seconds: 10));
          Get.offAllNamed(
            '/loginView', //loginView
          );
        } else {
          Get.back();
          Get.back();
          Get.snackbar("  ", 'Question Updated successfully'.tr,
              backgroundColor: Colors.white.withOpacity(0.8),
              icon: Icon(
                Icons.check_circle,
                color: Color(0xff149931),
              ));
        }
        //loginView

        //    arguments: [LogToken, OldPass, firstTime, PIN]);
      }
    } catch (e) {
      Get.back();
      Get.snackbar('Error'.tr, 'Question update failed'.tr,
          duration: Duration(seconds: 10),
          backgroundColor: Color(0XFFFFDDDA),
          icon: Icon(
            Icons.error_sharp,
            color: Color(0xff8e0016),
          ));

      print(e);
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}

class AnsAndQu {
  int id;
  String answer;
  String ArQ;
  AnsAndQu({this.id, this.answer, this.ArQ});
}
