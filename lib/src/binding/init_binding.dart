import 'package:get/get.dart';

import '../controller/bottom_nav_controller.dart';

class InitBinding extends Bindings{
  @override
  void dependencies(){
    // permanent 속성을 true로 할당하게 되면, 앱이 종료되기 전까지 컨트롤러를 메모리에서 삭제하지 않는다.
    Get.put(BottomNavController(), permanent: true);
  }
}