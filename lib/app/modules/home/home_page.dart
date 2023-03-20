import 'package:flutter/material.dart';
import 'package:variacao_ativo/app/core/core.dart';
import 'package:variacao_ativo/app/modules/home/home_controller.dart';

class HomePage extends BasePage<HomeController> {
  const HomePage({final Key? key}) : super(key: key);

  @override
  Widget body(final BuildContext context) => Center(
        child: Column(
          children: [
            const Text(
              'HomePage is working',
              style: TextStyle(fontSize: 20),
            ),
            TextButton(
              onPressed: controller.goToActiveVariationPage,
              child: const Text(
                'Ir para Listagem',
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        ),
      );
}
