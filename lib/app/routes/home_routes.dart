import 'package:get/get.dart';
import 'package:variacao_ativo/app/modules/home/home_binding.dart';
import 'package:variacao_ativo/app/modules/home/home_page.dart';

class HomeRoutes {
  HomeRoutes._();

  static const home = '/home';

  static final routes = [
    GetPage(
      name: home,
      page: () => const HomePage(),
      transition: Transition.leftToRight,
      binding: HomeBinding(),
    ),
  ];
}
