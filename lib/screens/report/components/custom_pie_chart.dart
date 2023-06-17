import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class CustomPieChart extends StatelessWidget {
  final Map<String, double> dataMap;
  final Duration? animationDuration;
  final double chartLegendSpacing;
  final List<Color> colorList;
  final LegendPosition legendPosition;
  final bool showChartValues;
  final bool showChartValuesInPercentage;

  const CustomPieChart({
    Key? key,
    required this.dataMap,
    this.animationDuration = const Duration(milliseconds: 3000),
    this.chartLegendSpacing = 32.0,
    this.colorList = const [
      Color(0xFF74b9ff),
      Color(0xFFff7675),
    ],
    this.legendPosition = LegendPosition.bottom,
    this.showChartValues = true,
    this.showChartValuesInPercentage = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PieChart(
      dataMap: dataMap,
      animationDuration: animationDuration,
      chartLegendSpacing: chartLegendSpacing,
      chartRadius: MediaQuery.of(context).size.width / 1.7,
      colorList: colorList,
      legendOptions: LegendOptions(
        legendPosition: legendPosition,
      ),
      chartValuesOptions: ChartValuesOptions(
        showChartValues: showChartValues,
        showChartValuesInPercentage: showChartValuesInPercentage,
      ),
    );
  }
}
