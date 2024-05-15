import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clone_instagram_blog/src/components/image_avatar.dart';
import 'package:flutter_clone_instagram_blog/src/components/image_data.dart';
import 'package:flutter_clone_instagram_blog/src/controller/bottom_nav_controller.dart';
import 'package:flutter_clone_instagram_blog/src/pages/home.dart';

import 'pages/search.dart';

class App extends GetView<BottomNavController> {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didpop) {
         controller.popAction();
      },
      child: Obx(
        () => Scaffold(
          backgroundColor: Colors.white,
          body: _body(),
          bottomNavigationBar: _bottomNavigationBar(),
        ),
      ),
    );
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: controller.pageIndex,
      onTap: controller.changeIndex,
      items: [
        BottomNavigationBarItem(
            icon: ImageData(path: IconsPath.homeOff),
            activeIcon: ImageData(path: IconsPath.homeOn),
            label: 'home'),
        BottomNavigationBarItem(
            icon: ImageData(path: IconsPath.searchOff),
            activeIcon: ImageData(path: IconsPath.searchOn),
            label: 'home'),
        BottomNavigationBarItem(
            icon: ImageData(path: IconsPath.uploadIcon),
            activeIcon: ImageData(path: IconsPath.uploadIcon),
            label: 'home'),
        BottomNavigationBarItem(
            //TODO: reels On / Off 아이콘 추가 필요
            //icon: ImageData(path: IconsPath.reelsOff),
            //activeIcon: ImageData(path: IconsPath.reelsOn),
            icon: ImageData(path: IconsPath.reelsOff),
            activeIcon: ImageData(path: IconsPath.reelsOn),
            label: 'home'),
        const BottomNavigationBarItem(
            icon: ImageAvatar(
              url:
                  'https://image.utoimage.com/preview/cp872722/2022/12/202212008462_500.jpg',
              type: AvatarType.OFF,
              width: 25,
            ),
            activeIcon: ImageAvatar(
              url:
                'https://demo.ycart.kr/shopboth_farm_max5_001/data/editor/1612/cd2f39a0598c81712450b871c218164f_1482469221_493.jpg',
              type: AvatarType.ON,
              width: 25,
            ),
            label: 'home'),
      ],
    );
  }

  Widget _body(){
    return IndexedStack(
      index:  controller.pageIndex,
      children: const [
        Home(),
        // Center(child: Text('search')),
        Search(),
        Center(child: Text('upload'),),
        Center(child: Text('reels'),),
        Center(child: Text('mypage'),),
      ],
    );
  }
}
