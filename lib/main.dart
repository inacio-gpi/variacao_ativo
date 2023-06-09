import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:variacao_ativo/app/core/bindings/application_bindings.dart';
import 'package:variacao_ativo/app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Your App Title',
      initialBinding: ApplicationBindings(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
