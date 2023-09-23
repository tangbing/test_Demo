

import 'package:test_get_refresh/home/binding.dart';
import 'package:test_get_refresh/home/view.dart';
import 'package:get/get.dart';



class RouteGet {
  ///root page
  static const String main = "/";
  static const String two = "/two";
  static const String home = "/home";

  ///pages map
  static final List<GetPage> getPages = [
    // GetPage(
    //     name: main,
    //     page: () => CounterPage(),
    //     binding: CounterBinding()
    // ),
    // GetPage(
    //     name: two,
    //     page: () => TwoPage(),
    //     binding: TwoBinding()
    // ),
    GetPage(
        name: home,
        page: () => HomePage(),
        binding: HomeBinding(),
    ),
  ];
}