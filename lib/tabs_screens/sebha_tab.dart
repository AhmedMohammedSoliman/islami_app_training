import 'package:flutter/material.dart';

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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          AnimatedRotation(
              turns: turnes,
              duration: Duration(seconds: 1),
              child: Image(image: AssetImage("assets/images/sebha_image.png"))),
          Container(
            child: Text(
              "Number of tasbehat",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(),
              borderRadius: BorderRadius.circular(30),
              color: Color(0xFFB7935F),
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
                    primary: Color(0xFFB7935F),
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
