import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/colors.dart';
import 'package:islami_app/sura_model.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName= "SuraDetails";
  SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses= [];

  @override
  Widget build(BuildContext context) {
    var model= ModalRoute.of(context)?.settings.arguments as SuraModel;
    if(verses.isEmpty){
      loadSuraFile(model.Index);
    }
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/default_bg.png",),fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
              model.name,
            style: GoogleFonts.elMessiri(
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
                  ),
            child: ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (context,index)=> Divider(thickness: 5,color: AppColors.primaryColor,),
              itemBuilder: (context,index){
               return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    verses[index],
                    textAlign: TextAlign.center,
                    style: GoogleFonts.elMessiri(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                );
              },
              itemCount: verses.length,
            ),
          ),
        ),
      ),
    );
  }

  loadSuraFile(int index)async{
    String sura= await rootBundle.loadString("assets/file/${index+1}.txt");
    List<String> suraLines= sura.split("/n");
    verses=suraLines;
    setState(() {

    });
  }
}
