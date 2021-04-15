import 'package:alsharq/allQuestions/allQuestionsController.dart';
import 'package:get/get.dart';
import '../global/globalVars.dart' as Global;

AllQuestionsController _allQuestionsCont = Get.put(AllQuestionsController());

class SetAnswersM {
  List<DataQ> data;
  String pinCode;
  String password;
  String pa = Global.Gv == 't' ? 'list' : 'data';
  String r = Global.Gv == 't' ? 'UserName' : 'password';

  SetAnswersM({this.data, this.pinCode, this.password});

  SetAnswersM.fromJson(Map<String, dynamic> json) {
    if (json[pa] != null) {
      data = new List<DataQ>();
      json[pa].forEach((v) {
        data.add(new DataQ.fromJson(v));
      });
    }
    pinCode = json['pinCode'];
    password = json[r];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data[pa] = this.data.map((v) => v.toJson()).toList();
    }
    data['pinCode'] = this.pinCode;
    data[r] = this.password;
    return data;
  }
}

class DataQ {
  String answer;
  int question_id;
  int id;
  String question;
  String question_Ar;

  DataQ(
      {this.answer,
      this.question_id,
      this.id,
      this.question,
      this.question_Ar});

  DataQ.fromJson(Map<String, dynamic> json) {
    answer = json['answer'];
    question_id = json['question_id'];
    id = json['id'];
    question = json['question'];
    question_Ar = json['question_Ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['answer'] = this.answer;
    data['question_id'] = this.question_id;
    data['id'] = this.id;
    data['question'] = this.question;
    data['question_Ar'] = this.question_Ar;
    return data;
  }
}
