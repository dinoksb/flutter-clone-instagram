import 'package:flutter/material.dart';
import 'package:flutter_clone_instagram_blog/src/components/image_data.dart';
import 'package:get/get.dart';

class Upload extends StatelessWidget {
  const Upload({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 앱바 타이틀
        centerTitle: true,
        title: const Text(
          '새 게시물',
        ),
        titleTextStyle: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        // 뒤로 가기 버튼
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: Get.back,
            child: ImageData(path: IconsPath.closeImage),
          ),
        ),
        // 액션
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ImageData(path: IconsPath.nextImage),
          )
        ],
      ),
      body: Column(
        children: [
          // preview 영역
          _preview(),
          // header 영역
          _header(),
          // image 영역
          _images(),
        ],
      ),
    );
  }

  Widget _preview() {
    return Container(
      height: Get.size.width,
      width: Get.size.width,
      color: Colors.black,
    );
  }

  Widget _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Recent',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            ImageData(
              path: IconsPath.arrowDown,
              width: 60,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //동그라미 효과
            Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.all(4.0),
                decoration: const BoxDecoration(
                    color: Color(0xff808080), shape: BoxShape.circle),
                child: ImageData(
                  path: IconsPath.imageSelectIcon,
                  width: 60,
                )),
            Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.all(4.0),
                decoration: const BoxDecoration(
                    color: Color(0xff808080), shape: BoxShape.circle),
                child: ImageData(
                  path: IconsPath.cameraIcon,
                  width: 60,
                )),
          ],
        )
      ],
    );
  }

  Widget _images() {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, mainAxisSpacing: 1.0, crossAxisSpacing: 1.0),
        itemCount: 50,
        itemBuilder: (context, index) => Container(
          color: Colors.blue,
        ),
      ),
    );
  }
}
