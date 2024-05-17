

import 'package:get/get.dart';
import '../controller/search_focus_controller.dart';

class SearchFocusBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(SearchFocusController());
  }
}