class logInUserModel {
  Error error;
  bool valid;
  Data data;

  logInUserModel({this.error, this.valid, this.data});

  logInUserModel.fromJson(Map<String, dynamic> json) {
    error = json["error"] != null ? Error.fromJson(json["error"]) : null;
    valid = json['valid'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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

class Data {
  String userName;
  bool firstTime;
  String phoneNumber;
  String cardID;
  String mail;
  Null pinCode;
  bool mustChangePassword;
  String token;

  Data(
      {this.userName,
      this.firstTime,
      this.phoneNumber,
      this.cardID,
      this.mail,
      this.pinCode,
      this.mustChangePassword,
      this.token});

  Data.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    firstTime = json['firstTime'];
    phoneNumber = json['phoneNumber'];
    cardID = json['cardID'];
    mail = json['mail'];
    pinCode = json['pinCode'];
    mustChangePassword = json['mustChangePassword'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['firstTime'] = this.firstTime;
    data['phoneNumber'] = this.phoneNumber;
    data['cardID'] = this.cardID;
    data['mail'] = this.mail;
    data['pinCode'] = this.pinCode;
    data['mustChangePassword'] = this.mustChangePassword;
    data['token'] = this.token;
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
