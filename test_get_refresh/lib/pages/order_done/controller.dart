import 'package:get/get.dart';

import '../../routes/names.dart';



class OrderDoneController extends GetxController {
  OrderDoneController();

  _initData() {
    update(["order_done"]);
  }

  void toProductList() {
    Get.until((route) => Get.currentRoute == RouteNames.productList);
  }

  void toUserProfile() {
    Get.offNamedUntil(
      RouteNames.userProfile,
      (route) => route.isFirst,
    );
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
    print('OrderDoneController');
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
