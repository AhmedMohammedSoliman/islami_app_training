import 'package:flutter/material.dart';
import 'package:islami_app/providers/appLanguageProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ThemingBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              provider.changeTheme(ThemeMode.light);
            },
            child: provider.apptheme == ThemeMode.light
                ? selectedShape(AppLocalizations.of(context)!.light)
                : unSelectedShape(AppLocalizations.of(context)!.light),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              provider.changeTheme(ThemeMode.dark);
            },
            child: provider.apptheme == ThemeMode.dark
                ? selectedShape(AppLocalizations.of(context)!.dark)
                : unSelectedShape(AppLocalizations.of(context)!.dark),
          )
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
        Icon(
          Icons.check,
          color: Colors.red,
        )
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
