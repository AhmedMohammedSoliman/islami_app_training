import 'package:flutter/material.dart';
import 'package:islami_app/providers/appLanguageProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          GestureDetector(
              onTap: () {
                provider.changeLanguage("en");
              },
              child: provider.appLanguage == "en"
                  ? selectedShape(AppLocalizations.of(context)!.english)
                  : unSelectedShape(AppLocalizations.of(context)!.english)),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
              onTap: () {
                provider.changeLanguage("ar");
              },
              child: provider.appLanguage == "ar"
                  ? selectedShape(AppLocalizations.of(context)!.arabic)
                  : unSelectedShape(AppLocalizations.of(context)!.arabic))
        ],
      ),
    );
  }

  Widget selectedShape(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$text",
          style: TextStyle(
              color: Colors.red, fontSize: 15, fontWeight: FontWeight.bold),
        ),
        Icon(Icons.check, color: Colors.red)
      ],
    );
  }

  Widget unSelectedShape(String text) {
    return Row(
      children: [
        Text(
          "$text",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
