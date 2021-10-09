import 'package:flutter/material.dart';

class NavNotify extends ChangeNotifier {
  int? index = 0;

  void change(itemIndex) {
    index = itemIndex;
    notifyListeners();
  }
}

class NoteView extends ChangeNotifier {
  bool? isGrid = false;
  void changeState(bool Grid) {
    isGrid = Grid;
    notifyListeners();
  }
}
