import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lighttheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black)),
      textTheme: TextTheme(
          headline1: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
          headline3: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.black, unselectedItemColor: Colors.white));

  static ThemeData nighttheme = ThemeData();
}
