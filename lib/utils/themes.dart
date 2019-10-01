import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData appTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    accentColor: secondaryColor,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundWhite,
    cardColor: backgroundWhite,
    textSelectionColor: secondaryColor,
    indicatorColor: secondaryColor,
    errorColor: errorColor,
    buttonTheme: base.buttonTheme.copyWith(
      buttonColor: backgroundWhite,
      textTheme: ButtonTextTheme.primary,
    ),
    backgroundColor: backgroundWhite,
    primaryIconTheme: base.iconTheme.copyWith(color: backgroundWhite),
  );
}