import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class ChoicesMade extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ChoicesMadeState();
  }

}

class ChoicesMadeState extends State<ChoicesMade> {

  Map<String, double> dataMap = {
    "Yazılım": 15,
    "Ağ": 3,
    "Seçim Yapmamış":2
  };
  List<Color> colorList = [
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];
   List<String> item=["A","B","C","D","E","F"];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
          child: PieChart(
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
              legendPosition: LegendPosition.right,
              showLegends: true,
              //legendShape: ,
              legendTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            chartValuesOptions: ChartValuesOptions(
              showChartValueBackground: true,
              showChartValues: true,
              showChartValuesInPercentage: true,
              showChartValuesOutside: false,
              decimalPlaces: 1,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
          child:Text("sdf"),
        ),

      ]);
  }
}
