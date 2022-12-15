import 'package:flutter/material.dart';
import 'package:islami_app/sura_detailes.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../providers/appLanguageProvider.dart';

class QuranTab extends StatelessWidget {
  List<String> namesOfAyat = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Center(
      child: Column(
        children: [
          Image(image: AssetImage("assets/images/book_image_light.png")),
          Divider(
            color: Color(0xFFB7935F),
            thickness: 3,
          ),
          Container(
            child: Text(
              AppLocalizations.of(context)!.suraName,
              style: provider.apptheme == ThemeMode.light
                  ? TextStyle(fontSize: 25, fontWeight: FontWeight.w600)
                  : TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
            ),
          ),
          Divider(
            color: Color(0xFFB7935F),
            thickness: 3,
          ),
          Expanded(
            child: provider.apptheme == ThemeMode.light
                ? ListView.separated(
                    itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, SuraDetailes.routeName,
                                arguments: {
                                  "suraName": namesOfAyat[index],
                                  "index": index
                                });
                          },
                          child: Container(
                            child: Text(
                              namesOfAyat[index],
                              style: Theme.of(context).textTheme.headline3,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                    separatorBuilder: (context, index) => Divider(
                          thickness: 1,
                          color: Color(0xFFB7935F),
                        ),
                    itemCount: namesOfAyat.length)
                : ListView.separated(
                    itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, SuraDetailes.routeName,
                                arguments: {
                                  "suraName": namesOfAyat[index],
                                  "index": index
                                });
                          },
                          child: Container(
                            child: Text(
                              namesOfAyat[index],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                    separatorBuilder: (context, index) => Divider(
                          thickness: 1,
                          color: Color(0xFFB7935F),
                        ),
                    itemCount: namesOfAyat.length),
          )
        ],
      ),
    );
  }
}
