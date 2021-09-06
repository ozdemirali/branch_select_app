import 'package:branch_select_app/dialog/showToStudentChoice.dart';
import 'package:branch_select_app/models/branchStatus.dart';
import 'package:branch_select_app/models/studentChoice.dart';
import 'package:branch_select_app/models/studentChoiceStatus.dart';
import 'package:branch_select_app/services/studentController.dart';
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

  late Future<List<StudentChoice>> studentChoice;
  late Future<StudentChoiceStatus> studentChoiceStatus;

  late Map<String,double> dataMap;
  // Map<String, double> dataMap = {
  //   "Yazılım": 15,
  //   "Ağ": 3,
  //   "Seçim Yapmamış":2
  // };
  List<Color> colorList = [
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    studentChoice=StudentController().getStudentAll();
    studentChoiceStatus=StudentController().getBranchStatus();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //chart(dataMap,context,colorList,ChartType.disc,"",LegendPosition.right,false,true,true,false),
          FutureBuilder<StudentChoiceStatus>(
              future: studentChoiceStatus,
              builder: (context,snapshot){
                if(snapshot.hasData){
                  dataMap={
                    snapshot.data!.firstBranch:snapshot.data!.firstBranchNumber.toDouble(),
                    snapshot.data!.secondBranch:snapshot.data!.secondBranchNumber.toDouble(),
                    "Seçim Yapmamış":(snapshot.data!.total-(snapshot.data!.firstBranchNumber+snapshot.data!.secondBranchNumber)).toDouble(),
                  };
                  return  chart(dataMap,context,colorList,ChartType.disc,"",LegendPosition.right,false,true,true,false);
                  }else if(snapshot.hasError){
                  return Text("Hata Oluştu");
                }
                return Text("Grafik Bilgileri Yükleniyor");
          }),
          Expanded(
            child:FutureBuilder<List<StudentChoice>>(
              future:studentChoice,
              builder:(context,snapshot){
                if(snapshot.hasData){
                  return
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context,int position){
                        return Dismissible(
                          key: Key(snapshot.data![position].toString()),
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
                                radius: 30,
                                backgroundColor: snapshot.data![position].choice==""?Colors.red:Colors.green,
                                child: Text(snapshot.data![position].score.toString(),style:TextStyle(fontWeight: FontWeight.normal,color:Colors.white)),
                              ),
                              title: Text(snapshot.data![position].nameAndSurname),
                              // ignore: unnecessary_null_comparison
                              subtitle:snapshot.data![position].choice!=null?
                                        Text(snapshot.data![position].choice):
                                        Text("Henüz Seçim Yapmamış")  ,
                              onTap: (){
                                print("Seçildi");
                                showToStudentChoice(context);
                                // showToNotification(context,_appointedWorkplaceList[position]);
                              },
                            ),
                          ),
                        );
                      },
                    );
                }else if(snapshot.hasError){
                  return Text("Hata Oluştu");
                }
                return Text("Öğrenci Bilgileri Yükleniyor");
              }
            ),

          ),
        ],
      ),
    );
  }
}
