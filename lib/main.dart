import 'package:flutter/material.dart';
import 'package:flutter_clone_instagram_blog/src/app.dart';
import 'package:get/get.dart';

import 'src/binding/init_binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,//디버그 배너 해제
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
              foregroundColor: Colors.black, backgroundColor: Colors.white)),
      home: const App(),
      initialBinding: InitBinding(), //초기 바인딩
    );
  }
}