import 'package:flutter/material.dart';
import 'package:islami_app/tabs_screens/hadeth_tab.dart';
import 'package:islami_app/tabs_screens/quran_tab.dart';
import 'package:islami_app/tabs_screens/radio_tab.dart';
import 'package:islami_app/tabs_screens/sebha_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/tabs_screens/setting_tab.dart';
import 'package:provider/provider.dart';

import '../providers/appLanguageProvider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Stack(
      children: [
        Image(
          image: provider.apptheme == ThemeMode.light
              ? AssetImage("assets/images/main_background.png")
              : AssetImage("assets/images/dark_main_background.png"),
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
            backgroundColor: Colors.transparent,
            appBar: provider.apptheme == ThemeMode.light
                ? AppBar(
                    title: Text(
                      AppLocalizations.of(context)!.islami,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    centerTitle: true,
                  )
                : AppBar(
                    title: Text(
                      AppLocalizations.of(context)!.islami,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                    centerTitle: true,
                  ),
            bottomNavigationBar: provider.apptheme == ThemeMode.light
                ? Theme(
                    data: Theme.of(context)
                        .copyWith(canvasColor: Color(0xFFB7935F)),
                    child: BottomNavigationBar(
                      currentIndex: selectedItem,
                      onTap: (index) {
                        selectedItem = index;
                        setState(() {});
                      },
                      items: [
                        BottomNavigationBarItem(
                            icon: ImageIcon(
                              AssetImage("assets/images/ic_quran.png"),
                            ),
                            label: AppLocalizations.of(context)!.quran),
                        BottomNavigationBarItem(
                            icon: ImageIcon(
                              AssetImage("assets/images/ic_sebha.png"),
                            ),
                            label: AppLocalizations.of(context)!.sebha),
                        BottomNavigationBarItem(
                            icon: ImageIcon(
                              AssetImage("assets/images/ic_hadeth.png"),
                            ),
                            label: AppLocalizations.of(context)!.hadeth),
                        BottomNavigationBarItem(
                            icon: ImageIcon(
                              AssetImage("assets/images/ic_radio.png"),
                            ),
                            label: AppLocalizations.of(context)!.radio),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.settings), label: "Settings")
                      ],
                    ),
                  )
                : Theme(
                    data: Theme.of(context)
                        .copyWith(canvasColor: Color(0xFF0F1424)),
                    child: BottomNavigationBar(
                      currentIndex: selectedItem,
                      onTap: (index) {
                        selectedItem = index;
                        setState(() {});
                      },
                      items: [
                        BottomNavigationBarItem(
                            icon: ImageIcon(
                              AssetImage("assets/images/ic_quran.png"),
                            ),
                            label: AppLocalizations.of(context)!.quran),
                        BottomNavigationBarItem(
                            icon: ImageIcon(
                              AssetImage("assets/images/ic_sebha.png"),
                            ),
                            label: AppLocalizations.of(context)!.sebha),
                        BottomNavigationBarItem(
                            icon: ImageIcon(
                              AssetImage("assets/images/ic_hadeth.png"),
                            ),
                            label: AppLocalizations.of(context)!.hadeth),
                        BottomNavigationBarItem(
                            icon: ImageIcon(
                              AssetImage("assets/images/ic_radio.png"),
                            ),
                            label: AppLocalizations.of(context)!.radio),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.settings), label: "Settings")
                      ],
                    ),
                  ),
            body: tabsScreens[selectedItem])
      ],
    );
  }

  List<Widget> tabsScreens = [
    QuranTab(),
    SebhaTab(),
    HadethTab(),
    RadioTab(),
    SettingTab()
  ];
}
