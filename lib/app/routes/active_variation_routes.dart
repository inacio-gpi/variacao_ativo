import 'package:get/get.dart';
import 'package:variacao_ativo/app/modules/active_variation/active_variation_binding.dart';
import 'package:variacao_ativo/app/modules/active_variation/presenter/pages/active_variation_page.dart';

class ActiveVariationRoutes {
  ActiveVariationRoutes._();

  static const activeVariation = '/active-variation';

  static final routes = [
    GetPage(
      name: activeVariation,
      page: () => const ActiveVariationPage(),
      binding: ActiveVariationBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
  ];
}
