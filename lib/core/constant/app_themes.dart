import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_color.dart';

class AppTheme {
  static final ThemeData defTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.kScaffoldColor,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    appBarTheme: AppBarTheme(
        elevation: 0,
        color: Colors.transparent,
        centerTitle: true,
        systemOverlayStyle: Platform.isIOS ? SystemUiOverlayStyle.dark : null),
  );
}
