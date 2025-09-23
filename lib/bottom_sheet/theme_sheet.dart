import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/colors.dart';
import 'package:provider/provider.dart';

import '../providers/my_provider.dart';

class ThemeSheet extends StatelessWidget {
  const ThemeSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var pro= Provider.of<myProvider>(context);
    return Container(
      decoration: BoxDecoration(
          color: pro.appTheme==ThemeMode.light?
              Colors.white
              :
              AppColors.primaryColorDark
          ,
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
                pro.changeTheme(ThemeMode.light);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("light".tr(),
                      style: Theme.of(context).
                      textTheme.
                      bodyMedium?.
                      copyWith(color:
                          pro.appTheme==ThemeMode.light?
                          AppColors.primaryColor
                          :
                          Colors.white),
                  ),
                  pro.appTheme==ThemeMode.light?
                  Icon(Icons.done,size: 35,color: AppColors.primaryColor,)
                      :
                      SizedBox(),
                ],
              ),
            ),
            SizedBox(height: 12,),
            InkWell(
              onTap: (){
                pro.changeTheme(ThemeMode.dark);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("dark".tr(),
                    style: Theme.of(context).
                    textTheme.
                    bodyMedium?.copyWith(color:
                        pro.appTheme==ThemeMode.dark?
                        AppColors.yellowColor
                        :
                        AppColors.colorBlack)),
                  pro.appTheme==ThemeMode.dark?
                  Icon(Icons.done,size: 35,color: AppColors.yellowColor,)
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
