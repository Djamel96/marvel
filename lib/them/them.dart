import 'package:flutter/material.dart';

import 'colors.dart';

final lightTheme = ThemeData(
  // Define the default Brightness and Colors
  brightness: Brightness.light,
  primaryColor: AppColors.appMain100,
  fontFamily: 'DMSans',
  backgroundColor: Colors.white,
  //scaffoldBackgroundColor: AppColors.scafold,
  appBarTheme: AppBarTheme(
    color: Colors.white,
    iconTheme: IconThemeData(
      color: Colors.grey.shade800,
    ),
  ),

  textTheme: TextTheme(
    bodyText2: const TextStyle(
      color: AppColors.defaultTextColor,
      fontFamily: 'DMSans',
    ),
    bodyText1: const TextStyle(
      color: AppColors.defaultTextColor,
      fontFamily: 'DMSans',
    ),
    headline3: const TextStyle(
      color: AppColors.appMain100,
      fontFamily: 'DMSans',
    ),
    headline4: const TextStyle(
      color: AppColors.appMain100,
      fontFamily: 'DMSans',
    ),
    headline5: const TextStyle(
      fontSize: 72.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'DMSans',
    ),
    headline6: TextStyle(
      color: Colors.grey.shade800,
      fontWeight: FontWeight.w600,
      fontFamily: 'DMSans',
    ),
    button: const TextStyle(
      fontSize: 20.5,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      color: Colors.white,
      fontFamily: 'DMSans',
    ),
  ),
  colorScheme:
      ColorScheme.fromSwatch().copyWith(secondary: AppColors.appMain100),
  textSelectionTheme:
      const TextSelectionThemeData(cursorColor: AppColors.appMain100),
);
