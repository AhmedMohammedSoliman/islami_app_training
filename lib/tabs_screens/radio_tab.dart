import 'package:flutter/material.dart';
import 'package:islami_app/providers/appLanguageProvider.dart';
import 'package:provider/provider.dart';

class RadioTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Column(
      children: [
        Spacer(
          flex: 2,
        ),
        Image(image: AssetImage("assets/images/radio_image.png")),
        Spacer(
          flex: 1,
        ),
        Container(
          child: Text(
            "أذاعه القرأن الكريم",
            style: provider.apptheme == ThemeMode.light
                ? TextStyle(fontWeight: FontWeight.w500, fontSize: 25)
                : TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                    color: Colors.white),
          ),
        ),
        Spacer(
          flex: 1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
                onPressed: () {},
                child: provider.apptheme == ThemeMode.light
                    ? Icon(
                        Icons.skip_previous,
                        color: Color(0xFFB7935F),
                        size: 40,
                      )
                    : Icon(
                        Icons.skip_previous,
                        color: Color(0xFFFACC1D),
                        size: 40,
                      )),
            TextButton(
                onPressed: () {},
                child: provider.apptheme == ThemeMode.light
                    ? Icon(
                        Icons.play_arrow,
                        color: Color(0xFFB7935F),
                        size: 60,
                      )
                    : Icon(
                        Icons.play_arrow,
                        color: Color(0xFFFACC1D),
                        size: 60,
                      )),
            TextButton(
                onPressed: () {},
                child: provider.apptheme == ThemeMode.light
                    ? Icon(
                        Icons.skip_next,
                        color: Color(0xFFB7935F),
                        size: 40,
                      )
                    : Icon(
                        Icons.skip_next,
                        color: Color(0xFFFACC1D),
                        size: 40,
                      )),
          ],
        ),
        Spacer(
          flex: 2,
        )
      ],
    );
  }
}
