import 'dart:async';
import 'package:alsharq/MyDashboard/StatementsAccuontController.dart';
import 'package:alsharq/log-in/loginController.dart';
import 'package:alsharq/utility/langServices.dart';
import 'package:alsharq/view/dialogView.dart';
import 'package:flutter/material.dart';
import 'menuController.dart';
import 'package:get/get.dart';
import 'mainDownB.dart';
import 'package:percent_indicator/percent_indicator.dart';

class animatedContent extends StatefulWidget {
  @override
  _animatedContentState createState() => _animatedContentState();
}

class _animatedContentState extends State<animatedContent> {
  final menuControl _menuContoller = Get.put(menuControl());

  final statementAccountController _sControlle =
      Get.put(statementAccountController());

  //final _formKey = GlobalKey<FormState>();

  final LoginController _loginController = Get.put(LoginController());

  LocalizationService tran = new LocalizationService();

  int percent = 0;
  Timer timer;

  @override
  Widget build(BuildContext context) {
    timeBar();

    // print('rr  ${timer}');
    return GestureDetector(
      onTap: () {
        //sidebarOpen = !sidebarOpen;
        _menuContoller.setSidebarState();
      },
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: GetBuilder<menuControl>(builder: (controller) {
          return AnimatedContainer(
            height: MediaQuery.of(context).size.height,
            curve: Curves.easeInOut,
            duration: Duration(milliseconds: 200),
            transform: Matrix4.translationValues(
                _menuContoller.xOffset, _menuContoller.yOffset, 1.0)
              ..scale(_menuContoller.pageScale),
            width: double.infinity,
            // height: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/back.jpg"),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 6,
                    offset: Offset(2, 2),
                  ),
                ],
                borderRadius: _menuContoller.sidebarOpen
                    ? BorderRadius.circular(20)
                    : BorderRadius.circular(0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  color: Colors.black.withOpacity(0.2),
                  // margin: const EdgeInsets.only(top: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      GestureDetector(
                        // onTap: () {
                        //   //sidebarOpen = !sidebarOpen;
                        //   _menuContoller.setSidebarState();
                        // },
                        child: Container(
                          margin: const EdgeInsets.only(top: 30),
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.menu,
                                color: Colors.white,
                                size: 30,
                              ),

                              // SizedBox(
                              //   width: 10,
                              // ),

                              // SizedBox(width: 55),
                              // Text(
                              //   "My Dashboard",
                              //   style: TextStyle(
                              //       color: Colors.white.withOpacity(0.7),
                              //       fontSize: 25),
                              // ),
                              // SizedBox(width: 55),
                              IconButton(
                                  icon: new Stack(
                                    children: <Widget>[
                                      new Icon(
                                        Icons.notifications,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      new Positioned(
                                        right: 0,
                                        child: new Container(
                                          padding: EdgeInsets.all(1),
                                          decoration: new BoxDecoration(
                                            color: Color(0xff8e0016),
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                          constraints: BoxConstraints(
                                            minWidth: 12,
                                            minHeight: 12,
                                          ),
                                          child: new Text(
                                            '9',
                                            style: new TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // title: Text('Notifications'),
                                  // // Icon(
                                  //   Icons.notifications,
                                  //   color: Colors.white,
                                  //   size: 40,
                                  // ),
                                  onPressed: () {
                                    // showCustomDialog show =
                                    //     new showCustomDialog();
                                    // show.show_dialog('k', 'B1', 'B2');
                                    // show.show_dialog(
                                    //   'Do you want to exit this application?',
                                    //   'Yes',
                                    //   'No',
                                    // );
                                  }

                                  //_sControlle.onInit,
                                  ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: CircularPercentIndicator(
                      //     radius: 100.0,
                      //     lineWidth: 10.0,
                      LinearPercentIndicator(
                        width: MediaQuery.of(context).size.width,
                        //  circularStrokeCap: CircularStrokeCap.round,
                        animation: true,
                        lineHeight: 18.0,
                        animationDuration: 300000,
                        percent: 1.0,
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        // double.parse(_ccControlle.timeout.toString())/1000,
                        center:
                            // Padding(
                            //   padding: const EdgeInsets.all(16.0),
                            //   child:
                            Text(
                          'time of the session'.tr,
                          style: new TextStyle(fontSize: 14.0),
                        ),
                        // ),
                        // linearStrokeCap: LinearStrokeCap.roundAll,
                        progressColor: percent < 37
                            ? Color(0xff74ad7d)
                            : percent < 75
                                ? Color(0xffe3dd8a)
                                : Color(0xffc43b3b),
                      ),
                      // ),
                    ],
                  ),
                ),
                // Text(
                //   'Hello',
                //   textAlign: TextAlign.center,
                //   style: TextStyle(fontSize: 80, color: Colors.white),
                // ),
                //Mydashboard(),
                //mainv(),

                // bottom row
                Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 70.0,
                        color: Colors.black.withOpacity(0.5),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: Column(
                              //  mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      // Scaffold(
                                      //   extendBody: false,
                                      //   bottomNavigationBar: BottomNavigationBar(
                                      //       currentIndex: _pindex,
                                      //       // elevation: 0.0,
                                      //       onTap: _X,
                                      //       items: [
                                      //         BottomNavigationBarItem(
                                      //             icon: Icon(
                                      //                 Icons.work_outline_sharp),
                                      //             title: Text("My Accounts")),
                                      //         BottomNavigationBarItem(
                                      //             icon: Icon(Icons.call_rounded),
                                      //             title: Text("Contact us")),
                                      //         BottomNavigationBarItem(
                                      //             icon: Icon(
                                      //                 Icons.warning_amber_outlined),
                                      //             title:
                                      //                 Text("Report an Incident'")),

                                      mainDownBotton(
                                          'My Accounts'.tr,
                                          Icons.work_outline_sharp,
                                          '/Mydashboard' //'/mainMenu'
                                          ),
                                      mainDownBotton('Send Message'.tr,
                                          Icons.email, '/MassegeView'),
                                      mainDownBotton(
                                          'Send Complaint'.tr,
                                          Icons.warning_amber_outlined,
                                          '/sendreport'),
                                    ]),
                                // )
                                // mainDownBotton(
                                //     'My Accounts', Icons.work_outline_sharp),
                                // mainDownBotton(
                                //     'Contact us', Icons.call_rounded),
                                // mainDownBotton('Report an Incident',
                                //     Icons.warning_amber_outlined),
                              ],
                            ),
                            //  ],
                          ),
                        ),
                      ),
                    ),
                    // ),
                  ],
                ),
              ],
            ),
          );
        }),
        // ),
        // bottomNavigationBar: BottomNavigationBar(
        //     currentIndex: _pindex,
        //     // elevation: 0.0,
        //     onTap: _X,
        //     items: [
        //       BottomNavigationBarItem(
        //           icon: Icon(Icons.work_outline_sharp),
        //           title: Text("My Accounts")),
        //       BottomNavigationBarItem(
        //           icon: Icon(Icons.call_rounded), title: Text("Contact us")),
        //       BottomNavigationBarItem(
        //           icon: Icon(Icons.warning_amber_outlined),
        //           title: Text("Report an Incident'")),
        //
        //       // mainDownBotton('My Accounts', Icons.work_outline_sharp),
        //       // mainDownBotton('Contact us', Icons.call_rounded),
        //       // mainDownBotton('Report an Incident', Icons.warning_amber_outlined),
        //     ]),
      ),
    );
  }

  void timeBar() {
    timer = new Timer.periodic(Duration(seconds: 30), (Timer tim) {
      setState(() {
        percent += 1;
      });
      // print('Percent Update $percent');
      if (percent == 10) {
        setState(() {
          tim.cancel();
          // percent = 0;
        });

        //percent = 0;
      }
      // print('Percent Update $percent');
    });
  }
  //
  // @override
  // void dispose() {
  //   timer.cancel();
  //   super.dispose();
  // }
}
