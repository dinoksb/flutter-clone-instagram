import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_clone_instagram_blog/src/components/image_avatar.dart';
import 'package:flutter_clone_instagram_blog/src/components/image_data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../controller/comment_bottom_sheet.dart';

class Feed extends StatefulWidget {
  final String userUrl;
  final String userName;
  final List<String> images;
  final int countLikes; // 좋아요 수
  final int countComment; // 댓글 수
  const Feed({
    super.key,
    required this.userUrl,
    required this.userName,
    required this.images,
    required this.countLikes,
    required this.countComment,
  });

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _header(),
        _images(),
        _options(),
        _comment(),
      ],
    );
  }

  Widget _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ImageAvatar(
                url: widget.userUrl,
                type: AvatarType.BASIC,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.userName,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.more_horiz),
        ),
      ],
    );
  }

  Widget _images() {
    return CarouselSlider.builder(
      itemCount: widget.images.length,
      itemBuilder: (context, index, realIndex) {
        return Container(
          color: Colors.black,
          width: Get.size.width,
          height: Get.size.height,
          child: CachedNetworkImage(
            imageUrl: widget.images[index],
            fit: BoxFit.cover,
          ),
        );
      },
      options: CarouselOptions(
        enableInfiniteScroll: false,
        aspectRatio: 1,
        viewportFraction: 1,
        onPageChanged: (index, reason) => {
          setState(() {
            _current = index;
          }),
        },
      ),
    );
  }

  Widget _options() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                child: ImageData(
                  path: IconsPath.likeOffIcon,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: showCommentSheet,
                child: ImageData(
                  path: IconsPath.directMessage,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                child: ImageData(
                  path: IconsPath.replyIcon,
                ),
              ),
            ),
          ],
        ),
        //이미지가 한장이면 인디케이터는 없음
        (widget.images.length == 1)
            ? Container()
            : AnimatedSmoothIndicator(
                //인덱스 전달
                activeIndex: this._current,
                //이미지의 갯수가 곧 인디케이터의 점의 갯수
                count: widget.images.length,
                //가장 인스타그램 인디케이터와 비슷한 효과
                effect: const ScrollingDotsEffect(
                    dotColor: Colors.black26,
                    activeDotColor: Colors.blue,
                    activeDotScale: 1,
                    spacing: 4.0,
                    dotWidth: 6.0,
                    dotHeight: 6.0),
              ),
        Row(
          children: [
            //안보이는 아이템1
            Opacity(
              opacity: 0,
              child: Padding(
                padding: const EdgeInsets.all(
                  8.0,
                ),
                child: GestureDetector(
                  child: ImageData(
                    path: IconsPath.bookMarkOffIcon,
                  ),
                ),
              ),
            ),
            //안보이는 아이템2
            Opacity(
              opacity: 0,
              child: Padding(
                padding: const EdgeInsets.all(
                  8.0,
                ),
                child: GestureDetector(
                  child: ImageData(
                    path: IconsPath.bookMarkOffIcon,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                child: ImageData(
                  path: IconsPath.bookMarkOffIcon,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _comment() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 피드 좋아요 개수
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '좋아요 ${widget.countLikes}개',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          // 피드 더보기 글
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ExpandableText(
              '안녕하세요.\n안녕하세요.\n안녕하세요.\n안녕하세요.\n안녕하세요.',
              expandText: '더보기', // 더보기 글자
              linkColor: Colors.grey, // 더보기 글자 색 지정
              prefixText: widget.userName, // 작성자 이름
              prefixStyle: // 작성자 이름 텍스트 스타일
                  const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
          ),
          // 댓글 모두 보기 부분
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  '댓글 ${widget.countComment}개 모두 보기',
                  style: const TextStyle(color: Colors.grey),
                ),
              )),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: ImageAvatar(
                  url:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTnnnObTCNg1QJoEd9Krwl3kSUnPYTZrxb5Ig&usqp=CAU',
                  type: AvatarType.BASIC,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  '댓글 달기...',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void showCommentSheet() {
    showModalBottomSheet(
        context: context,
        showDragHandle: true,
        enableDrag: true,
        isScrollControlled: true,
        useSafeArea: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
        builder: (_) => const CommentBottomSheet());
  }
}
