import 'package:flutter/material.dart';
import 'package:islami_app/tabs_screens/hadeth_tab.dart';
import 'package:islami_app/tabs_screens/quran_tab.dart';
import 'package:islami_app/tabs_screens/radio_tab.dart';
import 'package:islami_app/tabs_screens/sebha_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(
          image: AssetImage("assets/images/main_background.png"),
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text(
                "Islami",
                style: Theme.of(context).textTheme.headline1,
              ),
              centerTitle: true,
            ),
            bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(canvasColor: Color(0xFFB7935F)),
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
                      label: "Quran"),
                  BottomNavigationBarItem(
                      icon: ImageIcon(
                        AssetImage("assets/images/ic_sebha.png"),
                      ),
                      label: "Sebha"),
                  BottomNavigationBarItem(
                      icon: ImageIcon(
                        AssetImage("assets/images/ic_hadeth.png"),
                      ),
                      label: "Hadeth"),
                  BottomNavigationBarItem(
                      icon: ImageIcon(
                        AssetImage("assets/images/ic_radio.png"),
                      ),
                      label: "Radio")
                ],
              ),
            ),
            body: tabsScreens[selectedItem])
      ],
    );
  }

  List<Widget> tabsScreens = [QuranTab(), SebhaTab(), HadethTab(), RadioTab()];
}
