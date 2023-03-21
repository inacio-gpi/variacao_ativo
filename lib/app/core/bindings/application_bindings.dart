import 'package:get/get.dart';
import 'package:variacao_ativo/app/core/core.dart';
import 'package:variacao_ativo/app/routes/navigation/navigation.dart';

class ApplicationBindings extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut<INavigationService>(() => NavigationService())
      ..lazyPut<IRestClient>(() => RestClient(), fenix: true);
  }
}
