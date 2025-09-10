import 'package:flutter/material.dart';
import 'package:smart_guy/utils/shared_preferences.dart';

import '../constants/consts.dart';
import '../views/chat.dart';

class OurProviderClass extends ChangeNotifier {
  int currentIndex=0;
  // bool isDarkMode = AppSharedPreferences.getIsDarkMode()??false;
  bool isDarkMode = false;

  bool get getDarkMode {
    return isDarkMode;
  }
  int get getCurrentIndex{
    return currentIndex;
  }

  void changeCurrentIndex(int index){
    if (currentIndex == 1 && index != 1) {

      (chatScreenKey.currentState as ChatScreenState?)?.resetChat();
    }
    currentIndex= index;
    notifyListeners();
}

  void changeAppThemeMode(bool mode) {
    isDarkMode = mode;
    notifyListeners();
  }

  void onlyChangeNotifier() {
    notifyListeners();
  }
}
