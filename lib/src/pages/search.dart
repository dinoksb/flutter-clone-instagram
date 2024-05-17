import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_clone_instagram_blog/src/components/image_data.dart';
import 'package:get/get.dart';
import '../binding/search_focus_binding.dart';
import '../components/search_focus.dart';
import '../components/search_grid_view.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            _appBar(),
            _body(),
          ],
        ),
      ),
    );
  }

  Widget _appBar() {
    return SliverAppBar(
      floating: true,
      title: InkWell(
        // 누르면 버튼 효과,
        highlightColor: Colors.black12,
        borderRadius: BorderRadius.circular(8.0),
        onTap: () {
          //한번 눌렀을 때 페이지 이동함
          Get.to(
            () => const SearchFocus(),
            transition: Transition.fadeIn,
            binding: SearchFocusBinding(),
            // id: 1,
          );
        },
        onLongPress: () {
          // 길게 눌러도 페이지 이동
          Get.to(
            () => const SearchFocus(),
            transition: Transition.fadeIn,
            binding: SearchFocusBinding(),
            // id: 1,
          );
        },
        child: Container(
          padding: const EdgeInsets.all(8.0),
          height: 40,
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: const Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(
                  Icons.search,
                  color: Color(0xff7d7d7d),
                  size: 20,
                ),
              ),
              Text(
                '검색',
                style: TextStyle(color: Color(0xff7d7d7d), fontSize: 18),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _body() {
    return SearchGridView(
      //이미지 전달
      child: CachedNetworkImage(
        imageUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS75ebrwvgVW5Ks_oLfCbG8Httf3_9g-Ynl_Q&usqp=CAU',
        fit: BoxFit.cover,
      ),
    );
  }
}
