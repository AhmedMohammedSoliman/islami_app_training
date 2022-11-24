import 'package:flutter/material.dart';
import 'package:islami_app/sura_detailes.dart';
import 'package:islami_app/tabs_screens/home_screen.dart';
import 'package:islami_app/theme_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyTheme.lighttheme,
      darkTheme: MyTheme.nighttheme,
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetailes.routeName: (context) => SuraDetailes(),
      },
    );
  }
}
