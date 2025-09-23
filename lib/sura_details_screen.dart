import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/colors.dart';
import 'package:islami_app/providers/my_provider.dart';
import 'package:islami_app/providers/sura_details_provider.dart';
import 'package:islami_app/sura_model.dart';
import 'package:provider/provider.dart';

class SuraDetailsScreen extends StatelessWidget {
  static const String routeName= "SuraDetails";
  SuraDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var pro= Provider.of<myProvider>(context);
    var model= ModalRoute.of(context)?.settings.arguments as SuraModel;

    return ChangeNotifierProvider(
      create: (context) => suraDetailsProvider()..loadSuraFile(model.Index),
      builder: (context,child){
        var provider= Provider.of<suraDetailsProvider>(context);
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(
              pro.appTheme== ThemeMode.dark
                  ? "assets/images/dark_bg.png"
                  : "assets/images/default_bg.png",),
              fit: BoxFit.cover,
            ),
          ),
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: Text(
                model.name,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 36)
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                child: ListView.separated(
                  separatorBuilder: (context,index)=> Center(child: Text("(${index+1})",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: pro.appTheme==ThemeMode.light?
                        AppColors.primaryColor
                            :
                        Colors.white
                    ),
                  ),
                  ),
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          provider.verses[index],
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: pro.appTheme==ThemeMode.light?
                                AppColors.colorBlack
                                :
                                AppColors.yellowColor
                          )
                      ),
                    );
                  },
                  itemCount: provider.verses.length,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
