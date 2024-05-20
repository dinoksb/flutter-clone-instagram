import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_clone_instagram_blog/src/components/image_avatar.dart';
import 'package:flutter_clone_instagram_blog/src/components/image_data.dart';

import '../components/mypage_button.dart';
import '../components/mypage_info.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
            appBar: _appBar(),
            body: RefreshIndicator.adaptive(
              // 해당 부분을 작성해야
              // NestedScrollView에서
              // Refresh효과를 적용할 수 있음.
              notificationPredicate: (notification) {
                if (notification is OverscrollNotification || Platform.isIOS) {
                  return notification.depth == 2;
                }
                return notification.depth == 0;
              },
              onRefresh: () async {
                //임의의 새로고침 지연시간
                await Future.delayed(const Duration(seconds: 1));
              },
              child: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    SliverList(
                        delegate:
                            SliverChildListDelegate([_info(), _buttons()])),
                  ];
                },
                body: Column(
                  children: [
                    _tabs(),
                    _tabBarView(),
                  ],
                ),
              ),
            )));
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      title: Row(
        children: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  showDragHandle: true,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  )),
                  builder: (context) => Container(
                        height: 400,
                      ));
            },
            child: const Text(
              'dinosb',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          ImageData(
            path: IconsPath.arrowDown,
            width: 60,
          )
        ],
      ),
      // actions 영역
      actions: [
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: ImageData(path: IconsPath.uploadIcon),
        ),
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: ImageData(path: IconsPath.menuIcon),
        ),
      ],
    );
  }

  Widget _info() {
    return const Row(
      children: [
        Padding(
          padding: EdgeInsets.all(15.0),
          child: ImageAvatar(
            width: 100,
            url:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnnnObTCNg1QJoEd9Krwl3kSUnPYTZrxb5Ig&usqp=CAU',
            type: AvatarType.MYSTORY,
          ),
        ),
        Expanded(
          flex: 3,
          child: Padding(
            padding: EdgeInsets.all(30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: MyPageInfo(
                    count: 35,
                    label: '게시물',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: MyPageInfo(count: 167, label: '팔로워'),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: MyPageInfo(count: 144, label: '팔로잉'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buttons() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(flex: 4, child: MyPageButton(onTap: () {}, label: '프로필 편집')),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(flex: 4, child: MyPageButton(onTap: () {}, label: '프로필 공유')),
          const SizedBox(
            width: 10.0,
          ),
          Container(
              width: 40,
              height: 40,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: const Color(0xfff3f3f3),
                  borderRadius: BorderRadius.circular(4.0)),
              child: ImageData(path: IconsPath.addFriend))
        ],
      ),
    );
  }

  Widget _tabBarView() {
    return Expanded(
      child: TabBarView(children: [
        _myFeeds(),
        _tagImages(),
      ]),
    );
  }

  Widget _myFeeds() {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, crossAxisSpacing: 1.0, mainAxisSpacing: 1.0),
        itemCount: 50,
        itemBuilder: (context, index) => Container(
              color: Colors.blue,
            ));
  }

  Widget _tagImages() {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, crossAxisSpacing: 1.0, mainAxisSpacing: 1.0),
        itemCount: 50,
        itemBuilder: (context, index) => Container(
              color: Colors.red,
            ));
  }

  Widget _tabs() {
    return TabBar(
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorColor: Colors.black, tabs: [
      Tab(
        child: ImageData(path: IconsPath.gridViewOff),
      ),
      Tab(
        child: ImageData(path: IconsPath.myTagImageOff),
      ),
    ]);
  }
}
