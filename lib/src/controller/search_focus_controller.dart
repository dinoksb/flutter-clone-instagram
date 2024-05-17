import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/search_result.dart';

class SearchFocusController extends GetxController
  // 컨트롤러 초기화를 위한 mixin
  with GetSingleTickerProviderStateMixin{
  final TextEditingController _controller = TextEditingController();
  late TabController _tab;
  final List<Widget> _tabs = [
    const Tab(
      text: '회원님들을 위한 추천',
    ),
    const Tab(
      text: '계정',
    ),
    const Tab(
      text: '릴스',
    ),
    const Tab(
      text: '오디오',
    ),
    const Tab(
      text: '태그',
    ),
    const Tab(
      text: '장소',
    ),
  ];

  TextEditingController get searchController => _controller;
  TabController get tabController => _tab;
  List<Widget> get tabs => _tabs;

  @override
  void onInit(){
    super.onInit();
    // 탭 컨트롤러 초기화
    _tab = TabController(length: _tabs.length, vsync: this);
  }

  void submitted(String value){
    Get.off(() => const SearchResult(), id: 1);
  }
}