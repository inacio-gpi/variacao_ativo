import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:variacao_ativo/app/modules/active_variation/active_variation.dart';

class ActiveVariationController extends GetxController {
  final IGetActiveVariationUseCase _getActiveVariationUseCase;

  ActiveVariationController(this._getActiveVariationUseCase);
  late String activeParam;
  final Rx<ResultEntity> variationEntity = ResultModel.empty().obs;
  final openIndicators = <double>[].obs;
  final dateOfOpenIndicator = <DateTime>[];
  final openIndicatorsChart = <FlSpot>[].obs;
  int displayedDates = 30;
  final hasIncrement = true.obs;

  @override
  void onInit() {
    activeParam = Get.arguments;
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    await getActiveVariation(activeParam);
    super.onReady();
  }

  Future<void> getActiveVariation(final String param) async {
    final result = await _getActiveVariationUseCase(param);
    result.fold(
      (final l) {
        Get.snackbar(
          'Ooops...',
          'Ocorreu algum erro ao buscar os dados do ativo',
          backgroundColor: Colors.red,
        );
      },
      (final r) {
        if (r.chart.result.isNotEmpty) {
          openIndicators.addAll(r.chart.result[0].indicators.quote[0].open);
          variationEntity(r.chart.result[0]);
          handleChartSpotsOpen();
          dateOfOpenIndicator.addAll(
            variationEntity().timestamp.map((final e) => DateTime.fromMillisecondsSinceEpoch(e * 1000)),
          );
        }
      },
    );
  }

  double? handleChartMinX() {
    final result = _returnFiltered(openIndicators);
    return result.isEmpty ? 0 : result.reduce(min);
  }

  double? handleChartMaxX() {
    final result = _returnFiltered(openIndicators);
    return result.isEmpty ? 0 : result.reduce(max);
  }

  List<FlSpot>? handleChartSpotsTimestamp() {
    final spots = <FlSpot>[];
    if (variationEntity().timestamp.isNotEmpty) {
      for (var i = 0; i < displayedDates; i++) {
        spots.add(
          FlSpot(
            i.toDouble(),
            variationEntity().timestamp[i].toDouble(),
          ),
        );
      }
    }
    return spots;
  }

  void handleChartSpotsOpen() {
    final result = _returnFilteredElements(openIndicators);
    openIndicatorsChart(result);
  }

  Widget handleBottomTitleWidgets(final int index) {
    Widget text;
    final displayedDatesDivided = displayedDates ~/ 5;
    if (dateOfOpenIndicator.length - 1 >= index) {
      String textBottom;
      if (index == 0 ||
          index == displayedDatesDivided ||
          index == displayedDatesDivided * 2 ||
          index == displayedDatesDivided * 3 ||
          index == displayedDatesDivided * 4 ||
          index == displayedDates - 1) {
        textBottom = DateFormat('dd/MM/yy HH:mm').format(dateOfOpenIndicator[index]);
      } else {
        textBottom = '';
      }

      text = Text(
        textBottom,
        style: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
      );
    } else {
      text = const Text('');
    }
    return text;
  }

  List<FlSpot> _returnFilteredElements(final List<double> param) {
    final spots = <FlSpot>[];
    if (param.isNotEmpty) {
      final auxComp = param.length > displayedDates ? displayedDates : param.length;
      for (var i = 0; i < auxComp; i++) {
        spots.add(FlSpot(i.toDouble(), param[i]));
      }
    }
    return spots;
  }

  List<double> _returnFiltered(final List<double> param) {
    final result = <double>[];
    if (param.isNotEmpty) {
      final auxComp = param.length > displayedDates ? displayedDates : param.length;
      for (var i = 0; i < auxComp; i++) {
        result.add(param[i]);
      }
    }
    return result;
  }

  void incrementDates() {
    displayedDates += 30;
    if (displayedDates > variationEntity().timestamp.length) {
      hasIncrement(false);
      displayedDates = variationEntity().timestamp.length;
    }
    handleChartSpotsOpen();
  }
}
