import 'package:alsharq/utility/langServices.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'utility/routes.dart';

void main() {
  runApp(AlSharqBank());
}

class AlSharqBank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Bank Alsharq',
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.upToDown,
      getPages: viewsRouter.route,
      initialRoute: '/SplashScreen',

      //
      locale: LocalizationService.locale,
      fallbackLocale: LocalizationService.fallbackLocale,
      translations: LocalizationService(),
      theme: ThemeData(
        primarySwatch: Colors.red,
        primaryColor: Color(0xff8e0016),
      ),
    );
  }
}
