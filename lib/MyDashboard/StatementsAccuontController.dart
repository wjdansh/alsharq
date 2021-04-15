import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

import '../global/globalVars.dart' as Global;
import 'StatementsAccountModel.dart';

class statementAccountController extends GetxController {
  // List<aaccount> accountList = [];
  statementModel acc;
  TextEditingController formController;
  TextEditingController toController;

  var client = http.Client();

  List<statementsAccount> statList = [];

  @override
  void onInit() async {
    formController = TextEditingController();
    toController = TextEditingController();
    await GetStatAccounts();
    super.onInit();
  }

  Future<List<statementsAccount>> GetStatAccounts() async {
    print('api get is called');
    Map<String, String> header = {
      'Authorization': Global.Gtoken,
    };

    try {
      final http.Response response = await client.get(
          'http://185.194.124.200:8051/api/BankingAccountOperation/StatementOfAccount',
          headers: header);

      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        acc = await statementModel.fromJson(json.decode(response.body));
        Global.timeout(acc);
        if ((acc.error != null) && (acc.error.errorAr == "ErrorMQ")) {
          onInit();
        }
        acc.data.forEach((v) {
          // print('23335566  ${v.operation}  .....  ${v}');

          statList.add(v);
        });

        // print('2233 ${statList}');
        // print('222');
        return acc.data;
      }
    } catch (e) {
      print(e);
    }
  }
}
