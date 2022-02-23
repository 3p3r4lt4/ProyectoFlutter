import 'package:flutter/foundation.dart';

class MenuController extends ChangeNotifier {
  
  int _indexBottom = 0;
  int _indexMore = 0;

  int get currentIndexBottom => this._indexBottom;
  int get currentIndexMore => this._indexMore;

  void onChangeCurrentIndexBottom(int index) {
    this._indexBottom = index;
    notifyListeners();
  }

}