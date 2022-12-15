import 'package:flutter/material.dart';
import 'package:islami_app/providers/appLanguageProvider.dart';
import 'package:provider/provider.dart';

class HadethDetailes extends StatelessWidget {
  static const String routeName = "Hadeth_details";

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as Map;
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
            appBar: AppBar(
              title:
                  Text("Islami", style: Theme.of(context).textTheme.headline1),
              centerTitle: true,
            ),
            body: Center(
              child: Container(
                decoration: BoxDecoration(
                  border: Border(),
                  borderRadius: BorderRadius.circular(30),
                  color: provider.apptheme == ThemeMode.light
                      ? Colors.white
                      : Color(0xFF0F1424),
                ),
                height: 500,
                width: 300,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "${args["HadethNumber"]}",
                        style: provider.apptheme == ThemeMode.light
                            ? Theme.of(context).textTheme.headline3
                            : TextStyle(
                                color: Color(0xFFFACC1D),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                      ),
                    ),
                    Divider(
                      thickness: 2,
                      color: Color(0xFFB7935F),
                      endIndent: 30,
                      indent: 30,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) => Text(
                          "${args["hadethcontent"]}",
                          style: provider.apptheme == ThemeMode.light
                              ? TextStyle(fontSize: 18)
                              : TextStyle(
                                  fontSize: 18, color: Color(0xFFFACC1D)),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ))
      ],
    );
  }
}
