import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'StatementsAccuontController.dart';

import 'package:flutter/cupertino.dart';

class MyAccount extends StatefulWidget {
  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  final statementAccountController _statControlle =
      Get.put(statementAccountController());
  var start;
  var end;

  Card topArea() => Card(
        elevation: 1.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50.0))),
        child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/account.jpg"),
                  fit: BoxFit.cover,
                ),
                gradient: RadialGradient(
                  radius: 1,
                  colors: [
                    Color(0xff8e0016),
                    Color(0xff8e0016).withOpacity(0.8),
                  ],
                )),
            padding: EdgeInsets.all(5.0),
            // color: Color(0xFF015FFF),
            child: Column(
              children: <Widget>[
//
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_outlined,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    Text('My Account'.tr,
                        style: TextStyle(color: Colors.white, fontSize: 20.0)),
                    IconButton(
                      icon: Image.asset("assets/images/Logo-Icon.png"),
                      color: Colors.white,
                      onPressed: () {},
                    )
                  ],
                ),
                // Center(
                //   child: Padding(
                //     padding: EdgeInsets.all(5.0),
                //     child: Text(r"$ 95,940.00",
                //         style: TextStyle(color: Colors.white, fontSize: 24.0)),
                //   ),
                // ),
                SizedBox(height: 35.0),
              ],
            )),
      );

  tabBar() => SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                flexibleSpace: Image(
                  image: AssetImage("assets/images/account.jpg"),
                  fit: BoxFit.cover,
                ),
                title: Text(
                  'My Account'.tr,
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.8), fontSize: 20.0),
                  textAlign: TextAlign.end,
                ),
                bottom: TabBar(
                  tabs: [
                    Tab(
                      text: ('Statements'.tr),
                    ),
                    Tab(
                      text: ('Account Details'.tr),
                    ),
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  displayAccoutList(),
                  Center(
                    child: Text(
                      'Account Details'.tr,
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.6), fontSize: 20.0),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
            ),
            //   ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return
        // SafeArea(
        // child:
        Scaffold(
      body: tabBar(),
    );
  }

  Widget accountItems(
          String operationDate,
          String operation,
          String description,
          String valueDate,
          String amount,
          String balance,
          String details,
          {Color oddColour = Colors.white}) =>
      Container(
        decoration: BoxDecoration(
            color: operation == "VECL" || operation.substring(2) == "CC"
                ? Color(0xff8e0016).withOpacity(0.1)
                : Color(0xFFF7F7F9)),
        padding:
            EdgeInsets.only(top: 20.0, bottom: 20.0, left: 5.0, right: 5.0),
        child: Column(
          children: <Widget>[
            ExpansionTile(
              leading: Icon(Icons.compare_arrows),
              title: Text(operation, style: TextStyle(fontSize: 20.0)),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Operation Date'.tr, style: TextStyle(fontSize: 16.0)),
                    Text('Operation Description'.tr,
                        style: TextStyle(fontSize: 16.0))
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(operationDate,
                        style: TextStyle(color: Colors.grey, fontSize: 14.0)),
                    Container(
                      width: 150,
                      child: Text(description,
                          style: TextStyle(color: Colors.grey, fontSize: 14.0)),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Value Date'.tr, style: TextStyle(fontSize: 16.0)),
                    Text('Amount'.tr, style: TextStyle(fontSize: 16.0)),
                    Text('Balance'.tr, style: TextStyle(fontSize: 16.0))
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(valueDate,
                        style: TextStyle(color: Colors.grey, fontSize: 14.0)),
                    Text(amount,
                        style: TextStyle(color: Colors.grey, fontSize: 14.0)),
                    Text(balance,
                        style: TextStyle(color: Colors.grey, fontSize: 14.0))
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  height: 20.0,
                ),
                ExpansionTile(
                  title: Text('Details'.tr, style: TextStyle(fontSize: 14.0)),
                  leading: Icon(Icons.info_outline),
                  children: [
                    Text(details, style: TextStyle(fontSize: 16.0)),
                  ],
                )
              ],
            ),
          ],
        ),
      );

  displayAccoutList() {
    return Container(
      height: MediaQuery.of(context).size.height,
      margin: EdgeInsets.all(15.0),
      child: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ExpansionTile(
            title: Text('Set Date'.tr,
                //textAlign: TextAlign.,
                style: TextStyle(
                    color: Color(0xff8e0016).withOpacity(0.5), fontSize: 20.0)),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('From'.tr, style: TextStyle(fontSize: 16.0)),
                  SizedBox(
                    height: 40,
                    width: 200,
                    child: TextFormField(
                      // initialValue:
                      //     start == null ? "No Date Selected" : start.toString(),
                      readOnly: true,
                      // start == null
                      //     ? "No Date Selected"
                      //     : '${start.toString()}',
                      //controller: _statControlle.formController,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                      decoration: InputDecoration(
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                          hintText: start == null
                              ? 'No Date Selected'.tr
                              : start.toString(),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Color(0xff8e0016),
                              width: 1,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              color: Color(0xff8e0016),
                              width: 2,
                            ),
                          ),
                          prefixIcon: Padding(
                            child: IconTheme(
                              data: IconThemeData(color: Color(0xff8e0016)),
                              child: Icon(Icons.date_range_outlined),
                            ),
                            padding: EdgeInsets.only(left: 5, right: 3),
                          )),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('To'.tr, style: TextStyle(fontSize: 16.0)),
                  SizedBox(
                    height: 40,
                    width: 200,
                    child: TextFormField(
                      readOnly: true,
                      // end == null ? "No Date Selected" : '${end.toString()}',
                      // controller: _statControlle.toController,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                      decoration: InputDecoration(
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                          hintText: end == null
                              ? 'No Date Selected'.tr
                              : end.toString(),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Color(0xff8e0016),
                              width: 1,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(
                              color: Color(0xff8e0016),
                              width: 2,
                            ),
                          ),
                          prefixIcon: Padding(
                            child: IconTheme(
                              data: IconThemeData(color: Color(0xff8e0016)),
                              child: Icon(Icons.date_range_outlined),
                            ),
                            padding: EdgeInsets.only(left: 5, right: 3),
                          )),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                highlightElevation: 0.0,
                splashColor: Colors.white,
                highlightColor: Colors.white,
                elevation: 0.0,
                color: Color(0xff8e0016),
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                child: Text(
                  'Set Date'.tr,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20),
                ),
                onPressed: () {
                  dateBoxb();
                },
              )
            ],
          ),
          SizedBox(
            height: 30.0,
          ),

          ListView(
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            children: _statControlle.statList
                .map(
                  (item) => accountItems(
                      item.operationDate,
                      item.operation,
                      item.description,
                      item.valueDate,
                      item.amount,
                      item.balance,
                      item.details),
                )
                .toList(),
          ),

          // accountItems(
          //     "Book Hub Society", r"+ $ 2,876.00", "04-04-16", "Credit",
          //     oddColour: const Color(0xFFF7F7F9)),
        ],
      ),
    );
  }

  dateBoxb() {
    return showDialog(
      context: context,
      builder: (context) {
        return
            // Stack(
            //   alignment: Alignment.topCenter,
            // children: [
            Dialog(
                insetAnimationDuration: const Duration(milliseconds: 100),
                insetAnimationCurve: Curves.bounceInOut,
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                elevation: 0,
                child: Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.only(bottom: 45),
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black,
                                offset: Offset(0, 10),
                                blurRadius: 10),
                          ]),
                      child: ListView(
                        shrinkWrap: true,
                        children: <Widget>[
                          SizedBox(height: 20),
                          Center(
                            child: Text(
                              'Set Date'.tr,
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Color(0xff8e0016),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(height: 20),
                          // Padding(
                          //   padding: EdgeInsets.only(bottom: 20, top: 60),
                          //   child: TextField(),
                          // ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'From'.tr,
                              style: TextStyle(
                                fontSize: 24,
                                color: Color(0xff8e0016),
                              ),
                            ),
                          ),

                          SizedBox(height: 10),
                          Container(
                            height: 100,
                            child: CupertinoDatePicker(
                              mode: CupertinoDatePickerMode.date,
                              initialDateTime: DateTime.now(),
                              onDateTimeChanged: (newDateTime) {
                                setState(() {
                                  start = newDateTime;
                                });

                                print('${newDateTime}');
                              },
                            ),
                            // ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'To'.tr,
                              style: TextStyle(
                                fontSize: 24,
                                color: Color(0xff8e0016),
                              ),
                            ),
                          ),

                          SizedBox(height: 10),
                          Container(
                            height: 100,
                            child: CupertinoDatePicker(
                              mode: CupertinoDatePickerMode.date,
                              initialDateTime: DateTime.now(),
                              onDateTimeChanged: (DateTime newDateTime) {
                                setState(() {
                                  end = newDateTime;
                                });
                              },
                            ),
                            // ),
                          ),
                          SizedBox(height: 60),
                          // Padding(
                          //   padding: EdgeInsets.only(bottom: 20),
                          //   child: TextField(),
                          // ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 20,
                      right: 20,
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 45,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(45)),
                          child: RaisedButton(
                            onPressed: () {
                              Get.back();
                              // _statControlle.formController =
                              //     from.toString() as TextEditingController;
                              // showDateRangePicker(
                              //   context: context,
                              //   firstDate: DateTime(1990),
                              //   lastDate: DateTime.now(),
                              //   saveText: v,
                              // );
                              print('11  ${start}');
                              print('22 ${end}');
                            },
                            color: Color(0xff8e0016),
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                            child: Text(
                              'Submit'.tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )

                // Container(
                //   height: 500.0,
                //   width: 400.0,
                //   child: ListView(
                //     children: <Widget>[
                //       SizedBox(height: 20),
                //       Center(
                //         child: Text(
                //           'Set Date'.tr,
                //           style: TextStyle(
                //               fontSize: 24,
                //               color: Color(0xff8e0016),
                //               fontWeight: FontWeight.bold),
                //         ),
                //       ),
                //       SizedBox(height: 20),
                //       // Padding(
                //       //   padding: EdgeInsets.only(bottom: 20, top: 60),
                //       //   child: TextField(),
                //       // ),
                //       Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Text(
                //           'From'.tr,
                //           style: TextStyle(
                //             fontSize: 24,
                //             color: Color(0xff8e0016),
                //           ),
                //         ),
                //       ),
                //
                //       SizedBox(height: 10),
                //       Container(
                //         height: 100,
                //         child: CupertinoDatePicker(
                //           mode: CupertinoDatePickerMode.date,
                //           initialDateTime: DateTime.now(),
                //           onDateTimeChanged: (newDateTime) {
                //             setState(() {
                //               start = newDateTime;
                //             });
                //
                //             print('${newDateTime}');
                //           },
                //         ),
                //         // ),
                //       ),
                //       SizedBox(height: 10),
                //       Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Text(
                //           'To'.tr,
                //           style: TextStyle(
                //             fontSize: 24,
                //             color: Color(0xff8e0016),
                //           ),
                //         ),
                //       ),
                //
                //       SizedBox(height: 10),
                //       Container(
                //         height: 100,
                //         child: CupertinoDatePicker(
                //           mode: CupertinoDatePickerMode.date,
                //           initialDateTime: DateTime.now(),
                //           onDateTimeChanged: (DateTime newDateTime) {
                //             setState(() {
                //               end = newDateTime;
                //             });
                //           },
                //         ),
                //         // ),
                //       ),
                //       // Padding(
                //       //   padding: EdgeInsets.only(bottom: 20),
                //       //   child: TextField(),
                //       // ),
                //     ],
                //   ),
                // ),
                );
        // Positioned(
        //   // top: 200,
        //   right: 145,
        //   bottom: 90,
        // Align(
        //   alignment: Alignment(0, 0.7),
        //   child:
        //       // Padding(
        //       //   padding:
        //       //       EdgeInsets.only(left: 20, right: 20, bottom: 0.0, top: 30),
        //       // bottom: MediaQuery.of(context).viewInsets.bottom
        //       // child:
        //       //   Container(
        //       // child:
        //       RaisedButton(
        //     onPressed: () {
        //       Get.back();
        //       // _statControlle.formController =
        //       //     from.toString() as TextEditingController;
        //       // showDateRangePicker(
        //       //   context: context,
        //       //   firstDate: DateTime(1990),
        //       //   lastDate: DateTime.now(),
        //       //   saveText: v,
        //       // );
        //       print('11  ${start}');
        //       print('22 ${end}');
        //     },
        //
        //     // LinearDatePicker(
        //     //     startDate: "2004/10/17", //yyyy/mm/dd
        //     //     endDate: "2020/02/20",
        //     //     initialDate: "2010/11/15",
        //     //     dateChangeListener: (String selectedDate) {
        //     //       print(selectedDate);
        //     //     },
        //     //     showDay: true, //false -> only select year & month
        //     //     fontFamily: 'sans',
        //     //     showLabels:
        //     //         true, // to show column captions, eg. year, month, etc.
        //     //     textColor: Colors.black,
        //     //     selectedColor: Colors.deepOrange,
        //     //     unselectedColor: Colors.blueGrey,
        //     //     yearText: " year",
        //     //     monthText: " month",
        //     //     dayText: " day",
        //     //     columnWidth: 100,
        //     //     isJalaali: false // false -> Gregorian
        //     //     ),
        //
        //     // Get.back();
        //     // },
        //     color: Color(0xff8e0016),
        //     shape: RoundedRectangleBorder(
        //         borderRadius: new BorderRadius.circular(30.0)),
        //     child: Text(
        //       'Submit'.tr,
        //       textAlign: TextAlign.center,
        //       style: TextStyle(
        //         color: Colors.white,
        //         fontSize: 20,
        //       ),
        //     ),
        //   ),
        //   // height: 50,
        //   //width: 10,
        //   // ),
        //   // ),
        // ),
        //   ],
        // );
      },
    );
  }
}
