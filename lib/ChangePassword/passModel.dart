class passModel {
  Error error;
  bool valid;
  Datapass data;

  passModel({this.error, this.valid, this.data});

  passModel.fromJson(Map<String, dynamic> json) {
    error = json["error"] != null ? Error.fromJson(json["error"]) : null;
    valid = json['valid'];
    data = json['data'] != null ? Datapass.fromJson(json['data']) : null;
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

class Datapass {
  String password;
  String newPassword;

  String pinCode;

  Datapass({
    this.password,
    this.newPassword,
    this.pinCode,
  });

  Datapass.fromJson(Map<String, dynamic> json) {
    password = json['password'];
    newPassword = json['newPassword'];

    pinCode = json['pinCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['password'] = this.password;
    data['newPassword'] = this.newPassword;

    data['createDate'] = this.pinCode;

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
