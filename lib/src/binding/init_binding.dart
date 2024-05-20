import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_clone_instagram_blog/src/components/firebaseDB.dart';
import 'package:get/get.dart';

import '../components/feed_repository.dart';
import '../controller/bottom_nav_controller.dart';
import '../controller/feed_controller.dart';

class InitBinding extends Bindings{
  @override
  void dependencies(){
    // permanent 속성을 true로 할당하게 되면, 앱이 종료되기 전까지 컨트롤러를 메모리에서 삭제하지 않는다.
    Get.put(BottomNavController(), permanent: true);
    Get.put(FeedController(
        feedRepository: FeedRepository(
            firebaseDB:
                FirebaseDB(firebaseFirestore: FirebaseFirestore.instance))));
  }
}