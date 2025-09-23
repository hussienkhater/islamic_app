import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/hadeeth_details.dart';
import 'package:islami_app/my_theme_data.dart';
import 'package:islami_app/providers/my_provider.dart';
import 'package:islami_app/sura_details_screen.dart';
import 'package:provider/provider.dart';

import 'home.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context)=> myProvider(),
      ),
    ],
      child: EasyLocalization(
        supportedLocales: [
          Locale('en'),
          Locale('ar')
        ],
        path: 'assets/translations',
        saveLocale: true,
        startLocale: Locale('en'),
          child: MyApp(),
      ),
  ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var pro= Provider.of<myProvider>(context);
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
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
