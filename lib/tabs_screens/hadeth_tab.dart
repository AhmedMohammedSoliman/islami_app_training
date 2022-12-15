import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/hadeth_detailes.dart';
import 'package:islami_app/providers/appLanguageProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<HadethData> listHadethItem = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    if (listHadethItem.isEmpty) {
      loadFile();
    }
    return Center(
      child: Column(
        children: [
          Image(image: AssetImage("assets/images/hadeth_logo.png")),
          Divider(
            thickness: 3,
            color: Color(0xFFB7935F),
          ),
          Container(
              child: Text(
            AppLocalizations.of(context)!.elAhadeth,
            style: provider.apptheme == ThemeMode.light
                ? TextStyle(fontSize: 25, fontWeight: FontWeight.w600)
                : TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
          )),
          Divider(
            thickness: 3,
            color: Color(0xFFB7935F),
          ),
          listHadethItem.length == 0
              ? CircularProgressIndicator()
              : Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return Container(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, HadethDetailes.routeName,
                                  arguments: {
                                    "HadethNumber": listHadethItem[index].title,
                                    "hadethcontent":
                                        listHadethItem[index].hadethContent
                                  });
                            },
                            child: Text(
                              listHadethItem[index].title,
                              style: provider.apptheme == ThemeMode.light
                                  ? Theme.of(context).textTheme.headline3
                                  : TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => Divider(
                            thickness: 1,
                            color: Color(0xFFB7935F),
                          ),
                      itemCount: listHadethItem.length),
                )
        ],
      ),
    );
  }

  void loadFile() async {
    String allFileContent =
        await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> allAhadeth = allFileContent.split("#\r\n");
    for (int i = 0; i < allAhadeth.length; i++) {
      List<String> hadethContent = allAhadeth[i].split("\n");
      String title = hadethContent[0];
      hadethContent.removeAt(0);
      HadethData hadethdata =
          HadethData(title: title, hadethContent: hadethContent);
      listHadethItem.add(hadethdata);
      setState(() {});
    }
  }
}

class HadethData {
  String title;

  List<String> hadethContent;

  HadethData({required this.title, required this.hadethContent});
}
