import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/colors.dart';
import 'package:islami_app/tabs/ahadeeth.dart';
import 'package:islami_app/tabs/quraan.dart';
import 'package:islami_app/tabs/radio.dart';
import 'package:islami_app/tabs/sbha.dart';
import 'package:islami_app/tabs/setting.dart';

import 'colors.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  static const routeName= "Home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            Theme.of(context).brightness == Brightness.dark
                ? "assets/images/dark_bg.png"
                : "assets/images/default_bg.png",
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: Text(
                "إسلامي",
              style: GoogleFonts.elMessiri(
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index){
              selectedIndex=index;
              setState(() {

              });
            },
            currentIndex: selectedIndex,
              items:[
                BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  icon: ImageIcon(AssetImage("assets/images/icon_quran.png")),
                  label: "Quraan",
                ),
                BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  icon: ImageIcon(AssetImage("assets/images/icon_sebha.png")),
                  label: "Sebha",
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/icon_hadeth.png")),
                  label: "Ahadeeth",
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/images/icon_radio.png")),
                  label: "Radio",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: "Settings",
                ),
              ]
          ),
          body: tabs[selectedIndex],
        ),
      ],
    );
  }
  List<Widget> tabs=[
    QuraanTap(),
    SebhaTap(),
    AhadeethTap(),
    RadioTap(),
    SettingTap(),
  ];
}
