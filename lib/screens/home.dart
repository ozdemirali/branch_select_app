import 'package:branch_select_app/widgets/inputDigital.dart';
import 'package:branch_select_app/widgets/inputText.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }
}

class HomeState extends State<Home> with SingleTickerProviderStateMixin{
  final formKey=new GlobalKey<FormState>();
  TextEditingController txtIdentity =new TextEditingController();
  TextEditingController txtNameAndSurname =new TextEditingController();
  TextEditingController txtClass =new TextEditingController();

  var maskFormatter = new MaskTextInputFormatter(mask: '###########', filter: { "#": RegExp(r'[0-9]') });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Tercihiniz"),
      ),
      body: Stack(
        children: [
          showForm(),
        ],
      ),
    ) ;
  }

  Widget showForm(){
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Form(
        key: formKey,
        child: ListView(
          shrinkWrap: true,
          children: [
            inputDigital(txtIdentity,"99999999999", "T.C. Kimlik No", maskFormatter),
            inputText(txtNameAndSurname, "Adı ve Soyadı", false),
            inputText(txtClass, "Sınıf ve Şubesi ", false)
          ],
        ),
      ),
    );
  }

}