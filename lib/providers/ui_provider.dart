import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier {
  int _selectedmenuOpt = 0;

  int get selectedmenuOpt {
    return this._selectedmenuOpt;
  }

  set selectedmenuOpt(int i) {
    this._selectedmenuOpt = i;
    notifyListeners();
  }
}
