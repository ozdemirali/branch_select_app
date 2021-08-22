import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showToAlert(BuildContext context,String error){
  // set up the button
  Widget okButton =Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ElevatedButton(
          style:  ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
          child: Text("Tamam"),
          onPressed: (){
            Navigator.pop(context);
          })
    ],
  );


  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Uyarı"),
    content: Text(error),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );

}