import 'package:get/get.dart';
import 'package:variacao_ativo/app/routes/active_variation_routes.dart';
import 'package:variacao_ativo/app/routes/routes.dart';

class HomeController extends GetxController {
  final INavigationService _navigationService;
  HomeController(this._navigationService);

  final actives = [
    'PETR4.SA',
    'BBAS3.SA',
    'MGLU3.SA',
    'IRBR3.SA',
  ];

  Future<void> goToActiveVariationPage(final String active) async {
    await _navigationService.toNamed(ActiveVariationRoutes.activeVariation, arguments: active);
  }
}
