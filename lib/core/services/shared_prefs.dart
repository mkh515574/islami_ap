
import 'package:shared_preferences/shared_preferences.dart';
class SharedPrefsKeys{
  static const String mostRecentlyKey="MostRecentlyKey";
  static const String onBoardingCompleted="onBoardingCompleted";
}

void saveLastSuraIndex(int index)async{

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> mostRecentlyList =prefs.getStringList(SharedPrefsKeys.mostRecentlyKey)??[];



  if(mostRecentlyList.contains('$index')){
    mostRecentlyList.remove('$index');
    mostRecentlyList.insert(0, "$index");
  }else{
    mostRecentlyList.insert(0, "$index");
  }
  if(mostRecentlyList.length >5){
    mostRecentlyList = mostRecentlyList.sublist(0,5);
  }
  await prefs.setStringList(SharedPrefsKeys.mostRecentlyKey,mostRecentlyList );
}


Future<void> completeOnBoarding() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool(SharedPrefsKeys.onBoardingCompleted, true);
}
