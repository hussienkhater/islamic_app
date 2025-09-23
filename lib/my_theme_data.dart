import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/colors.dart';

class MyThemeData{
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.primaryColor,
        onPrimary: AppColors.colorBlack,
        secondary: AppColors.primaryColor,
        onSecondary: AppColors.primaryColor,
        error: AppColors.primaryColor,
        onError: AppColors.primaryColor,
        surface: AppColors.primaryColor,
        onSurface: AppColors.primaryColor,
    ),
    cardTheme: CardTheme(
      color: Colors.white,
    ),
      dividerTheme: DividerThemeData(
        thickness: 3,
      ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showUnselectedLabels: false,
      showSelectedLabels: false,
      backgroundColor: Color(0xffB7935f),
      type: BottomNavigationBarType.shifting,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.white,
    ),
  scaffoldBackgroundColor: Colors.transparent,
  appBarTheme: AppBarTheme(
  color: Colors.transparent,
  titleTextStyle: GoogleFonts.elMessiri(
  fontSize: 25,
  fontWeight: FontWeight.bold,
  color: Color(0xFF242424),
  ),
  ),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.elMessiri(
        color: Colors.black,
        fontSize: 25,
        fontWeight: FontWeight.bold,),
      bodyMedium: GoogleFonts.elMessiri(
        color: Colors.black,
        fontSize: 25,
        fontWeight: FontWeight.w500,),
      bodySmall: GoogleFonts.elMessiri(
        color: Colors.black,
        fontSize: 25,
        fontWeight: FontWeight.normal,),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primaryColorDark,
      onPrimary: AppColors.yellowColor,
      secondary: AppColors.primaryColorDark,
      onSecondary: AppColors.primaryColorDark,
      error: AppColors.primaryColorDark,
      onError: AppColors.primaryColorDark,
      surface: AppColors.primaryColorDark,
      onSurface: AppColors.primaryColorDark,
    ),
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(size: 50, color: AppColors.yellowColor),
      centerTitle: true,
      titleTextStyle: GoogleFonts.elMessiri(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      )
    ),
    dividerTheme: DividerThemeData(color: AppColors.primaryColor,thickness: 3),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showUnselectedLabels: false,
      showSelectedLabels: false,
      backgroundColor: AppColors.primaryColorDark,
      selectedItemColor: AppColors.yellowColor,
      unselectedItemColor: Colors.white,
    ),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.elMessiri(
        color: Colors.white,
        fontSize: 25,
        fontWeight: FontWeight.bold,),
      bodyMedium: GoogleFonts.elMessiri(
        color: Colors.white,
        fontSize: 25,
        fontWeight: FontWeight.w500,),
      bodySmall: GoogleFonts.elMessiri(
        color: AppColors.yellowColor,
        fontSize: 25,
        fontWeight: FontWeight.normal,),
    ),
  );
}