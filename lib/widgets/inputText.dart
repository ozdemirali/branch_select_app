import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

Widget inputText(TextEditingController textEditingController,String label,bool visibility, TextInputType type){
  return TextFormField(
    controller: textEditingController,
    obscureText: visibility,
    textCapitalization: TextCapitalization.words,
    keyboardType: type,
    decoration: InputDecoration(
      labelText: label,
    ),
    validator: (value){
      if(value==null || value.isEmpty){
        return "Bu alan boş bırakılmaz";
      }
      else if(type==TextInputType.emailAddress){
        return !EmailValidator.Validate(value,true)
            ? 'Geçerli Bir Email Giriniz.'
            : null;
      }
      return null;
    },
    textInputAction: TextInputAction.next,
  );
}