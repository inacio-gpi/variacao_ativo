import 'package:flutter/material.dart';
import 'package:variacao_ativo/app/core/core.dart';
import 'package:variacao_ativo/app/modules/home/home_controller.dart';

class HomePage extends BasePage<HomeController> {
  const HomePage({final Key? key}) : super(key: key);

  @override
  PreferredSizeWidget? appBar(final BuildContext context) => AppBar(
        centerTitle: true,
        title: const Text(
          'HomePage Flutter',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  @override
  Widget body(final BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          children: [
            const Text(
              'Selecione um ativo para ver a variação:',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: controller.actives.length,
                itemBuilder: (final context, final index) => ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(controller.actives[index], style: TextStyle(color: Colors.black.withOpacity(0.7))),
                  onTap: () async => controller.goToActiveVariationPage(controller.actives[index]),
                ),
              ),
            ),
          ],
        ),
      );
}
