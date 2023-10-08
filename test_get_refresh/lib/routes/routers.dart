

import 'package:test_get_refresh/home/binding.dart';
import 'package:test_get_refresh/home/view.dart';
import 'package:get/get.dart';

import '../pages/order_confirm/view.dart';
import '../pages/order_done/view.dart';
import '../pages/product_detail/view.dart';
import '../pages/product_list/view.dart';
import '../pages/system_main/view.dart';
import '../pages/user_profile/view.dart';
import 'names.dart';



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
      name: RouteNames.main,
      page: () => const SystemMainPage(),
    ),
    GetPage(
      name: RouteNames.orderConfirm,
      page: () => const OrderConfirmPage(),
    ),
    GetPage(
      name: RouteNames.orderDone,
      page: () => const OrderDonePage(),
    ),
    GetPage(
      name: RouteNames.productDetail,
      page: () => const ProductDetailPage(),
    ),
    GetPage(
      name: RouteNames.productList,
      page: () => const ProductListPage(),
    ),
    GetPage(
      name: RouteNames.userProfile,
      page: () => const UserProfilePage(),
    ),

    GetPage(
        name: home,
        page: () => HomePage(),
        binding: HomeBinding(),
    ),
  ];
}