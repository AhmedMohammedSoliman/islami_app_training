import 'package:flutter/material.dart';
import 'package:islami_app/providers/appLanguageProvider.dart';
import 'package:islami_app/tabs_screens/languageBottomSheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/tabs_screens/themingBottomSheet.dart';
import 'package:provider/provider.dart';

class SettingTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: provider.apptheme == ThemeMode.light
                ? Theme.of(context).textTheme.headline3
                : TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              showLanguageBottomSheet(context);
            },
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  border: Border(),
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.brown[200]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.appLanguage == "en"
                        ? AppLocalizations.of(context)!.english
                        : AppLocalizations.of(context)!.arabic,
                    style: provider.apptheme == ThemeMode.light
                        ? Theme.of(context).textTheme.headline3
                        : TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.arrow_drop_down_outlined,
                    size: 30,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            AppLocalizations.of(context)!.theming,
            style: provider.apptheme == ThemeMode.light
                ? Theme.of(context).textTheme.headline3
                : TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              showThemingBottomSheet(context);
            },
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  border: Border(),
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.brown[200]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.apptheme == ThemeMode.light
                        ? AppLocalizations.of(context)!.light
                        : AppLocalizations.of(context)!.dark,
                    style: provider.apptheme == ThemeMode.light
                        ? Theme.of(context).textTheme.headline3
                        : TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.arrow_drop_down_outlined,
                    size: 30,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context, builder: (context) => LanguageBottomSheet());
  }

  void showThemingBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context, builder: (context) => ThemingBottomSheet());
  }
}
