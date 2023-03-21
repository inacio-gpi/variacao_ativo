import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BasePage<myController> extends GetView<myController> {
  const BasePage({super.key});

  @protected
  PreferredSizeWidget? appBar(final BuildContext context) => null;

  @protected
  Widget body(final BuildContext context);

  @override
  Widget build(final BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: appBar(context),
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Padding(
              // padding: withOutPadding ? EdgeInsets.zero : const EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.zero,
              child: body(context),
            ),
          ),
        ),
      );
}
