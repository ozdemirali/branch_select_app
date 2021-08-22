// ignore: import_of_legacy_library_into_null_safe

import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:branch_select_app/services/branchController.dart';
import 'package:branch_select_app/models/branch.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Choice extends StatefulWidget{
  Choice({required this.titleText,required this.selectValue});
  final String titleText;
  final TextEditingController selectValue;


  @override
  State<StatefulWidget> createState() {
    return ChoiceState();
  }
}

class ChoiceState extends State<Choice> {
  late Future<List<Branch>> branch;
  List<dynamic> _dataSource=[];
  



  @override
  void initState() {
    super.initState();
    branch= BranchController().getBranchAll();
    branch.then((value) {
       value.forEach((element) {
         _dataSource.add({"display":element.name,"value":element.id.toString()});
       });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder<List<Branch>>(
      future:branch,
      builder:(context,snapshot){
        if(snapshot.hasData){
          //print(snapshot.data![0].name);
          return dropdown();
        }else if(snapshot.hasError){
          return Text("snapshot.hasError");
        }
          return Text("Yükleme sırasında problem oluştu");
      }
    );
  }

  Widget dropdown(){
    return DropDownFormField(
        titleText: widget.titleText,
        hintText: 'Please choose one',
        value:widget.selectValue.text ,
        onSaved: (value) {
          setState(() {
            //_selectValue = value;
            //widget.selectValue.text=value;
            //print(value);
          });
        },
        onChanged: (value) {
          setState(() {
            widget.selectValue.text=value;
          });
        },
      dataSource: _dataSource,
        textField: 'display',
        valueField: 'value',
      );
  }


}