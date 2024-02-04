import 'package:flutter/material.dart';
import 'package:practice_hive4/pages/apiPage.dart';
import 'package:practice_hive4/pages/hivePage.dart';

class AllProvider extends ChangeNotifier {
  List<Widget> list = [HivePage(), const ApiPage()];

  int _currIndex = 0;
  int get currIndex => _currIndex;

  void changeIndex(int val) {
    _currIndex = val;
    notifyListeners(); 
  }
}
