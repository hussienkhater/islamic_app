import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/hadeeth_details.dart';
import 'package:islami_app/my_theme_data.dart';
import 'package:islami_app/sura_details_screen.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
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
