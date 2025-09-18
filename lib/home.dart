import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/tabs/ahadeeth.dart';
import 'package:islami_app/tabs/quraan.dart';
import 'package:islami_app/tabs/radio.dart';
import 'package:islami_app/tabs/sbha.dart';
import 'package:islami_app/tabs/setting.dart';

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
            "assets/images/default_bg.png",
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
            showUnselectedLabels: false,
              showSelectedLabels: false,
              backgroundColor: Color(0xffB7935f),
              type: BottomNavigationBarType.shifting,
              iconSize: 30,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.white,
              items:[
                BottomNavigationBarItem(
                  backgroundColor: Color(0xffB7935f),
                  icon: ImageIcon(AssetImage("assets/images/radio_image.png")),
                  label: "Radio",
                ),
                BottomNavigationBarItem(
                  backgroundColor: Color(0xffB7935f),
                  icon: ImageIcon(AssetImage("assets/images/icon_sebha.png")),
                  label: "Sebha",
                ),
                BottomNavigationBarItem(
                  backgroundColor: Color(0xffB7935f),
                  icon: ImageIcon(AssetImage("assets/images/icon_hadeth.png")),
                  label: "Ahadeeth",
                ),
                BottomNavigationBarItem(
                  backgroundColor: Color(0xffB7935f),
                  icon: ImageIcon(AssetImage("assets/images/icon_quran.png")),
                  label: "Quraan",
                ),
                BottomNavigationBarItem(
                  backgroundColor: Color(0xffB7935f),
                  icon: Icon(Icons.settings,size: 30,),
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
    RadioTap(),
    SebhaTap(),
    AhadeethTap(),
    QuraanTap(),
    SettingTap(),
  ];
}
