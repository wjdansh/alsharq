class ComplaintModel {
  Error error;
  bool valid;
  Dataa data;

  ComplaintModel({this.error, this.valid, this.data});

  ComplaintModel.fromJson(Map<String, dynamic> json) {
    error = json["error"] != null ? Error.fromJson(json["error"]) : null;
    valid = json['valid'];
    data = json['data'] != null ? new Dataa.fromJson(json['data']) : null;
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

class Dataa {
  int id;
  String subject;
  String complaintContent;
  int state;
  String createDate;
  String suggestionContnet;
  bool firstComplaint;
  String preferredTime;

  Dataa({
    this.id,
    this.subject,
    this.complaintContent,
    this.state,
    this.createDate,
    this.suggestionContnet,
    this.firstComplaint,
    this.preferredTime,
  });

  Dataa.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subject = json['subject'];
    complaintContent = json['complaintContent'];
    state = json['state'];
    createDate = json['createDate'];
    suggestionContnet = json['suggestionContnet'];
    firstComplaint = json['firstComplaint'];
    preferredTime = json['preferredTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['subject'] = this.subject;
    data['complaintContent'] = this.complaintContent;
    data['state'] = this.state;
    data['createDate'] = this.createDate;
    data['suggestionContnet'] = this.suggestionContnet;
    data['firstComplaint'] = this.firstComplaint;
    data['preferredTime'] = this.preferredTime;

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
