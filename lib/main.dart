import 'package:flutter/material.dart';
import 'package:islami_app/hadeeth_details.dart';
import 'package:islami_app/my_theme_data.dart';
import 'package:islami_app/providers/my_provider.dart';
import 'package:islami_app/providers/sura_details_provider.dart';
import 'package:islami_app/sura_details_screen.dart';
import 'package:provider/provider.dart';

import 'home.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context)=> myProvider(),
      ),
    ],
      child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var pro= Provider.of<myProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: pro.appTheme,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      initialRoute: "Home",
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
        HadeethDetailsScreen.routeName: (context) => HadeethDetailsScreen(),
      },
    );
  }
}
