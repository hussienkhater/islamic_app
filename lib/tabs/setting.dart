import 'package:flutter/material.dart';
import 'package:islami_app/bottom_sheet/lang_sheet.dart';
import 'package:islami_app/colors.dart';
import 'package:islami_app/providers/my_provider.dart';
import 'package:provider/provider.dart';
import '../bottom_sheet/theme_sheet.dart';

class SettingTap extends StatelessWidget {
  const SettingTap({super.key});

  @override
  Widget build(BuildContext context) {
    var pro= Provider.of<myProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Theme',
          style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: pro.appTheme==ThemeMode.dark?
              AppColors.yellowColor
                  :
              AppColors.colorBlack),
            ),
            child: InkWell(
              onTap: (){
                showModalBottomSheet(
                    //isDismissible: false,
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return ThemeSheet();
                    }
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(pro.appTheme==ThemeMode.light?'Light':'Dark',
                style: Theme.of(context).textTheme.
                bodyMedium?.
                copyWith(color:
                    pro.appTheme==ThemeMode.dark?
                    AppColors.yellowColor
                        :
                    AppColors.colorBlack
                ),
                ),

              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text('Language',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: pro.appTheme==ThemeMode.dark?
              AppColors.yellowColor
                  :
              AppColors.colorBlack),
            ),
            child: InkWell(
              onTap: (){
                showModalBottomSheet(
                    //isDismissible: false,
                    isScrollControlled: true,
                    context: context,
                  builder: (context) {
                    return LangSheet();
                  }
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text('English',
                  style: Theme.of(context).
                  textTheme.
                  bodyMedium?.
                  copyWith(color:
                      pro.appTheme==ThemeMode.dark?
                      AppColors.yellowColor
                      :
                  AppColors.colorBlack)
                ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
