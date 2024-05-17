import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_clone_instagram_blog/src/components/search_text_field.dart';
import 'package:flutter_clone_instagram_blog/src/controller/search_focus_controller.dart';

class SearchResult extends GetView<SearchFocusController> {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      centerTitle: true,
      title: SearchTextField(
          focus: false, controller: controller.searchController),
      // 앱바 하단 영역
      bottom: PreferredSize(
        // 하단 영역 크기
        preferredSize: const Size.fromHeight(50),
        child: Container(
          // 앱바 높이
          height: AppBar().preferredSize.height,
          // 앱바 너비 무한
          width: Size.infinite.width,
          decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Color(0xffe4e4e4)))),
          child: TabBar(
            //탭바를 스크롤 가능하게 함
            isScrollable: true,
            //탭바를 정렬을 시작 위치로
            tabAlignment: TabAlignment.start,
            // 레이블 색상
            labelColor: Colors.black,
            // 레이블 스타일 지정
            labelStyle: const TextStyle(fontSize: 15),
            // 선택 안된 레이블 스타일 지정
            unselectedLabelStyle: const TextStyle(fontSize: 15),
            // 하단에 선택된 레이블 인디케이터 설정
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Colors.black,
            indicatorWeight: 1.0,
            controller: controller.tabController,
            tabs: controller.tabs,
          ),
        ),
      ),
    );
  }

  Widget _body() {
    return TabBarView(
      controller: controller.tabController,
      children: const [
        Center(
          child: Text('추천페이지'),
        ),
        Center(
          child: Text('계정페이지'),
        ),
        Center(
          child: Text('릴스페이지'),
        ),
        Center(
          child: Text('오디오페이지'),
        ),
        Center(
          child: Text('태그페이지'),
        ),
        Center(
          child: Text('장소페이지'),
        ),
      ],
    );
  }
}
