import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchGridView extends StatelessWidget {
  final Widget child;
  const SearchGridView({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    //패턴 1
    final List<QuiltedGridTile> patternOne = [
      const QuiltedGridTile(1, 1),
      const QuiltedGridTile(1, 1),
      const QuiltedGridTile(2, 1),
      const QuiltedGridTile(1, 1),
      const QuiltedGridTile(1, 1),
    ];
    //패턴 2
    final List<QuiltedGridTile> patternTwo = [
      const QuiltedGridTile(2, 1),
      const QuiltedGridTile(1, 1),
      const QuiltedGridTile(1, 1),
      const QuiltedGridTile(1, 1),
      const QuiltedGridTile(1, 1),
    ];
    //패턴 3
    final List<QuiltedGridTile> patternThree = [
      const QuiltedGridTile(2, 2),
      const QuiltedGridTile(1, 1),
      const QuiltedGridTile(1, 1),
    ];

    return SliverGrid.builder(
      gridDelegate: SliverQuiltedGridDelegate(
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
        crossAxisCount: 3,
        repeatPattern: QuiltedGridRepeatPattern.same,
        pattern: [
          //패턴 1
          ...patternOne,
          //패턴 2
          ...patternTwo,
          //패턴 1
          ...patternOne,
          //패턴 3
          ...patternThree,
          //패턴 1
          ...patternOne,
          //패턴 2
          ...patternTwo,
          //패턴 1
          ...patternOne,
          //패턴 2
          ...patternTwo
        ],
      ),
      itemCount: 50,
      itemBuilder: (context, index) => Container(
        color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
        child: child,
      ),
    );
  }
}
