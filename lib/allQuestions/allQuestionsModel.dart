class AllQuestionsModel {
  Error error;
  bool valid;
  List<Data> data;

  AllQuestionsModel({this.error, this.valid, this.data});

  AllQuestionsModel.fromJson(Map<String, dynamic> json) {
    error = json["error"] != null ? Error.fromJson(json["error"]) : null;
    valid = json['valid'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.error != null) {
      data['error'] = this.error.toJson();
    }
    data['valid'] = this.valid;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int id;
  String questionContent;
  String questionContentAr;

  Data({this.id, this.questionContent, this.questionContentAr});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    questionContent = json['questionContent'];
    questionContentAr = json['questionContent_Ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['questionContent'] = this.questionContent;
    data['questionContent_Ar'] = this.questionContentAr;
    return data;
  }
}

class Error {
  Error({
    this.errorAr,
    this.errorEn,
    this.id,
  });

  String errorAr;
  String errorEn;
  int id;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        errorAr: json["error_Ar"],
        errorEn: json["error_En"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "error_Ar": errorAr,
        "error_En": errorEn,
        "id": id,
      };
}
