import 'package:flutter/cupertino.dart';
import 'package:islamic_app/core/services/shared_prefs.dart';

import 'package:shared_preferences/shared_preferences.dart';

class MostRecentProvider extends ChangeNotifier{
  List<int> mostRecentlyList = [];


  void readLastSuraList()async {


    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> mostRecentlyListAsString =prefs.getStringList(SharedPrefsKeys.mostRecentlyKey)??[];



    mostRecentlyList = mostRecentlyListAsString.map((i) => int.parse(i)).toList();

    notifyListeners();
  }
}