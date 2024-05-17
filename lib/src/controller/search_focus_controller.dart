import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchFocusController extends GetxController{
  final TextEditingController _controller = TextEditingController();

  TextEditingController get searchController => _controller;

  void submitted(String value){
    // Get.off(() => const SearchResult());
  }
}