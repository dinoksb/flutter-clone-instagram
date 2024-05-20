import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_manager_image_provider/photo_manager_image_provider.dart';
import '../controller/upload_controller.dart';

class UploadChoice extends GetView<UploadController> {
  const UploadChoice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 취소버튼을 이용해서 뒤로감
        leading: TextButton(
            onPressed: Get.back,
            child: const Text(
              '취소',
              style: TextStyle(color: Colors.black, fontSize: 17),
            )),
        title: const Text('사진첩 선택'),
        titleTextStyle: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 17, color: Colors.black),
        centerTitle: true,
      ),
      body: Obx(() => ListView.builder(
          itemCount: controller.albums.length,
          itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  controller.changeIndex(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: AssetEntityImage(
                          controller.albums[index].images![0],
                          fit: BoxFit.cover,
                          isOriginal: true,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.albums[index].name!,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          Text('${controller.albums[index].images!.length}')
                        ],
                      ),
                    ],
                  ),
                ),
              ))),
    );
  }
}
