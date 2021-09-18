import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

Widget inputText(TextEditingController textEditingController,String label,bool enable, bool visibility, TextInputType textInputType){
  return TextFormField(
    controller: textEditingController,
    enabled: enable,
    obscureText: visibility,
    textCapitalization: TextCapitalization.words,
    keyboardType: textInputType,
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