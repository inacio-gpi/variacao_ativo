import 'package:get/get.dart';
import 'package:variacao_ativo/app/modules/home/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(Get.find()),
    );
  }
}
