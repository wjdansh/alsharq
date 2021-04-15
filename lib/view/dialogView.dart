import 'dart:developer';
import 'dart:io';
import 'dart:isolate';
import 'dart:ui';
import 'dart:async';
import 'package:alsharq/Complaint/complaintController.dart';
import 'package:alsharq/Message/MesssageController.dart';
import 'package:alsharq/MyDashboard/AccountController.dart';
import 'package:alsharq/MyDashboard/StatementsAccuontController.dart';
import 'package:alsharq/main/menuController.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:vector_math/vector_math.dart' as math;

class Constants {
  Constants._();
  static const double padding = 20;
  static const double avatarRadius = 45;
}

class showCustomDialog {
  final MessageController _messageController = Get.put(MessageController());
  final _formKey = GlobalKey<FormState>();
  final menuControl _menuContoller = Get.put(menuControl());

  final AccountsController _accountControlle = Get.put(AccountsController());
  final statementAccountController _sControlle =
      Get.put(statementAccountController());

  final ComplaintController complaintController =
      Get.put(ComplaintController());

  List _dur = ['9:00-11:00', '11:00-14:00', '14:00-16:00'];
  List _subj = ['Bank Account ', 'Cards', 'Loan'];

  Future show_dialog(context, description, B1, B2) async {
    // final navigatorKey = GlobalKey<NavigatorState>();
    // final context = navigatorKey.currentState.overlay.context;
    //navigatorKey.currentState.overlay.insert(anyDialog);
    return WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Get.generalDialog(
          barrierColor: Colors.black.withOpacity(0.5),
          transitionBuilder: (context, a1, a2, widget) {
            final curvedValue = Curves.bounceOut.transform(a1.value) - 1.0;
            return Transform.scale(
              scale: a1.value,
              //angle: math.radians(a1.value * 360),
              // transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
              child: Opacity(
                opacity: a1.value,
                child: Dialog(
                  backgroundColor: Colors.transparent,
                  // shape: OutlineInputBorder(
                  // borderRadius: BorderRadius.circular(16.0)),
                  child: content_Box(context, description, B1, B2),
                ),
              ),
            );
          },
          transitionDuration: Duration(milliseconds: 300),
          barrierDismissible: true,
          barrierLabel: '',
          pageBuilder: (context, animation1, animation2) {});
    });
  }

  content_Box(context, description, B1, B2) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
              left: Constants.padding,
              top: Constants.avatarRadius + Constants.padding,
              right: Constants.padding,
              bottom: Constants.padding),
          margin: EdgeInsets.only(top: Constants.avatarRadius),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(Constants.padding),
              boxShadow: [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // Text(
              //   widget.title,
              //   style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              // ),
              // SizedBox(
              //   height: 15,
              // ),
              Text(
                description,
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 22,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FlatButton(
                      onPressed: () {
                        //  Get.currentRoute=='/mainMenu'?Get.currentRoute.='/mai':print('1155 ${Get.isPopGestureEnable} ');

                        Get.back();
                        //_menuContoller.setSidebarState();

                        //Get.currentRoute=/loginView;
                        // Get.toNamed('/mainMenu');
                        //.then((value) => Get.back());

                        // Get.snackbar(
                        //   '', '',
                        //   //  backgroundColor: Color(0xff8e0016).withOpacity(0.2)
                        //   duration: Duration(milliseconds: 1),
                        //   backgroundColor:
                        //       Color(0XFFFFDDDA).withOpacity(0.0000001),
                        // );
                        // Navigator.pop(
                        //   Get.overlayContext,
                        // );

                        //Get.back();
                        //     // canPop: false,
                        //     // closeOverlays: false,
                        //     // result: print(OutputElement().value)
                        //     );
                      },
                      child: Text(
                        B1,
                        style: TextStyle(
                          color: Color(0xff8e0016).withOpacity(0.7),
                          fontSize: 16,
                        ),
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        Get.offAllNamed('/loginView');
                      },
                      child: Text(
                        B2,
                        style: TextStyle(
                          color: Color(0xff8e0016).withOpacity(0.7),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: Constants.padding,
          right: Constants.padding,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: Constants.avatarRadius,
            child: ClipRRect(
                borderRadius:
                    BorderRadius.all(Radius.circular(Constants.avatarRadius)),
                child: Image.asset("assets/images/Logo-Icon.png")),
          ),
        ),
      ],
    );
  }

  show_Message() {
    return Get.generalDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          final curvedValue = Curves.bounceOut.transform(a1.value) - 1.0;
          return Transform.scale(
            scale: a1.value,
            //angle: math.radians(a1.value * 360),
            // transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
            child: Opacity(
              opacity: a1.value,
              child: Dialog(
                backgroundColor: Colors.transparent,

                // shape: OutlineInputBorder(
                //     borderRadius: BorderRadius.circular(16.0)),
                child:
                    //Complaint(),
                    //Account(),
                    Message(context),
              ),
            ),
          );
        },
        transitionDuration: Duration(milliseconds: 400),
        barrierDismissible: true,
        barrierLabel: '',
        pageBuilder: (context, animation1, animation2) {});
  }

  Message(context) {
    return Form(
      key: _formKey,
      child: Container(
        //height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(top: 40, left: 10, right: 10),
        decoration: BoxDecoration(
          color: Color(0xff585f67).withOpacity(0.6),
        ),
        child:
            //ListView(shrinkWrap: true,
            SingleChildScrollView(
          // physics: NeverScrollableScrollPhysics(),
          child: SizedBox(
            // height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // Image.asset(
                //   'assets/images/bank.png',
                //   width: 150,
                //   height: Get.width / 4,
                // ),

                Text(
                  'Message'.tr,
                  // textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.white.withOpacity(.7),
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 30),
                TextFormField(
                  keyboardType: TextInputType.multiline,

                  decoration: InputDecoration(
                    fillColor: Colors.grey[200],
                    filled: true,
                    hintText: 'Message hint'.tr,
                    contentPadding:
                        const EdgeInsets.only(top: 10, bottom: 150, left: 10),
                  ),

                  controller: _messageController.messController,

                  //   validator: (value) =>
                  //   value.isEmpty ? 'Password can\'t be empty' : null,
                  //   onSaved: (value) => _sr = value.trim(),
                  // ),

                  validator: (value) =>
                      value.trim().isEmpty ? 'emptyerror'.tr : null,
                ),
                SizedBox(height: 50),

                MaterialButton(
                  color: Color(0xff8e0016),
                  splashColor: Color(0xff8e0016),
                  height: 50,
                  minWidth: Get.width / 2,
                  child: Text(
                    'Send'.tr,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      if (_messageController.isLoading = true) {
                        showDialog(
                            builder: (context) => Center(
                                    child: SpinKitFadingCircle(
                                  color: Color(0xff8e0016),
                                )),
                            barrierColor: Colors.white.withOpacity(0.5),
                            context: context);
                      }

                      print('send');
                      _messageController.apiMessage();
                    }
                  },
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //
  // Account() {
  //   return Container(
  //     color: Colors.white.withOpacity(0.1),
  //     width: 1000,
  //     height: 500,
  //
  //     // height: MediaQuery.of(context).size.height,
  //     child: Padding(
  //       padding: const EdgeInsets.all(10.0),
  //       child: SingleChildScrollView(
  //         //  physics: NeverScrollableScrollPhysics(),
  //         // child: Column(
  //         //   // itemExtent: 200,
  //         //   children: [
  //         child: displayAccoutList(),
  //       ),
  //     ),
  //   );
  // }
  //
  // Widget accountItems(
  //   String account,
  //   String casc,
  //   String currency,
  //   String balance,
  //   String clientStatus,
  // ) {
  //   return Material(
  //     child: InkWell(
  //       child: Ink(
  //         decoration: BoxDecoration(
  //             color: clientStatus == 'Not Active  '.tr
  //                 ? Colors.black12
  //                 : Colors.white),
  //         padding:
  //             EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
  //         // child: InkWell(
  //         child: Column(
  //           children: <Widget>[
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: <Widget>[
  //                 Row(
  //                   children: [
  //                     Icon(
  //                       Icons.account_circle,
  //                       size: 14,
  //                       color: Color(0xff8e0016).withOpacity(0.3),
  //                     ),
  //                     SizedBox(
  //                       width: 5.0,
  //                     ),
  //                     Text('Account'.tr, style: TextStyle(fontSize: 16.0)),
  //                     Text('* $clientStatus',
  //                         style: TextStyle(
  //                             fontSize: 10.0,
  //                             color: clientStatus == 'Not Active  '
  //                                 ? Colors.red
  //                                 : Colors.green))
  //                   ],
  //                 ),
  //                 Text('$currency  $balance',
  //                     style: TextStyle(
  //                         fontSize: 14.0, color: Colors.black.withGreen(200)))
  //               ],
  //             ),
  //             SizedBox(
  //               height: 5.0,
  //             ),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: <Widget>[
  //                 Text(account,
  //                     style: TextStyle(color: Colors.black38, fontSize: 14.0)),
  //                 Text('casc:'.tr + '$casc',
  //                     style: TextStyle(color: Colors.black38, fontSize: 14.0))
  //               ],
  //             ),
  //             SizedBox(
  //               height: 10.0,
  //             ),
  //             Divider(color: Colors.black54),
  //           ],
  //         ),
  //
  //         // ),
  //       ),
  //       onTap: () {
  //         //_sControlle.onInit();
  //         Get.toNamed('/MyAccount');
  //       },
  //     ),
  //   );
  // }
  //
  // displayAccoutList() {
  //   //List<Account> AccountList = [];
  //
  //   print('8888  ${_accountControlle.accList}');
  //   // while (_accountControlle.accList == null) {
  //   //   return Center(
  //   //       child: SpinKitFadingCircle(
  //   //     color: Color(0xff8e0016),
  //   //   ));
  //   // }
  //   return ListView(
  //     physics: ClampingScrollPhysics(),
  //     shrinkWrap: true,
  //     children: _accountControlle.accList
  //         .map(
  //           (item) => accountItems(item.account, item.casc, item.currency,
  //               item.balance, item.clientStatus),
  //         )
  //         .toList(),
  //   );
  // }
  //
  // Complaint() {
  //   return Container(
  //     padding: EdgeInsets.only(top: 10, left: 10, right: 10),
  //     decoration: BoxDecoration(
  //       color: Colors.white.withOpacity(0.5),
  //     ),
  //     child:
  //         //ListView(shrinkWrap: true,
  //         SingleChildScrollView(
  //       // physics: NeverScrollableScrollPhysics(),
  //       // child: SizedBox(
  //       //   height: MediaQuery.of(context).size.height,
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         crossAxisAlignment: CrossAxisAlignment.stretch,
  //         children: <Widget>[
  //           // Image.asset(
  //           //   'assets/images/bank.png',
  //           //   width: 150,
  //           //   height: Get.width / 4,
  //           // ),
  //
  //           // SizedBox(height: 20),  complaintController   builder: (controller)
  //           GetBuilder<ComplaintController>(builder: (controller) {
  //             return DropdownButtonFormField<dynamic>(
  //               iconSize: 40,
  //               isDense: true,
  //               iconEnabledColor: Colors.black,
  //               iconDisabledColor: Colors.blue,
  //               // underline: SizedBox(),
  //               decoration: InputDecoration(
  //                 labelText: 'Preferred time'.tr,
  //                 border: OutlineInputBorder(),
  //                 enabledBorder: InputBorder.none,
  //               ),
  //
  //               isExpanded: true,
  //
  //               focusColor: Colors.blue,
  //
  //               elevation: 3,
  //               style: TextStyle(
  //                 color: Colors.black,
  //               ),
  //               items: _dur.map((item) {
  //                 return DropdownMenuItem(
  //                   child: new Text(item),
  //                   value: item.toString(),
  //                 );
  //               }).toList(),
  //
  //               onChanged: (newVal) {
  //                 complaintController.updateValuedu(newVal);
  //               },
  //
  //               value: complaintController.time,
  //             );
  //             //   ],
  //             // );
  //
  //             // } else {
  //             //   return Text("error");
  //             // }
  //           }),
  //           SizedBox(height: 2),
  //
  //           GetBuilder<ComplaintController>(builder: (controller) {
  //             return DropdownButtonFormField(
  //               iconSize: 40,
  //               iconEnabledColor: Colors.black,
  //               // iconDisabledColor: Colors.blue,
  //               // underline: SizedBox(),
  //               decoration: InputDecoration(
  //                 labelText: 'Complaint subject      '.tr,
  //                 border: OutlineInputBorder(),
  //                 enabledBorder: InputBorder.none,
  //               ),
  //
  //               //  borderSide: BorderSide(color: Colors.white))),
  //
  //               isExpanded: true,
  //               value: complaintController.sub,
  //
  //               elevation: 3,
  //               style: TextStyle(
  //                 color: Colors.black,
  //               ),
  //               items: _subj.map((item) {
  //                 return DropdownMenuItem(
  //                   child: Text(item),
  //                   value: item,
  //                 );
  //               }).toList(),
  //
  //               onChanged: (newVall) {
  //                 complaintController.updateValuesub(newVall);
  //               },
  //             );
  //             //   ],
  //             // );
  //           }),
  //           // SizedBox(height: 10),
  //           // SingleChildScrollView(
  //           //   scrollDirection: Axis.horizontal,
  //           //   child: Column(
  //           //     children: <Widget>[
  //           //       ListTile(
  //           //         title: const Text('Yes'),
  //           //         leading: Radio(
  //           //           value: 'yes',
  //           //           groupValue: complaintController.rad,
  //           //           onChanged: (newVal) {
  //           //             complaintController.updateValuerad(newVal);
  //           //           },
  //           //         ),
  //           //       ),
  //           //       ListTile(
  //           //         title: const Text('No'),
  //           //         leading: Radio(
  //           //           value: 'no',
  //           //           groupValue: complaintController.rad,
  //           //           onChanged: (newVal) {
  //           //             complaintController.updateValuerad(newVal);
  //           //           },
  //           //         ),
  //           //       ),
  //           //     ],
  //           //   ),
  //           // ),
  //           SizedBox(height: 20),
  //           Text(
  //             'Complaint'.tr,
  //             // textAlign: TextAlign.left,
  //             style: TextStyle(
  //               color: Colors.white.withOpacity(.7),
  //               fontSize: 20,
  //             ),
  //           ),
  //           SizedBox(height: 10),
  //           TextFormField(
  //             keyboardType: TextInputType.multiline,
  //             maxLines: null,
  //             decoration: InputDecoration(
  //               fillColor: Colors.grey[200],
  //               filled: true,
  //               // labelText: 'Complaint',
  //               hintText: 'complaint hint'.tr,
  //               contentPadding:
  //                   const EdgeInsets.only(top: 10, bottom: 70, left: 10),
  //             ),
  //             controller: complaintController.scController,
  //             validator: (value) =>
  //                 value.trim().isEmpty ? 'emptyerror'.tr : null,
  //           ),
  //           SizedBox(height: 16),
  //           Text(
  //             'Suggestion'.tr,
  //             // textAlign: TextAlign.left,
  //             style: TextStyle(
  //               color: Colors.white.withOpacity(.7),
  //               fontSize: 20,
  //             ),
  //           ),
  //           SizedBox(height: 10),
  //           TextFormField(
  //             keyboardType: TextInputType.multiline,
  //             maxLines: null,
  //             decoration: InputDecoration(
  //               //isCollapsed: true,
  //               fillColor: Colors.grey[200],
  //               filled: true,
  //               // labelText: 'Complaint',
  //               hintText: 'Suggestion hint'.tr,
  //               contentPadding:
  //                   const EdgeInsets.only(top: 10, bottom: 70, left: 10),
  //             ),
  //
  //             controller: complaintController.ssController,
  //
  //             //   validator: (value) =>
  //             //   value.isEmpty ? 'Password can\'t be empty' : null,
  //             //   onSaved: (value) => _sr = value.trim(),
  //             // ),
  //
  //             validator: (value) =>
  //                 value.trim().isEmpty ? 'emptyerror'.tr : null,
  //           ),
  //           SizedBox(height: 20),
  //           MaterialButton(
  //             color: Color(0xff8e0016),
  //             splashColor: Color(0xff8e0016),
  //             height: 50,
  //             minWidth: Get.width / 2,
  //             child: Text(
  //               'Send'.tr,
  //               style: TextStyle(
  //                 color: Colors.white,
  //                 fontSize: 20,
  //               ),
  //               textAlign: TextAlign.center,
  //             ),
  //             onPressed: () {
  //               if (_formKey.currentState.validate()) {
  //                 if (complaintController.isLoading = true) {
  //                   showDialog(
  //                       barrierColor: Colors.white.withOpacity(0.5),
  //                       //context: context,
  //                       child: Center(
  //                           child: SpinKitFadingCircle(
  //                         color: Color(0xff8e0016),
  //                       )));
  //                 }
  //
  //                 print('send');
  //                 print('${complaintController.time}');
  //                 complaintController.apiComplaint();
  //               }
  //             },
  //           ),
  //           SizedBox(height: 20),
  //         ],
  //       ),
  //     ),
  //   );
  // }

}
//
// import 'dart:ui';
// import 'package:flutter/animation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class Constants {
//   Constants._();
//   static const double padding = 20;
//   static const double avatarRadius = 45;
// }

class CustomDialogBox extends StatefulWidget {
  final String descriptions, B1, B2;
  final Image img;

  const CustomDialogBox(
      {Key key, this.B1, this.descriptions, this.B2, this.img})
      : super(key: key);

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return

        // return showDialog();
        //vv();
        // showNewDialog(
        //     context: context,
        //     builder: (BuildContext context) {
        //       return AlertDialog(
        //         title: Text("Bounce In"),
        //       );
        //Dialog(child:Get.dialog(contentBox(context)));
        Dialog(
      // insetAnimationDuration: Duration(milliseconds: 5000),
      // insetAnimationCurve: Curves.bounceInOut,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(),
    );
  }

  contentBox() {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
              left: Constants.padding,
              top: Constants.avatarRadius + Constants.padding,
              right: Constants.padding,
              bottom: Constants.padding),
          margin: EdgeInsets.only(top: Constants.avatarRadius),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(Constants.padding),
              boxShadow: [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // Text(
              //   widget.title,
              //   style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              // ),
              // SizedBox(
              //   height: 15,
              // ),
              Text(
                widget.descriptions,
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 22,
              ),
              Align(
                // alignment: Alignment.bottomRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FlatButton(
                      onPressed: () {
                        Get.back();

                        // print('1155 ${Get.isPopGestureEnable} ');
                        // print('1155 ${Get.defaultDialogTransitionDuration} ');
                        // print('1155 ${Get.defaultPopGesture} ');
                        // print('1155 ${Get.currentRoute.isCurrency} ');
                        // //  Get.currentRoute=='/mainMenu'?Get.currentRoute.='/mai':print('1155 ${Get.isPopGestureEnable} ');
                        // Get.back(
                        //   // closeOverlays: true,
                        //   canPop: false,
                        // );

                        //Get.currentRoute=/loginView;
                        // Get.toNamed('/mainMenu');
                        //.then((value) => Get.back());

                        // Get.snackbar(
                        //   '', '',
                        //   //  backgroundColor: Color(0xff8e0016).withOpacity(0.2)
                        //   duration: Duration(milliseconds: 1),
                        //   backgroundColor:
                        //       Color(0XFFFFDDDA).withOpacity(0.0000001),
                        // );
                        //
                        // Get.back();
                        // Navigator.pop(
                        //   Get.overlayContext,
                        // );

                        //Get.back();
                        //     // canPop: false,
                        //     // closeOverlays: false,
                        //     // result: print(OutputElement().value)
                        //     );
                      },
                      child: Text(
                        widget.B1.tr,
                        style: TextStyle(
                          color: Color(0xff8e0016).withOpacity(0.7),
                          fontSize: 16,
                        ),
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        Get.offAllNamed('/loginView');
                      },
                      child: Text(
                        widget.B2.tr,
                        style: TextStyle(
                          color: Color(0xff8e0016).withOpacity(0.7),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: Constants.padding,
          right: Constants.padding,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: Constants.avatarRadius,
            child: ClipRRect(
                borderRadius:
                    BorderRadius.all(Radius.circular(Constants.avatarRadius)),
                child: Image.asset("assets/images/Logo-Icon.png")),
          ),
        ),
      ],
    );
  }

  //
  // Future<T> showNewDialog<T>({
  //   @required BuildContext context,
  //   bool barrierDismissible = true,
  //   Widget child,
  //   WidgetBuilder builder,
  // }) {
  //   assert(child == null || builder == null);
  //   assert(debugCheckHasMaterialLocalizations(context));
  //
  //   final ThemeData theme = Theme.of(context, shadowThemeOnly: true);
  //   return showGeneralDialog(
  //     context: context,
  //     pageBuilder: (BuildContext buildContext, Animation<double> animation,
  //         Animation<double> secondaryAnimation) {
  //       final Widget pageChild = child ?? Builder(builder: builder);
  //       return Builder(builder: (BuildContext context) {
  //         return theme != null ? Theme(data: theme, child: pageChild) : pageChild;
  //       });
  //     },
  //     barrierDismissible: barrierDismissible,
  //     barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
  //     barrierColor: Colors.black54,
  //     transitionDuration: const Duration(milliseconds: 400),
  //     transitionBuilder: _buildNewTransition,
  //   );
  // }
  //
  // Widget _buildNewTransition(
  //     BuildContext context,
  //     Animation<double> animation,
  //     Animation<double> secondaryAnimation,
  //     Widget child,
  //     ) {
  //   return ScaleTransition(
  //     scale: CurvedAnimation(
  //       parent: animation,
  //       curve: Curves.bounceIn,
  //       reverseCurve: Curves.bounceIn,
  //     ),
  //     child: child,
  //   );
  // }
  // vv() {
  //   AnimationController controller;
  //   Animation<double> opacityAnimation;
  //   Tween<double> opacityTween = Tween<double>(begin: 0.0, end: 1.0);
  //   Tween<double> marginTopTween = Tween<double>(begin: 300, end: 280);
  //   Animation<double> marginTopAnimation;
  //   return showGeneralDialog(
  //     barrierLabel: "Label",
  //     barrierDismissible: true,
  //     barrierColor: Colors.black.withOpacity(0.5),
  //     transitionDuration: Duration(milliseconds: 700),
  //     context: context,
  //     pageBuilder: (context, anim1, anim2) {
  //       return Align(
  //         alignment: Alignment.bottomCenter,
  //         child: Container(
  //           height: 300,
  //           child: Dialog(
  //             insetAnimationDuration: const Duration(milliseconds: 100),
  //             insetAnimationCurve: Curves.bounceInOut,
  //             shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(Constants.padding),
  //             ),
  //             elevation: 0,
  //             backgroundColor: Colors.transparent,
  //             child: contentBox(context),
  //           ),
  //           margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
  //           decoration: BoxDecoration(
  //             color: Colors.white,
  //             borderRadius: BorderRadius.circular(40),
  //           ),
  //         ),
  //       );
  //     },
  //     transitionBuilder: (context, anim1, anim2, child) {
  //       return SlideTransition(
  //         position:
  //             Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim1),
  //         child: child,
  //       );
  //     },
  //   );
  // }
  // showDialog() {
  //   return showGeneralDialog(
  //       barrierColor: Colors.black.withOpacity(0.5),
  //       transitionBuilder: (context, a1, a2, widget) {
  //         final curvedValue = Curves.easeInOutBack.transform(a1.value) - 1.0;
  //         return Transform(
  //           transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
  //           child: Opacity(
  //             opacity: a1.value,
  //             child: AlertDialog(
  //               shape: OutlineInputBorder(
  //                   borderRadius: BorderRadius.circular(16.0)),
  //               title: Text('Hello!!'),
  //               content: Text('How are you?'),
  //             ),
  //           ),
  //         );
  //       },
  //       transitionDuration: Duration(milliseconds: 200),
  //       barrierDismissible: true,
  //       barrierLabel: '',
  //       context: context,
  //       pageBuilder: (context, animation1, animation2) {});
  // }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
