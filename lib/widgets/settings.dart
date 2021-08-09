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
  TextEditingController txtFirstBranchName=new TextEditingController();
  TextEditingController txtSecondBranchName=new TextEditingController();
  TextEditingController txtMinClassCount=new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(2.0),
      child: Form(
        key: formKey,
        child: ListView(
          children: [
            inputText(txtSchoolName, "Okul Adı", false, TextInputType.text),
            inputText(txtBranchTeacher, "Alan Öğretmeni", false, TextInputType.text),
            inputText(txtAssistantDirector, "Müdür Yardımcısı", false, TextInputType.text),
            inputText(txtFirstBranchName, "1. Dal İsmi", false, TextInputType.text),
            inputText(txtSecondBranchName, "2. Dal İsmi", false, TextInputType.text),
            inputText(txtMinClassCount, "Minimum Öğrenci Sayısı", false, TextInputType.number),
            saveButton()
          ],
        ),
      )
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
            print("Kaydet");
          }
        },
      ),
    );
  }
}

// Widget settings(){
//   return Container(
//     padding: EdgeInsets.all(2.0),
//     child: Form(
//       child: ListView(
//         children: [
//
//         ],
//       ),
//     ),
//   );
// }