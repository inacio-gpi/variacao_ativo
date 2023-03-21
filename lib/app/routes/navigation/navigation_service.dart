import 'package:get/get.dart';
import 'package:variacao_ativo/app/routes/navigation/i_navigation_service.dart';

class NavigationService implements INavigationService {
  NavigationService();

  @override
  void back<T>({final T? result}) => Get.back(result: result);

  @override
  Future<T?>? toNamed<T>(final String path, {final dynamic arguments}) async => Get.toNamed<T>(path, arguments: arguments, preventDuplicates: false);
}
