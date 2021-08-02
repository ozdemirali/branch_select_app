import 'package:flutter/material.dart';

Widget inputText(TextEditingController textEditingController,String label,bool visibility){
  return TextFormField(
    controller: textEditingController,
    obscureText: visibility,
    textCapitalization: TextCapitalization.words,
    keyboardType: TextInputType.text,
    decoration: InputDecoration(
      labelText: label,

    ),
    validator: (value){
      print(value);
      if(value==null || value.isEmpty){
        return "Bu alan boş bırakılmaz";
      }
      return null;
    },
    textInputAction: TextInputAction.next,
  );
}