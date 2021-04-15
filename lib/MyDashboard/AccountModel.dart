import 'dart:convert';

AllAccModel AllAccModelFromJson(String str) =>
    AllAccModel.fromJson(json.decode(str));

String AllAccModelToJson(AllAccModel data) => json.encode(data.toJson());

class AllAccModel {
  dynamic error;
  bool valid;
  List<aaccount> data;

  AllAccModel({this.error, this.valid, this.data});

  AllAccModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    valid = json['valid'];
    if (json['data'] != null) {
      data = List<aaccount>();
      json['data'].forEach((v) {
        data.add(aaccount.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() => {
        "error": error,
        "valid": valid,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class aaccount {
  String account;
  String casc;
  String currency;
  String balance;
  String clientStatus;

  aaccount({
    this.account,
    this.casc,
    this.currency,
    this.balance,
    this.clientStatus,
  });

  factory aaccount.fromJson(Map<String, dynamic> json) => aaccount(
        account: json["account"],
        casc: json["casc"],
        currency: json["currency"] == null ? null : json["currency"],
        balance: json["balance"] == null ? null : json["balance"],
        clientStatus:
            json["clientStatus"] == null ? null : json["clientStatus"],
      );

  Map<String, dynamic> toJson() => {
        "account": account,
        "casc": casc,
        "currency": currency == null ? null : currency,
        "balance": balance == null ? null : balance,
        "clientStatus": clientStatus == null ? null : clientStatus,
      };
}
