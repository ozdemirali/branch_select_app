import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

Widget inputDigital(TextEditingController textEditingController,String hinText,String label,MaskTextInputFormatter maskTextInputFormatter){
  return TextFormField(
    controller: textEditingController,
    textCapitalization: TextCapitalization.words,
    keyboardType: TextInputType.numberWithOptions(decimal: true),
    inputFormatters: [
      maskTextInputFormatter,
    ],
    decoration: InputDecoration(
      hintText: hinText,
      hintStyle: TextStyle(fontSize: 12),
      labelText: label,
    ),
    validator: (value){
      if(value==null || value.isEmpty){
        return "Bu alan boş bırakılmaz";
      }
      return null;
    },
    textInputAction: TextInputAction.next,
  );
}