import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'image_data.dart';

enum AvatarType { ON, OFF, STORY, MYSTORY }

class ImageAvatar extends StatelessWidget {
  final String url;
  final double width;
  final AvatarType type;
  final void Function()? onTap;

  const ImageAvatar(
      {super.key,
      required this.width,
      required this.url,
      required this.type,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return switch (type) {
      AvatarType.ON => _activeAvatar(),
      AvatarType.OFF => _offAvatar(),
      AvatarType.STORY => _storyAvatar(),
      AvatarType.MYSTORY => _myStoryAvatar(),
    };
  }

  Widget _basicAvatar() {
    return Container(
      padding: const EdgeInsets.all(1.0),
      decoration:
          const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        child: SizedBox(
          width: width,
          height: width,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(65),
            child: CachedNetworkImage(
              imageUrl: url,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  Widget _activeAvatar() {
    return Container(
      height: width + 2,
      width: width + 2,
      padding: const EdgeInsets.all(1.0),
      decoration:
          const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
      child: _basicAvatar(),
    );
  }

  Widget _offAvatar() {
    return Container(
      height: width + 2,
      width: width + 2,
      padding: const EdgeInsets.all(1.0),
      decoration:
          const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      child: _basicAvatar(),
    );
  }

  Widget _storyAvatar() {
    return Container(
      padding: const EdgeInsets.all(3.0),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Color(0xfffce80a), // 노랑
            Color(0xfffc3a0a), // 빨강
            Color(0xffc80afc), // 보라)
          ],
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(2.0),
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: _basicImage(),
      ),
    );
  }

  Widget _basicImage() {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(width!),
        child: SizedBox(
          width: width,
          height: width,
          child: CachedNetworkImage(
            imageUrl: url,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _myStoryAvatar() {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(3.5),
        child: Stack(
          children: [
            _basicImage(),
            Positioned(
              bottom: 0.5,
              right: 0.5,
              child: Container(
                padding: const EdgeInsets.all(3.0),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white
                ),
                child: ImageData(
                  width: 65,
                  path: IconsPath.plusIcon,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
