import 'dart:convert';
import 'package:alsharq/MyDashboard/AccountModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../global/globalVars.dart' as Global;
import 'StatementsAccuontController.dart';

class AccountsController extends GetxController {
  final statementAccountController _sControlle =
      Get.put(statementAccountController());
  // List<aaccount> accountList = [];
  AllAccModel acc;

  var client = http.Client();

  List<aaccount> accList = [];

  @override
  void onInit() {
    _sControlle.onInit();
    GetAccounts();
    super.onInit();
  }

  Future<List<aaccount>> GetAccounts() async {
    print('api get is called');
    Map<String, String> header = {
      'Authorization': Global.Gtoken,
    };

    try {
      final http.Response response = await client.get(
          'http://185.194.124.200:8051/api/BankingAccountOperation/ListOfAccounts',
          headers: header);

      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        acc = AllAccModel.fromJson(json.decode(response.body));
        Global.timeout(acc);
        if ((acc.error != null) && (acc.error.errorAr == "ErrorMQ")) {
          onInit();
        }

        // final ae = AllAccModel.fromJson(
        //     json.decode(response.body) as Map<String, dynamic>);

        // final ac = json.decode(response.body) as Map<String, dynamic>;
        // // final List<Account> ad = ac['data'].map((s) => s as String).toList();
        // var ad = ac['data'];

        // print('234 ${acc}');
        // print('23rrrrr4 ${acc.data}');

        acc.data.forEach((v) {
          //  print('23335566  ${v.account}  .....  ${v}');

          accList.add(v);
        });

        print('2233 ${accList}');
        print('222');
        return acc.data;
      }
    } catch (e) {
      print(e);
    }
  }
}
