import 'package:branch_select_app/widgets/choice.dart';
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
  TextEditingController txtParentNameAndSurname =new TextEditingController();
  TextEditingController txtAddress =new TextEditingController();
  TextEditingController txtPhone =new TextEditingController();
  TextEditingController txtEmail =new TextEditingController();
  var maskIdentity = new MaskTextInputFormatter(mask: '###########', filter: { "#": RegExp(r'[0-9]') });
  var maskPhone = new MaskTextInputFormatter(mask: '# (###) ### ## ##', filter: { "#": RegExp(r'[0-9]') });

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
            inputDigital(txtIdentity,"99999999999", "T.C. Kimlik No", maskIdentity),
            inputText(txtNameAndSurname, "Adı ve Soyadı", false,TextInputType.text),
            inputText(txtClass, "Sınıf ve Şubesi ", false,TextInputType.text),
            Choice(titleText:"1. Tercihiniz"),
            Choice(titleText:"2. Tercihiniz"),
            inputText(txtParentNameAndSurname, "Velinin Adı ve Soyadı ", false,TextInputType.text),
            inputText(txtAddress, "Sınıf ve Şubesi ", false,TextInputType.text),
            inputDigital(txtPhone, "0 (999) 999 99 99", "Öğrencinin Telefonu", maskPhone),
            inputText(txtEmail, "Email", false,TextInputType.emailAddress),
            showLoginButton(),
            // TextFormField(
            //   decoration: InputDecoration(labelText: 'Email'),
            //   validator: (val) => !EmailValidator.Validate(val,true)
            //       ? 'Not a valid email.'
            //       : null,
            //   onSaved: (val) => print(val),
            // ),
          ],
        ),
      ),
    );
  }

  Widget showLoginButton(){
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
      child: ElevatedButton(
        style:  ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
        child: Text("Kaydet"),
        onPressed: (){
          if(formKey.currentState!.validate()){
            print("Giriş");
          }
        },
      ),
    );
  }

}