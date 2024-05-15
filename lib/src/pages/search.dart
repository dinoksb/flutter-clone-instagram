import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_clone_instagram_blog/src/components/search_grid_view.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            // _appBar(),
            _body(),
          ],
        ),
      ),
    );
  }

  // Widget _appBar() {
  //   return SliverAppBar(
  //     floating: true,
  //     title: InkWell(
  //       // 누르면 버튼 효과,
  //       highlightColor: Colors.black12,
  //       borderRadius: BorderRadius.circular(8.0),
  //       onTap: () {
  //         //한번 눌렀을 때 페이지 이동함
  //       },
  //     ),
  //   );
  // }

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
