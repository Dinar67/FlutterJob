// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_job/themes/colors.dart';

ThemeData dark = ThemeData(
  scaffoldBackgroundColor: deepColor,
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    backgroundColor: lightColor,
    titleTextStyle: TextStyle(
      color: Colors.white,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: lightColor,
    selectedItemColor: Colors.white,
  ),
  cardTheme: const CardTheme(
    color: lightColor2,
    shape: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      foregroundColor: const MaterialStatePropertyAll(Colors.white),
      backgroundColor: const MaterialStatePropertyAll(buttonColor),
      shape: MaterialStatePropertyAll(borderButton),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: const MaterialStatePropertyAll(buttonColor),
      foregroundColor: const MaterialStatePropertyAll(Colors.white),
      shape: MaterialStatePropertyAll(borderButton),
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: buttonColor,
  ),
);

RoundedRectangleBorder borderButton = const RoundedRectangleBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(10),
  ),
  side: BorderSide(color: Colors.white),
);
