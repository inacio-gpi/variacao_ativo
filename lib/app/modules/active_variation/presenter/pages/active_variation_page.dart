import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:variacao_ativo/app/core/core.dart';
import 'package:variacao_ativo/app/modules/active_variation/presenter/controllers/active_variation_controller.dart';

class ActiveVariationPage extends BasePage<ActiveVariationController> {
  const ActiveVariationPage({final Key? key}) : super(key: key);
  @override
  PreferredSizeWidget? appBar(final BuildContext context) => AppBar(
        centerTitle: true,
        title: Text(
          controller.activeParam,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  LineTouchData get lineTouchData => LineTouchData(enabled: true);

  FlTitlesData get titlesData => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  List<LineChartBarData> get lineBarsData2 => [
        LineChartBarData(
          isCurved: true,
          curveSmoothness: 0,
          color: Colors.blue.withOpacity(0.5),
          barWidth: 4,
          isStrokeCapRound: true,
          dotData: FlDotData(show: false),
          belowBarData: BarAreaData(show: false),
          spots: controller.openIndicatorsChart(),
        ),
      ];

  Widget bottomTitleWidgets(final double value, final TitleMeta meta) => SideTitleWidget(
        angle: 1.6,
        axisSide: AxisSide.top,
        child: controller.handleBottomTitleWidgets(value.toInt()),
      );

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 32,
        interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      );

  FlGridData get gridData => FlGridData(show: false);

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: Border(
          bottom: BorderSide(color: Colors.black.withOpacity(0.8), width: 4),
          left: const BorderSide(color: Colors.transparent),
          right: const BorderSide(color: Colors.transparent),
          top: const BorderSide(color: Colors.transparent),
        ),
      );

  @override
  Widget body(final BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    controller.variationEntity().meta.symbol,
                    style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16, height: 1),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    controller.variationEntity().meta.regularMarketPrice.toString(),
                    style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 24, height: 1),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: Ink(
                  decoration: BoxDecoration(
                    color: controller.hasIncrement() ? Colors.blue : Colors.grey.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                  height: 35,
                  width: 35,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(50.0),
                    onTap: controller.hasIncrement() ? controller.incrementDates : null,
                    child: const Icon(Icons.add),
                    // color: Colors.red,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 60),
                  child: LineChart(
                    LineChartData(
                      lineTouchData: lineTouchData,
                      gridData: gridData,
                      titlesData: titlesData,
                      borderData: borderData,
                      lineBarsData: [
                        LineChartBarData(
                          isCurved: true,
                          curveSmoothness: 0,
                          color: Colors.blue.withOpacity(0.5),
                          barWidth: 4,
                          isStrokeCapRound: true,
                          dotData: FlDotData(show: false),
                          belowBarData: BarAreaData(show: true, color: Colors.blue.withOpacity(0.1)),
                          spots: controller.openIndicatorsChart(),
                          // spots: [const FlSpot(0, 1)],
                        ),
                      ],
                      minY: controller.handleChartMinX(),
                      maxY: controller.handleChartMaxX(),
                      maxX: controller.displayedDates.toDouble() - 1,
                      minX: 0,
                    ),
                    swapAnimationDuration: const Duration(milliseconds: 250),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
