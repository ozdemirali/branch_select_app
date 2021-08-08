import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

Widget chart(Map<String, double> dataMap,BuildContext context,
    List<Color> colorList, ChartType chartType, String centerText,LegendPosition legendPosition,
    bool showChartValueBackground, bool showChartValues,
    bool showChartValuesInPercentage, bool showChartValuesOutside ){
  return PieChart(
    dataMap: dataMap,
    animationDuration: Duration(milliseconds: 800),
    chartLegendSpacing: 32,
    chartRadius: MediaQuery.of(context).size.width / 3.2,
    colorList: colorList,
    initialAngleInDegree: 0,
    chartType: ChartType.disc,
    ringStrokeWidth: 32,
    centerText: "",
    legendOptions: LegendOptions(
      showLegendsInRow: false,
      legendPosition: legendPosition,
      showLegends: true,
      //legendShape: ,
      legendTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
    chartValuesOptions: ChartValuesOptions(
      showChartValueBackground: showChartValueBackground,
      showChartValues: showChartValues,
      showChartValuesInPercentage: showChartValuesInPercentage,
      showChartValuesOutside: showChartValuesOutside,
      decimalPlaces: 1,
    ),
  );

}