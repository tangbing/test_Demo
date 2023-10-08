import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_get_refresh/home/view.dart';
import 'package:test_get_refresh/routes/routers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import 'common/keyboard_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      initialRoute: RouteGet.main,
      getPages: RouteGet.getPages,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.rightToLeft,
      /// SmartDialog
      navigatorObservers: [FlutterSmartDialog.observer],
      builder: FlutterSmartDialog.init(builder: _builder),

    );
  }

  Widget _builder(BuildContext context, Widget? child) {
    //设置尺寸（填写设计中设备的屏幕尺寸）如果设计基于360dp * 690dp的屏幕
    ScreenUtil.init(context, designSize: const Size(375, 812));
    return Scaffold(
      // Global GestureDetector that will dismiss the keyboard
        body: GestureDetector(
          onTap: () {
            KeyboardUtils.hideKeyboard(context);
          },
          child: child,
        ));
  }
}

