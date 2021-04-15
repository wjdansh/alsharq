class PinModel {
  Error error;
  bool valid;
  Datapin data;

  PinModel({this.error, this.valid, this.data});

  PinModel.fromJson(Map<String, dynamic> json) {
    error = json["error"] != null ? Error.fromJson(json["error"]) : null;
    valid = json['valid'];
    data = json['data'] != null ? new Datapin.fromJson(json['data']) : null;
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

class Datapin {
  String newPinCode;

  String pinCode;
  String password;
  Datapin({
    this.newPinCode,
    this.pinCode,
    this.password,
  });

  Datapin.fromJson(Map<String, dynamic> json) {
    newPinCode = json['newPinCode'];
    pinCode = json['pinCode'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['newPinCode'] = this.newPinCode;

    data['createDate'] = this.pinCode;
    data['password'] = this.password;
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
