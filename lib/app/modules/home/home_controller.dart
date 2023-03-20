import 'package:get/get.dart';
import 'package:variacao_ativo/app/routes/active_variation_routes.dart';
import 'package:variacao_ativo/app/routes/routes.dart';

class HomeController extends GetxController {
  final INavigationService _navigationService;
  HomeController(this._navigationService);

  Future<void> goToActiveVariationPage() async {
    await _navigationService.toNamed(ActiveVariationRoutes.activeVariation, arguments: 'testeParam');
  }
}
