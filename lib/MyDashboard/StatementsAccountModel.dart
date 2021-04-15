import 'dart:convert';

statementModel statementModelFromJson(String str) =>
    statementModel.fromJson(json.decode(str));

String statementModelToJson(statementModel data) => json.encode(data.toJson());

class statementModel {
  statementModel({
    this.error,
    this.valid,
    this.data,
  });

  dynamic error;
  bool valid;
  List<statementsAccount> data;

  statementModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    valid = json['valid'];
    if (json['data'] != null) {
      data = List<statementsAccount>();
      json['data'].forEach((v) {
        data.add(statementsAccount.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() => {
        "error": error,
        "valid": valid,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class statementsAccount {
  statementsAccount({
    this.operationDate,
    this.operation,
    this.description,
    this.valueDate,
    this.amount,
    this.balance,
    this.details,
  });

  String operationDate;
  String operation;
  String description;
  String valueDate;
  String amount;
  String balance;
  String details;

  factory statementsAccount.fromJson(Map<String, dynamic> json) =>
      statementsAccount(
        operationDate: json["operationDate"],
        operation: json["operation"],
        description: json["description"],
        valueDate: json["valueDate"],
        amount: json["amount"],
        balance: json["balance"],
        details: json["details"],
      );

  Map<String, dynamic> toJson() => {
        "operationDate": operationDate,
        "operation": operation,
        "description": description,
        "valueDate": valueDate,
        "amount": amount,
        "balance": balance,
        "details": details,
      };
}
