import 'dart:ui';
import 'package:alsharq/utility/langServices.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'loginController.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class logInView extends StatefulWidget {
  @override
  _logInViewState createState() => _logInViewState();
}

class _logInViewState extends State<logInView> {
  final LoginController _loginController = Get.put(LoginController());
  LocalizationService tran = new LocalizationService();

  final _formKey = GlobalKey<FormState>();

  bool passwordVisibility = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/back.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.only(left: 20, right: 20, top: 80, bottom: 100),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Form(
            key: _formKey,
            child: Container(
              padding: EdgeInsets.only(top: 10, left: 10, right: 10),
              decoration: BoxDecoration(
                color: Color(0xff585f67).withOpacity(0.6),
              ),
              child: SingleChildScrollView(
                // physics: NeverScrollableScrollPhysics(),

                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      DropdownButtonHideUnderline(
                        child: Padding(
                          padding:

                              // const
                              EdgeInsets.only(
                            left: MediaQuery.of(context).size.height / 3,
                          ),
                          //   // alignedDropdown: true,
                          child: Align(
                            alignment: Alignment.center,
                            child: DropdownButton<dynamic>(
                              hint: Text('AR\nEN',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white)),
                              isExpanded: true,
                              underline: SizedBox(),
                              icon: Icon(
                                Icons.language,
                                color: Colors.white,
                                size: 30,
                              ),
                              onChanged: (val) {
                                setState(() {
                                  _loginController.lan = val;
                                  tran.change(_loginController.lan);
                                });
                                print('22  ${_loginController.lan}');
                              },
                              items: tran.langs.map((item) {
                                return DropdownMenuItem(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Icon(item == 'Arabic'
                                      //     ?
                                      Container(
                                        width: 25,
                                        height: 40,
                                        child: item == 'Arabic'
                                            ? Image.asset(
                                                "assets/images/sy.jpg")
                                            : Image.asset(
                                                "assets/images/en.jpg"),
                                      ),
                                      Text(item),
                                    ],
                                  ),
                                  value: item.toString(),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                      Image.asset(
                        'assets/images/bank.png',
                        width: 150,
                        height: Get.width / 4,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'enterance'.tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _loginController.emailTextController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          fillColor: Colors.grey[200],
                          filled: true,
                          hintText: 'UserName'.tr,
                          prefixIcon: Icon(Icons.person_pin),
                        ),
                        validator: (value) =>
                            value.trim().isEmpty ? 'UserName'.tr : null,
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: _loginController.passwordTextController,
                        keyboardType: TextInputType.text,
                        obscureText: passwordVisibility,
                        decoration: InputDecoration(
                            fillColor: Colors.grey[200],
                            filled: true,
                            hintText: 'password'.tr,
                            prefixIcon: Icon(Icons.lock_outline),
                            suffixIcon: IconButton(
                                icon: Icon(passwordVisibility == true
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    passwordVisibility = !passwordVisibility;
                                  });
                                })),
                        validator: (value) =>
                            value.trim().isEmpty ? 'password'.tr : null,
                      ),
                      SizedBox(height: 16),
                      MaterialButton(
                        color: Color(0xff8e0016),
                        splashColor: Color(0xff8e0016),
                        height: 50,
                        minWidth: Get.width / 2,
                        child: Text(
                          'login'.tr,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            // _loginController.isLoading
                            //                                 ? showDialog(
                            //                                     context: context,
                            //                                     child: CircularProgressIndicator())
                            //                                 :

                            if (_loginController.isLoading = true) {
                              showDialog(
                                  builder: (context) => Center(
                                          child: SpinKitFadingCircle(
                                        color: Color(0xff8e0016),
                                      )),
                                  barrierColor: Colors.white.withOpacity(0.5),
                                  context: context);
                            }

                            // if (_loginController.isLoading = false) {

                            print('login');

                            _loginController.apiLogin();
                          }
                        },
                      ),
                      SizedBox(height: 20),
                      FlatButton(
                        splashColor: Color(0xff8e0016),
                        onPressed: () {
                          // tran.change('English');
                          Get.toNamed('/ResetPass');
                        },
                        child: Text(
                          'Forget Password'.tr,
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.8),
                              fontSize: 16,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
