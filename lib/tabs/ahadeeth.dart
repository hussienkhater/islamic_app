import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/hadeeth_details.dart';
import 'package:islami_app/hadeeth_model.dart';
import 'package:islami_app/providers/ahadeeth_provider.dart';
import 'package:islami_app/providers/my_provider.dart';
import 'package:provider/provider.dart';

import '../colors.dart';

class AhadeethTap extends StatelessWidget {
  AhadeethTap({super.key});

  @override
  Widget build(BuildContext context) {
    var provider= Provider.of<myProvider>(context);

    return ChangeNotifierProvider(
      create: (context)=>ahadeethPro(),
      builder: (context,child){
        var pro= Provider.of<ahadeethPro>(context);
        if(pro.allAhadeeth.isEmpty){
          pro.loadHadeethFile();
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset("assets/images/hadeth_logo.png",
              height: 217,),
            Divider(
              color: provider.appTheme==ThemeMode.light?
              AppColors.primaryColor
                  :
              AppColors.yellowColor
              ,
            ),
            Center(
              child: Text("أحاديث",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            Divider(
              color: provider.appTheme==ThemeMode.light?
              AppColors.primaryColor
                  :
              AppColors.yellowColor
              ,
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context,index)=>Divider(
                  thickness: 2,
                  color: provider.appTheme==ThemeMode.light?
                  AppColors.primaryColor
                      :
                  AppColors.yellowColor
                  ,),
                itemBuilder: (context,index){
                  return InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, HadeethDetailsScreen.routeName,
                          arguments: pro.allAhadeeth[index]);
                    },
                    child: Text(pro.allAhadeeth[index].title,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodySmall),
                  );
                },
                itemCount: pro.allAhadeeth.length,),
            )
          ],
        );
      },
    );
  }
}
