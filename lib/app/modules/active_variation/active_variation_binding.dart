import 'package:get/get.dart';
import 'package:variacao_ativo/app/core/http/i_rest_client.dart';
import 'package:variacao_ativo/app/modules/active_variation/active_variation.dart';

class ActiveVariationBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut<IActiveVariationDataSource>(
        () => ActiveVariationDataSource(Get.find<IRestClient>()),
      )
      ..lazyPut<IActiveVariationRepository>(
        () => ActiveVariationRepository(Get.find()),
      )
      ..lazyPut<IGetActiveVariationUseCase>(
        () => GetActiveVariationUseCase(Get.find()),
      )
      ..lazyPut<ActiveVariationController>(
        () => ActiveVariationController(Get.find(), Get.find()),
      );
  }
}
