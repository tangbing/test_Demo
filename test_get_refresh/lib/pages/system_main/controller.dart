import 'package:get/get.dart';

import '../../routes/names.dart';


class SystemMainController extends GetxController {
  SystemMainController();

  _initData() {
    update(["system_main"]);
  }

  void onTap() {
    Get.toNamed(RouteNames.productList);
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
    print('SystemMainController');
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
