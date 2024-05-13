import 'dart:io';

import 'package:get/get.dart';

enum Page { HOME, SEARCH, UPLOAD, REELS, MYPAGE }

class BottomNavController extends GetxController {
  final RxInt _page = 0.obs;
  int get pageIndex => _page.value;

  List bottomHistory = [0];

  void changeIndex(int value) {
    var page = Page.values[value];
    switch(page){
      case Page.HOME:
      case Page.SEARCH:
      case Page.UPLOAD:
      case Page.REELS:
      case Page.MYPAGE:
        moveTo(value);
    }
  }

  void moveTo(int value) {
    _page(value);
    if(bottomHistory.last != value && Platform.isAndroid){
      bottomHistory.add(value);
    }
  }

   Future<bool> popAction() async {
    if (bottomHistory.length == 1) {
      return true;
    } else {
      bottomHistory.removeLast();
      _page(bottomHistory.last);
      print(bottomHistory);
      return false;
    }
  }
}
