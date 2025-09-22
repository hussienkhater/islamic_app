import 'package:flutter/material.dart';
import 'package:islami_app/providers/my_provider.dart';
import 'package:provider/provider.dart';

import '../colors.dart';

class LangSheet extends StatelessWidget {
  const LangSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var pro= Provider.of<myProvider>(context);
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('English',style: Theme.of(context).
                textTheme.
                bodyMedium?.
                copyWith(color: AppColors.primaryColor),
                ),
                Icon(Icons.done,size: 35,color: AppColors.primaryColor,)
              ],
            ),
            SizedBox(height: 12,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Arabic',style: Theme.of(context).textTheme.bodyMedium,),
                Icon(Icons.done,size: 35,color: AppColors.colorBlack)
              ],
            )
          ],
        ),
      ),
    );
  }
}
