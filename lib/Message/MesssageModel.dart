class MesssageModel {
  Error error;
  bool valid;
  Datam data;

  MesssageModel({this.error, this.valid, this.data});

  MesssageModel.fromJson(Map<String, dynamic> json) {
    error = json["error"] != null ? Error.fromJson(json["error"]) : null;

    valid = json['valid'];
    data = json['data'] != null ? new Datam.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.error != null) {
      data['error'] = this.error.toJson();
    }
    data['valid'] = this.valid;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Datam {
  int id;

  String messageContent;
  String reply;
  int state;
  String createDate;

  Datam({
    this.id,
    this.messageContent,
    this.reply,
    this.state,
    this.createDate,

    // this.token
  });

  Datam.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    messageContent = json['messageContent'];
    reply = json['reply'];
    state = json['state'];
    createDate = json['createDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;

    data['messageContent'] = this.messageContent;
    data['reply'] = this.reply;
    data['state'] = this.state;
    data['createDate'] = this.createDate;

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
