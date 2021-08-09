import 'package:branch_select_app/dialog/showToStudentChoice.dart';
import 'package:branch_select_app/widgets/chart.dart';
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
   List<String> item=["A","B","C","D","E","F","H","I","J","K"];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          chart(dataMap,context,colorList,ChartType.disc,"",LegendPosition.right,false,true,true,false),
          Expanded(
            child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: item.length,
                  itemBuilder: (BuildContext context,int position){
                   return Dismissible(
                     key: Key(item[position]),
                     onDismissed:(direction) async{
                       print("silindi");
                     },
                     secondaryBackground:Container(
                       child: Center(
                         child: Text("Sil",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.white),),
                       ),
                       color: Colors.red,
                     ),
                     background: Container(),
                     child: Card(
                       color: Colors.white,
                       elevation: 2.0,
                       child: ListTile(
                         leading: CircleAvatar(
                           //backgroundColor: _appointedWorkplaceList[position].type=="Alan Dışı"?Colors.red:Colors.blue,
                           child: Text("9,2"),
                         ),
                         title: Text(item[position]),
                         subtitle: Text(item[position]),
                         onTap: (){
                           print("Seçildi");
                           showToStudentChoice(context);
                           // showToNotification(context,_appointedWorkplaceList[position]);
                         },
                       ),
                     ),
                   );
                },
              ),
          ),
        ],
      ),
    );
  }
}
