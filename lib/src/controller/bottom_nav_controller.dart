import 'dart:io';
import 'package:flutter_clone_instagram_blog/src/binding/upload_binding.dart';
import 'package:get/get.dart';
import '../pages/upload.dart';

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
      case Page.REELS:
      case Page.MYPAGE:
        moveTo(value);
      case Page.UPLOAD:
        moveToUpload();

    }
  }

  void moveTo(int value) {
    _page(value);
    if(bottomHistory.last != value && Platform.isAndroid){
      bottomHistory.add(value);
    }
  }

  void moveToUpload() {
    Get.to(() => const Upload(), binding: UploadBinding());
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
