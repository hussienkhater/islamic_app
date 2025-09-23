import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/providers/my_provider.dart';
import 'package:provider/provider.dart';

import '../colors.dart';

class LangSheet extends StatelessWidget {
  const LangSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var pro= Provider.of<myProvider>(context);
    Locale currentLocal = context.locale;
    return Container(
      decoration: BoxDecoration(
          color: pro.appTheme==ThemeMode.light?
      Colors.white
          :
          AppColors.primaryColorDark,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(12),
            topLeft: Radius.circular(12),
        )
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: (){
                context.setLocale(Locale("en"));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("english".tr(),
                    style: Theme.of(context).
                    textTheme.
                    bodyMedium?.
                    copyWith(
                        color:
                        pro.appTheme==ThemeMode.dark?
                        currentLocal==Locale("en")?
                        AppColors.yellowColor
                            :
                        Colors.white
                            :
                        currentLocal==Locale("en")?
                        AppColors.primaryColor
                            :
                        AppColors.colorBlack),
                  ),
                  currentLocal==Locale("en")?
                  Icon(Icons.done,size: 35,
                    color: pro.appTheme==ThemeMode.light?
                        AppColors.primaryColor
                        :
                        AppColors.yellowColor
                  )
                      :
                      SizedBox(),
                ],
              ),
            ),
            SizedBox(height: 12,),
            InkWell(
              onTap: (){
                context.setLocale(Locale("ar"));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("arabic".tr(),
                    style: Theme.of(context).
                    textTheme.bodyMedium?.copyWith(
                        color: pro.appTheme==ThemeMode.dark?
                        currentLocal!=Locale("en")?
                        AppColors.yellowColor
                            :
                        Colors.white
                            :
                        currentLocal!=Locale("en")?
                        AppColors.primaryColor
                            :
                        AppColors.colorBlack),),
                  currentLocal!=Locale("en")?
                  Icon(Icons.done,size: 35,
                      color: pro.appTheme==ThemeMode.light?
                      AppColors.primaryColor
                          :
                      AppColors.yellowColor
                  )
                      :
                  SizedBox(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
