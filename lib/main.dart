import 'package:flutter/material.dart';
import 'package:islami_app/hadeth_detailes.dart';
import 'package:islami_app/providers/appLanguageProvider.dart';
import 'package:islami_app/sura_detailes.dart';
import 'package:islami_app/tabs_screens/home_screen.dart';
import 'package:islami_app/theme_data.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppConfigProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  late AppConfigProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    getPrefs();
    return MaterialApp(
      theme: MyTheme.lighttheme,
      darkTheme: MyTheme.nighttheme,
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetailes.routeName: (context) => SuraDetailes(),
        HadethDetailes.routeName: (context) => HadethDetailes(),
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.appLanguage),
      themeMode: provider.apptheme,
    );
  }

  void getPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var saveLanguage = prefs.getString("language");
    provider.changeLanguage(saveLanguage!);
  }
}
