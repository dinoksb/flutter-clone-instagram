import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_clone_instagram_blog/src/components/image_data.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            _appBar(),
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
      itemBuilder: (context, index) => Container(
        height: 50,
        color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
      ),
    );
  }
}
