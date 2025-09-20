import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/hadeeth_model.dart';

class HadeethDetailsScreen extends StatelessWidget {
  const HadeethDetailsScreen({super.key});
  static const String routeName= "HadeethScreen";
  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)?.settings.arguments as HadeethModel;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(
          Theme.of(context).brightness == Brightness.dark
              ? "assets/images/dark_bg.png"
              : "assets/images/default_bg.png",),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            model.title,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            child: ListView.builder(itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(model.content[index],
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium),
              );
            },
            itemCount: model.content.length,),
          ),
        ),
      ),
    );
  }
}
