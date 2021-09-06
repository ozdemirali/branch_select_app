import 'package:branch_select_app/models/school.dart';
import 'package:branch_select_app/services/schoolController.dart';
import 'package:branch_select_app/widgets/inputText.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SettingsState();
  }
}

class SettingsState extends State<Settings> {
  final formKey=new GlobalKey<FormState>();
  TextEditingController txtSchoolName=new TextEditingController();
  TextEditingController txtBranchTeacher=new TextEditingController();
  TextEditingController txtAssistantDirector=new TextEditingController();
  TextEditingController txtFirstBranch=new TextEditingController();
  TextEditingController txtSecondBranch=new TextEditingController();
  TextEditingController txtMinClassCount=new TextEditingController();
  late Future<School> school;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    school=SchoolController().get();
    //print("initState");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //print(MediaQuery.of(context).size.height);
    return Stack(
      children: [
            FutureBuilder<School>(
              future: school,
              builder: (context,snapshot){
                if(snapshot.hasData){
                  txtSchoolName.text=snapshot.data!.schoolName;
                  txtBranchTeacher.text=snapshot.data!.branchTeacher;
                  txtAssistantDirector.text=snapshot.data!.assistantDirector;
                  txtFirstBranch.text=snapshot.data!.firstBranch;
                  txtSecondBranch.text=snapshot.data!.secondBranch;
                  txtMinClassCount.text=snapshot.data!.minClassCount.toString();
                  return showForm();
                }else if(snapshot.hasError){
                  return Center(
                    child: Text("Hata Oluştu"),
                  );
                }
                return Center(
                  child: const CircularProgressIndicator(),
                );
              },
            ),
      ],
    );

  }

  Widget showForm(){
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Form(
        key: formKey,
        child: ListView(
          shrinkWrap: true,
          children: [
            inputText(txtSchoolName, "Okul Adı", false, TextInputType.text),
            inputText(txtBranchTeacher, "Alan Öğretmeni", false, TextInputType.text),
            inputText(txtAssistantDirector, "Müdür Yardımcısı", false, TextInputType.text),
            inputText(txtFirstBranch, "1. Dal İsmi", false, TextInputType.text),
            inputText(txtSecondBranch, "2. Dal İsmi", false, TextInputType.text),
            inputText(txtMinClassCount, "Minimum Öğrenci Sayısı", false, TextInputType.number),
            saveButton(),
          ],
        ),
      ) ,
    );



  }

  Widget saveButton(){
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
      child: ElevatedButton(
        style:  ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
        child: Text("Kaydet"),
        onPressed: (){
          if(formKey.currentState!.validate()){
           var school=School(               schoolName:txtSchoolName.text,
               branchTeacher:txtBranchTeacher.text,
               assistantDirector:txtAssistantDirector.text,
               firstBranch: txtFirstBranch.text,
               secondBranch: txtSecondBranch.text,
               minClassCount:int.parse(txtMinClassCount.text));

           //print(txtSchoolName.text);
           //print(school.schoolName);
           SchoolController().post(school);
          }
        },
      ),
    );
  }
}

