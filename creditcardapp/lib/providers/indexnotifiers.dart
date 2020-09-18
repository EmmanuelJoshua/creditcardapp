import 'package:flutter/material.dart';

class IndexNotifier extends ChangeNotifier{
  int _index = 0;
  int _cardIndex = 0;

  int get index => _index;
  int get cardIndex => _cardIndex;

  set index(int newIndex){
    _index = newIndex;
    notifyListeners();
  }

  set cardIndex(int newIndex){
    _cardIndex = newIndex;
    notifyListeners();
  }
}