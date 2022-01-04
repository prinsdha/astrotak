import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'core/constant/app_themes.dart';
import 'core/utils/app_routes.dart';
import 'core/utils/bindings.dart';
import 'global.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, child) => MediaQuery(
        child: child as Widget,
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      ),
      title: "AstroTak",
      initialBinding: BaseBinding(),
      debugShowCheckedModeBanner: false,
      initialRoute: getInitialRoute,
      getPages: routes,
      theme: AppTheme.defTheme,
    );
  }
}
