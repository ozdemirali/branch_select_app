import 'package:branch_select_app/models/studentChoice.dart';
import 'package:branch_select_app/models/studentChoiceStatus.dart';
import 'package:branch_select_app/services/branchController.dart';
import 'package:branch_select_app/services/studentController.dart';
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

  late Future<StudentChoiceStatus> studentChoiceStatus;
  late Map<String,double> dataMap;
  late bool status;

  List<Color> colorList = [
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    studentChoiceStatus=StudentController().getBranchStatus();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
          height: MediaQuery.of(context).size.height,
          child:FutureBuilder<StudentChoiceStatus>(
                  future: studentChoiceStatus,
                  builder: (context,snapshot){
                    if(snapshot.hasData){
                      dataMap={
                        snapshot.data!.firstBranch:snapshot.data!.firstBranchNumber.toDouble(),
                        snapshot.data!.secondBranch:snapshot.data!.secondBranchNumber.toDouble(),
                        "Seçim Yapmayanlar":(snapshot.data!.total.toDouble()-(snapshot.data!.firstBranchNumber+snapshot.data!.secondBranchNumber)),
                      };
                      if(snapshot.data!.total==(snapshot.data!.firstBranchNumber+snapshot.data!.secondBranchNumber)){
                        status=true;
                      }else{
                        status=false;
                      }
                      //return chart(dataMap,context,colorList,ChartType.disc,"",LegendPosition.bottom,false,true,false,false);
                      return
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              chart(dataMap,context,colorList,ChartType.disc,"",LegendPosition.right,false,true,false,false),
                              Padding(
                                padding: EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 2.0),
                                child: ElevatedButton(
                                  style:  ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
                                  child: Text("Sınıfları Oluştur"),
                                  onPressed:status==false?null:
                                      (){
                                    print("Kaydet");
                                    BranchController().createClasses();
                                    },
                                ),
                              ),
                            ],
                          );
                    }else if(snapshot.hasError){
                      return Text("Hata Oluştu");
                    }
                    return Text("Veriler Geliyor");
                  }),
    );
  }


}