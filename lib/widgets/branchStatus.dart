import 'package:branch_select_app/widgets/chart.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class BranchStatus extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BranchStatusState();
  }
}

class BranchStatusState extends State<BranchStatus> {

  Map<String, double> dataMap = {
    "Yazılım": 15,
    "Ağ": 3,
  };
  List<Color> colorList = [
    Colors.blue,
    Colors.yellow,
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          chart(dataMap,context,colorList,ChartType.disc,"",LegendPosition.bottom,false,true,false,false),
          Padding(
            padding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
            child: ElevatedButton(
              style:  ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
              child: Text("Sınıfları Oluştur"),
              onPressed: (){
               print("Kaydet");
              },
            ),
          ),
        ],
      ),
    );
  }
}