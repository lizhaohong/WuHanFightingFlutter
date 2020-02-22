import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nav_router/nav_router.dart';
import 'package:wu_han_fighting_flutter/config/const.dart';
import 'package:wu_han_fighting_flutter/config/storage_manager.dart';
import 'package:wu_han_fighting_flutter/page/root_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ///配置全局存储
  await StorageManager.init();

  runApp(MyApp());

  ///构建错误视图
  ErrorWidget.builder = (FlutterErrorDetails details) {
    debugPrint(details.toString());

    return Center(
      child: Text("视图出现错误了"),
    );
  };

  ///适配安卓
  if(Platform.isAndroid) {
    SystemUiOverlayStyle style = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light
    );
    SystemChrome.setSystemUIOverlayStyle(style);
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: navGK,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: bgColor,
        primarySwatch: Colors.blue,
      ),
      home: RootPage(),
    );
  }
}
