import 'package:flutter/material.dart';
import 'package:islami_app/colors.dart';
import 'package:islami_app/providers/my_provider.dart';
import 'package:provider/provider.dart';

class RadioTap extends StatelessWidget {
  const RadioTap({super.key});

  @override
  Widget build(BuildContext context) {
    var pro= Provider.of<myProvider>(context);
    return Column(
      children: [
        SizedBox(
          height: 150,
        ),
        Image.asset('assets/images/radio_image.png'),
        SizedBox(
          height: 50,
        ),
        Text('إذاعة القرءان الكريم',
          style: Theme.of(context).
          textTheme.bodyMedium?.
          copyWith(
            color: pro.appTheme==ThemeMode.light?
                AppColors.colorBlack
                :
                Colors.white
          )
          ,
        ),
        SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.skip_previous,size: 30,
                color: pro.appTheme==ThemeMode.light?
                    AppColors.primaryColor
                        :
                    AppColors.yellowColor),
            SizedBox(
              width: 40,
            ),
            Icon(Icons.pause,size: 50,color: pro.appTheme==ThemeMode.light?
                    AppColors.primaryColor
                        :
                    AppColors.yellowColor),
            SizedBox(
              width: 40,
            ),
            Icon(Icons.skip_next,size: 30,
                color: pro.appTheme==ThemeMode.light?
                    AppColors.primaryColor
                        :
                    AppColors.yellowColor),
          ],
        )
      ],
    );
  }
}
