import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData mainTheme() => ThemeData(
      primaryColor: orange,
      scaffoldBackgroundColor: scaffoldColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: const AppBarTheme(
        backgroundColor: white,
        foregroundColor: black,
        elevation: 1,
      ),
      textTheme: const TextTheme(
        headline1: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 18,
          height: 1.5,
          color: black,
          fontWeight: FontWeight.w600,
        ),
        bodyText1: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 16,
          height: 1,
          color: black,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
