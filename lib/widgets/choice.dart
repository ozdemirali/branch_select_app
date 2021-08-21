// ignore: import_of_legacy_library_into_null_safe
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:branch_select_app/services/branchController.dart';
import 'package:branch_select_app/models/branch.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Choice extends StatefulWidget{
  Choice({required this.titleText});
  final String titleText;


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    print("tttt");
    return ChoiceState();
  }
}

class ChoiceState extends State<Choice> {
  String _myActivity="Running";
  String _myActivityResult="";
  late Future<List<Branch>> branch;




  @override
  void initState() {
    super.initState();
    branch= BranchController().getBranchAll();
    print("Branch");
    //_myActivity = '';
    //_myActivityResult = '';
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder<List<Branch>>(
      future:branch,
      builder:(context,snapshot){
        if(snapshot.hasData){
          //print(snapshot.data![0].name);
          return Text(snapshot.data![0].name);
        }else if(snapshot.hasError){
          return Text("snapshot.hasError");
        }
          return Text("ss");
      }
    );
    // return DropDownFormField(
    //     titleText: widget.titleText,
    //     hintText: 'Please choose one',
    //     value: _myActivity,
    //     onSaved: (value) {
    //       setState(() {
    //         _myActivity = value;
    //       });
    //     },
    //     onChanged: (value) {
    //       setState(() {
    //         _myActivity = value;
    //       });
    //     },
    //     dataSource: [
    //       {
    //         "display": "Running",
    //         "value": "Running",
    //       },
    //       {
    //         "display": "Climbing",
    //         "value": "Climbing",
    //       },
    //       {
    //         "display": "Walking",
    //         "value": "Walking",
    //       },
    //       {
    //         "display": "Swimming",
    //         "value": "Swimming",
    //       },
    //       {
    //         "display": "Soccer Practice",
    //         "value": "Soccer Practice",
    //       },
    //       {
    //         "display": "Baseball Practice",
    //         "value": "Baseball Practice",
    //       },
    //       {
    //         "display": "Football Practice",
    //         "value": "Football Practice",
    //       },
    //     ],
    //     textField: 'display',
    //     valueField: 'value',
    //   );


    //   DropDownFormField(
    //   titleText: '1. Tercihiniz',
    //   hintText: 'Please choose one',
    //   value: _myActivity,
    //   onSaved: (value) {
    //     setState(() {
    //       _myActivity = value;
    //     });
    //   },
    //   onChanged: (value) {
    //     setState(() {
    //       _myActivity = value;
    //     });
    //   },
    //   dataSource: [
    //     {
    //       "display": "Running",
    //       "value": "Running",
    //     },
    //     {
    //       "display": "Climbing",
    //       "value": "Climbing",
    //     },
    //     {
    //       "display": "Walking",
    //       "value": "Walking",
    //     },
    //     {
    //       "display": "Swimming",
    //       "value": "Swimming",
    //     },
    //     {
    //       "display": "Soccer Practice",
    //       "value": "Soccer Practice",
    //     },
    //     {
    //       "display": "Baseball Practice",
    //       "value": "Baseball Practice",
    //     },
    //     {
    //       "display": "Football Practice",
    //       "value": "Football Practice",
    //     },
    //   ],
    //   textField: 'display',
    //   valueField: 'value',
    // );
    //   DropdownButtonFormField<String>(
    //   value: _myActivity,
    //   items: ["1", "2", "3", "4", "5"]
    //       .map((label) => DropdownMenuItem(
    //     child: Text(label.toString()),
    //     value: label,
    //   ))
    //       .toList(),
    //   hint: Text('Rating'),
    //   onChanged: (value) {
    //     setState(() {
    //       print(value);
    //       //_myActivity = int.parse(value);
    //     });
    //   },
    // );
  }
  
}