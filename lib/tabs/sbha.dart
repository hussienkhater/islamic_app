import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/colors.dart';
import 'package:islami_app/providers/my_provider.dart';
import 'package:islami_app/providers/tasbeeh_provider.dart';
import 'package:provider/provider.dart';

class SebhaTap extends StatelessWidget {
  SebhaTap({super.key});

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<myProvider>(context);
    return ChangeNotifierProvider(
      create: (context)=>TasbeehProvider(),
      builder: (context,child){
        var sabeh = Provider.of<TasbeehProvider>(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10),
            GestureDetector(
              onTap: sabeh.addTasbeeh,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 75),
                    child: pro.appTheme == ThemeMode.light
                        ? Image.asset(
                      'assets/images/body_sebha_logo.png',
                      height: 234,
                    )
                        : Image.asset(
                      'assets/images/body_sebha_dark.png',
                      height: 234,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 35),
                    child: pro.appTheme == ThemeMode.light
                        ? Image.asset(
                      'assets/images/head_sebha_logo.png',
                      height: 105,
                    )
                        : Image.asset(
                      'assets/images/head_sebha_dark.png',
                      height: 105,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Center(
              child: Text(
                'عدد التسبيحات',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const SizedBox(height: 40),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: pro.appTheme == ThemeMode.light
                      ? AppColors.primaryColor
                      : AppColors.primaryColorDark,
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                ),
                height: 80,
                width: 70,
                child: Center(
                  child: Text(
                    sabeh.tasbeeh.toString(),
                    style: GoogleFonts.inter(
                      textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: pro.appTheme == ThemeMode.light
                            ? AppColors.colorBlack
                            : Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: pro.appTheme == ThemeMode.light
                      ? AppColors.primaryColor
                      : AppColors.yellowColor,
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                ),
                height: 50,
                width: 135,
                child: Center(
                  child: Text(
                    sabeh.currentZekr,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: pro.appTheme == ThemeMode.light
                          ? Colors.white
                          : AppColors.primaryColorDark,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

