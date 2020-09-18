import 'package:flutter/material.dart';

class OffsetNotifier extends ChangeNotifier{
  double _page = 0;

  double get page => _page;

  OffsetNotifier(PageController pageController){
    pageController.addListener(() {
      _page = pageController.page;
      notifyListeners();
    });
  }
}