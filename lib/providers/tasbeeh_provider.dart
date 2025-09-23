import 'package:flutter/material.dart';

class TasbeehProvider extends ChangeNotifier{
  int tasbeeh = 0;
  int zekrIndex = 0; // index بدل string

  List<String> azkar = [
    "سبحان الله",
    "الحمد لله",
    "الله أكبر",
    "لا اله الا الله"
  ];

  void addTasbeeh() {
    tasbeeh++;
    if (tasbeeh >= 33) {
      tasbeeh = 0;
      zekrIndex = (zekrIndex + 1) % azkar.length; // يلف على الأذكار
    }
    notifyListeners();
  }
  String get currentZekr => azkar[zekrIndex];
}