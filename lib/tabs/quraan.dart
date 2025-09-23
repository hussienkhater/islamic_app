import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/colors.dart';
import 'package:islami_app/providers/my_provider.dart';
import 'package:islami_app/sura_details_screen.dart';
import 'package:islami_app/sura_model.dart';
import 'package:provider/provider.dart';

class QuraanTap extends StatelessWidget {
  QuraanTap({super.key});
  List<String> surahNames = [
    "الفاتحة", "البقرة", "آل عمران", "النساء", "المائدة", "الأنعام", "الأعراف", "الأنفال", "التوبة", "يونس",
    "هود", "يوسف", "الرعد", "إبراهيم", "الحجر", "النحل", "الإسراء", "الكهف", "مريم", "طه",
    "الأنبياء", "الحج", "المؤمنون", "النور", "الفرقان", "الشعراء", "النمل", "القصص", "العنكبوت", "الروم",
    "لقمان", "السجدة", "الأحزاب", "سبأ", "فاطر", "يس", "الصافات", "ص", "الزمر", "غافر",
    "فصلت", "الشورى", "الزخرف", "الدخان", "الجاثية", "الأحقاف", "محمد", "الفتح", "الحجرات", "ق",
    "الذاريات", "الطور", "النجم", "القمر", "الرحمن", "الواقعة", "الحديد", "المجادلة", "الحشر", "الممتحنة",
    "الصف", "الجمعة", "المنافقون", "التغابن", "الطلاق", "التحريم", "الملك", "القلم", "الحاقة", "المعارج",
    "نوح", "الجن", "المزمل", "المدثر", "القيامة", "الإنسان", "المرسلات", "النبأ", "النازعات", "عبس",
    "التكوير", "الانفطار", "المطففين", "الانشقاق", "البروج", "الطارق", "الأعلى", "الغاشية", "الفجر", "البلد",
    "الشمس", "الليل", "الضحى", "الشرح", "التين", "العلق", "القدر", "البينة", "الزلزلة", "العاديات",
    "القارعة", "التكاثر", "العصر", "الهمزة", "الفيل", "قريش", "الماعون", "الكوثر", "الكافرون", "النصر",
    "المسد", "الإخلاص", "الفلق", "الناس"
  ];

  @override
  Widget build(BuildContext context) {
    var pro= Provider.of<myProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
            "assets/images/qur2an_screen_logo.png",
          height: 227,
        ),
        Divider(
          color: pro.appTheme==ThemeMode.light?
          AppColors.primaryColor
              :
          AppColors.yellowColor
          ,
        ),
        Center(
          child: Text("sura_name".tr(),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        Divider(
          color: pro.appTheme==ThemeMode.light?
          AppColors.primaryColor
              :
          AppColors.yellowColor
          ,
        ),
        Expanded(
            child: ListView.separated(
              separatorBuilder: (context,index)=>Row(
                children: [
                  Expanded(child: Icon(Icons.star_border,color: pro.appTheme==ThemeMode.light?
                  AppColors.primaryColor
                      :
                  AppColors.yellowColor
                    ,)),
                  Expanded(
                    flex: 2,
                    child: Divider(
                      color: pro.appTheme==ThemeMode.light?
                          AppColors.primaryColor
                          :
                          AppColors.yellowColor
                      ,
                    ),
                  ),
                  Expanded(child: Icon(Icons.star_border,color: pro.appTheme==ThemeMode.light?
                  AppColors.primaryColor
                      :
                  AppColors.yellowColor
                    ,)),
                ],
              ),
                itemBuilder: (context,index){
              return InkWell(
                onTap: (){
                  Navigator.pushNamed(context, SuraDetailsScreen.routeName,
                  arguments: SuraModel(surahNames[index],index),
                  );
                },
                child: Text(
                    surahNames[index],
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              );
            },
              itemCount: surahNames.length,
            ),
        ),
      ],
    );
  }
}
