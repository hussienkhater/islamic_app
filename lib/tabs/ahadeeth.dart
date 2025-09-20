import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/hadeeth_details.dart';
import 'package:islami_app/hadeeth_model.dart';

import '../colors.dart';

class AhadeethTap extends StatefulWidget {
  AhadeethTap({super.key});

  @override
  State<AhadeethTap> createState() => _AhadeethTapState();
}
List<HadeethModel> allAhadeeth =[];

class _AhadeethTapState extends State<AhadeethTap> {

  @override
  Widget build(BuildContext context) {
    if(allAhadeeth.isEmpty){
      loadHadeethFile();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset("assets/images/hadeth_logo.png",
        height: 217,),
        Divider(),
        Center(
          child: Text("أحاديث",
            style: GoogleFonts.elMessiri(
                fontSize: 25,
                fontWeight: FontWeight.w600
            ),
          ),
        ),
        Divider(),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context,index)=>Divider(thickness: 3,),
            itemBuilder: (context,index){
            return InkWell(
              onTap: (){
                Navigator.pushNamed(context, HadeethDetailsScreen.routeName,
                arguments: allAhadeeth[index]);
              },
              child: Text(allAhadeeth[index].title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.elMessiri(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,)),
            );
          },
          itemCount: allAhadeeth.length,),
        )
      ],
    );
  }

  loadHadeethFile()async{
    await rootBundle.loadString("assets/file/ahadeth.txt").then((value){
      List<String> ahadeeth = value.split("#");
      for(int i=0;i<ahadeeth.length;i++){
        String HadeethOne = ahadeeth[i];
        List<String> HadeethLine= HadeethOne.trim().split("\n");
        String title= HadeethLine[0];
        HadeethLine.removeAt(0);
        List<String> content = HadeethLine;
        HadeethModel hadeethModel=HadeethModel(title, content);
        allAhadeeth.add(hadeethModel);
        setState(() {

        });
      }
    });
  }
}
