import 'package:flutter/material.dart';
import 'package:flutter_clone_instagram_blog/src/components/image_data.dart';
import 'package:flutter_clone_instagram_blog/src/components/upload_image.dart';
import 'package:flutter_clone_instagram_blog/src/controller/upload_controller.dart';
import 'package:get/get.dart';
import 'package:photo_manager_image_provider/photo_manager_image_provider.dart';

class Upload extends GetView<UploadController> {
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
    return (controller.selectedImage != null)
    ? SizedBox(
      height: Get.size.width,
      width: Get.size.width,
      child: AssetEntityImage(
        controller.selectedImage!,
        isOriginal: false,
        fit: BoxFit.contain,
      )) 
      : Container(
        height: Get.size.width,
        width: Get.size.width,
        color: Colors.black
      );
  }

  Widget _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () => controller.moveToChoose(),
                child: Text(
                  // 앨범의 이름을 표시하는 영역
                  (controller.albums.isNotEmpty)
                      ? controller.albums[controller.index].name!
                      : '텅',
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
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
      child: (controller.albums.isNotEmpty)
          ? GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 1.0,
                  crossAxisSpacing: 1.0),
              itemCount: controller.albums[controller.index].images!.length,
              itemBuilder: (context, index) => // 앨범의 이미지를 보여주는 위젯
                  UploadImage(
                      onTap: () {
                        controller.select(
                            controller.albums[controller.index].images![index]);},
                      entity:
                          controller.albums[controller.index].images![index],
                      fit: BoxFit.cover))
          : const Center(
              child: Text('텅'),
            ),
    );
  }
}
