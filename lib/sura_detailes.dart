import 'package:flutter/material.dart';

class SuraDetailes extends StatelessWidget {
  static const String routeName = "Sura_detailes";

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Map;
    return Stack(
      children: [
        Image(
          image: AssetImage("assets/images/main_background.png"),
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
            appBar: AppBar(
              title: Text(
                "Islami",
                style: Theme.of(context).textTheme.headline1,
              ),
              centerTitle: true,
            ),
            body: Center(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                width: 300,
                height: 500,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${args["suraName"]}",
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.play_circle,
                          size: 20,
                        )
                      ],
                    ),
                    Divider(
                      thickness: 2,
                      color: Color(0xFFB7935F),
                      endIndent: 50,
                      indent: 50,
                    )
                  ],
                ),
              ),
            )),
      ],
    );
  }
}
