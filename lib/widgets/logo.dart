import 'package:flutter/material.dart';

///This Widget is to show image file
/// [tag] for Hero widget,[radius] for Padding widget
/// [left],[top],[right],[bottom] for Padding widget
/// [image] for CircleAvatar widget
Widget logo(String tag,double radius,double left,double top,double right,double bottom,String image){
  return Hero(
      tag: tag,
      child: Padding(
        padding: EdgeInsets.fromLTRB(left,top, right,bottom),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: radius,
          child: Image.asset("images/"+image),
        ),
      ));
}