import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_clone_instagram_blog/src/components/feed.dart';
import 'package:flutter_clone_instagram_blog/src/components/image_data.dart';
import 'package:get/get.dart';
import 'components/image_avatar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            _appBar(),
            _story(),
            _body(),
          ],
        ),
      ),
    );
  }

  Widget _appBar() {
    return SliverAppBar(
      //floating 옵션을 통해서 페이드 애니메이션 구현 가능
      floating: true,
      title: ImageData(
        path: IconsPath.logo,
        width: 300,
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ImageData(path: IconsPath.activeOn),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ImageData(path: IconsPath.activeOff),
          ),
        ),
      ],
    );
  }

  Widget _body() {
    return SliverList.builder(
      itemCount: 50,
      itemBuilder: (context, index) => const Feed(
        userUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnnnObTCNg1QJoEd9Krwl3kSUnPYTZrxb5Ig&usqp=CAU',
        userName: 'dinosb',
        images: [
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnnnObTCNg1QJoEd9Krwl3kSUnPYTZrxb5Ig&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRisv-yQgXGrto6OxQxX62JyvyQGvRsQQ760g&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQifBWUhSiSfL0t8M3XCOe8aIyS6de2xWrt5A&usqp=CAU',
        ],
        countLikes: 10,
        countComment: 5,
      ),
    );
  }

  Widget _story() {
    return SliverToBoxAdapter(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Column(
              children: [
                // 나의 스토리를 업로드할 수 있는 아바타 영역
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ImageAvatar(
                      width: Get.size.width * 0.2,
                      url:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnnnObTCNg1QJoEd9Krwl3kSUnPYTZrxb5Ig&usqp=CAU',
                      type: AvatarType.MYSTORY),
                ),
                const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text('내 스토리'),
                )
              ],
            ),
            ...List.generate(
              20,
              (index) => SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ImageAvatar(
                        width: Get.size.width * 0.2,
                        type: AvatarType.STORY,
                        url:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS75ebrwvgVW5Ks_oLfCbG8Httf3_9g-Ynl_Q&usqp=CAU',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        '$index번째 사용자',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
