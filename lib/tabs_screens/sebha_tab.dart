import 'package:flutter/material.dart';
import 'package:islami_app/providers/appLanguageProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int countText = 0;

  String tasbehText = "Subhan Allah";

  int index = 0;

  double turnes = 0;

  List<String> tasbehTexts = [
    "Subhan Allah",
    "Alham lellah",
    "Allah Akbar",
    "Alhamd lellah",
    "la Ellah Ella Allah"
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          AnimatedRotation(
              turns: turnes,
              duration: Duration(seconds: 1),
              child: Image(
                  image: provider.apptheme == ThemeMode.light
                      ? AssetImage("assets/images/sebha_image.png")
                      : AssetImage("assets/images/sebha_image.png"))),
          Container(
            child: Text(
              AppLocalizations.of(context)!.number_of_tasbehat,
              style: provider.apptheme == ThemeMode.light
                  ? TextStyle(fontSize: 25, fontWeight: FontWeight.w400)
                  : TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
            ),
          ),
          Container(
            decoration: provider.apptheme == ThemeMode.light
                ? BoxDecoration(
                    border: Border(),
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0xFFB7935F),
                  )
                : BoxDecoration(
                    border: Border(),
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0xFF141A1E),
                  ),
            alignment: Alignment.center,
            height: 90,
            width: 70,
            child: Text("$countText",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
          ),
          Container(
            width: 200,
            height: 50,
            child: ElevatedButton(
                onPressed: () {
                  tasbehCount();
                  turnes += 1 / 33;
                  setState(() {});
                },
                child: Text(
                  "$tasbehText",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                    primary: provider.apptheme == ThemeMode.light
                        ? Color(0xFFB7935F)
                        : Color(0xFFFACC1D),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)))),
          )
        ],
      ),
    );
  }

  void tasbehCount() {
    if (countText < 33) {
      countText++;
      tasbehText = tasbehTexts[0];
      setState(() {});
    }
    if (countText >= 33 && countText < 66) {
      countText++;
      tasbehText = tasbehTexts[1];
      setState(() {});
    }
    if (countText >= 66 && countText < 99) {
      countText++;
      tasbehText = tasbehTexts[2];
      setState(() {});
    }
    if (countText >= 99 && countText < 132) {
      countText++;
      tasbehText = tasbehTexts[3];
      setState(() {});
    }
    if (countText >= 132 && countText < 165) {
      countText++;
      tasbehText = tasbehTexts[4];
      setState(() {});
    }
    if (countText >= 165) {
      countText = 0;
      tasbehText = tasbehTexts[0];
      setState(() {});
    }
  }
}
