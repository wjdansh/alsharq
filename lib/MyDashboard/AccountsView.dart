import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'AccountController.dart';
import 'StatementsAccuontController.dart';

class Mydashboard extends StatefulWidget {
  @override
  _MydashboardState createState() => _MydashboardState();
}

class _MydashboardState extends State<Mydashboard> {
  final AccountsController _accountControlle = Get.put(AccountsController());
  final statementAccountController _sControlle =
      Get.put(statementAccountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Accounts'.tr)),
      body: Container(
        color: Colors.white.withOpacity(0.1),
        // width: 50,
        // height: 300,
        // height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            //  physics: NeverScrollableScrollPhysics(),
            // child: Column(
            //   // itemExtent: 200,
            //   children: [
            child: displayAccoutList(),
          ),
        ),
      ),
    );
  }

  Widget accountItems(
    String account,
    String casc,
    String currency,
    String balance,
    String clientStatus,
  ) {
    return Material(
      child: InkWell(
        child: Ink(
          decoration: BoxDecoration(
              color: clientStatus == 'Not Active  '.tr
                  ? Colors.black12
                  : Colors.white),
          padding:
              EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
          // child: InkWell(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: [
                      Icon(
                        Icons.account_circle,
                        size: 14,
                        color: Color(0xff8e0016).withOpacity(0.3),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text('Account'.tr, style: TextStyle(fontSize: 16.0)),
                      Text('* $clientStatus',
                          style: TextStyle(
                              fontSize: 10.0,
                              color: clientStatus == 'Not Active  '
                                  ? Colors.red
                                  : Colors.green))
                    ],
                  ),
                  Text('$currency  $balance',
                      style: TextStyle(
                          fontSize: 14.0, color: Colors.black.withGreen(200)))
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(account,
                      style: TextStyle(color: Colors.black38, fontSize: 14.0)),
                  Text('casc:'.tr + '$casc',
                      style: TextStyle(color: Colors.black38, fontSize: 14.0))
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Divider(color: Colors.black54),
            ],
          ),

          // ),
        ),
        onTap: () {
          _sControlle.onInit();
          Get.toNamed('/MyAccount');
        },
      ),
    );
  }

  displayAccoutList() {
    //List<Account> AccountList = [];

    print('8888  ${_accountControlle.accList}');
    // while (_accountControlle.accList == null) {
    //   return Center(
    //       child: SpinKitFadingCircle(
    //     color: Color(0xff8e0016),
    //   ));
    // }
    return ListView(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      children: _accountControlle.accList
          .map(
            (item) => accountItems(item.account, item.casc, item.currency,
                item.balance, item.clientStatus),
          )
          .toList(),
    );
  }
}
