import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/providers/appLanguageProvider.dart';
import 'package:provider/provider.dart';

class SuraDetailes extends StatefulWidget {
  static const String routeName = "Sura_detailes";

  @override
  State<SuraDetailes> createState() => _SuraDetailesState();
}

class _SuraDetailesState extends State<SuraDetailes> {
  List<String> ayat = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as Map;

    if (ayat.isEmpty) {
      loadFile(args["index"]);
    }
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
              title: Text(
                "Islami",
                style: Theme.of(context).textTheme.headline1,
              ),
              centerTitle: true,
            ),
            body: Center(
              child: Container(
                decoration: BoxDecoration(
                    color: provider.apptheme == ThemeMode.light
                        ? Colors.white
                        : Color(0xFF0F1424),
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
                          style: provider.apptheme == ThemeMode.light
                              ? Theme.of(context).textTheme.headline3
                              : TextStyle(
                                  color: Color(0xFFFACC1D),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
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
                    ),
                    ayat.length == 0
                        ? CircularProgressIndicator()
                        : Expanded(
                            child: ListView.separated(
                                itemBuilder: (context, index) => Text(
                                      "${ayat[index]} (${index + 1})",
                                      textAlign: TextAlign.center,
                                      style:
                                          provider.apptheme == ThemeMode.light
                                              ? TextStyle(fontSize: 18)
                                              : TextStyle(
                                                  fontSize: 18,
                                                  color: Color(0xFFFACC1D)),
                                      textDirection: TextDirection.rtl,
                                    ),
                                separatorBuilder: (context, index) => Divider(
                                      thickness: 1,
                                      color: Color(0xFFB7935F),
                                    ),
                                itemCount: ayat.length),
                          )
                  ],
                ),
              ),
            )),
      ],
    );
  }

  Future<void> loadFile(int index) async {
    String content =
        await rootBundle.loadString("assets/files/${index + 1}.txt");
    List<String> lines = content.split("\n");
    ayat = lines;
    setState(() {});
  }
}
