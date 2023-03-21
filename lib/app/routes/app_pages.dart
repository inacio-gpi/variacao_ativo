import 'package:variacao_ativo/app/routes/active_variation_routes.dart';
import 'package:variacao_ativo/app/routes/home_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = '/home';

  static final routes = [
    ...HomeRoutes.routes,
    ...ActiveVariationRoutes.routes,
  ];
}
