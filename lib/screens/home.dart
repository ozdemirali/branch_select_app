import 'package:branch_select_app/models/student.dart';
import 'package:branch_select_app/models/token.dart';
import 'package:branch_select_app/services/branchController.dart';
import 'package:branch_select_app/services/studentController.dart';
import 'package:branch_select_app/widgets/choice.dart';
import 'package:branch_select_app/widgets/inputDigital.dart';
import 'package:branch_select_app/widgets/inputText.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Home extends StatefulWidget{
 Home({required this.logoutCallback});
  final VoidCallback logoutCallback;

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
  late Future<Student> _student;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _student= StudentController().getById(Token.userName);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(Token.userName),
      ),
      body: Stack(
        children: [
          FutureBuilder<Student>(
              future: _student,
              builder: (context,snapshot){
                if(snapshot.hasData){
                  txtIdentity.text=snapshot.data!.id;
                  txtNameAndSurname.text=snapshot.data!.nameAndSurname;
                  txtClass.text=snapshot.data!.className;
                  txtParentNameAndSurname.text=snapshot.data!.parentNameAndSurname;
                  txtAddress.text=snapshot.data!.address;
                  txtPhone.text= snapshot.data!.phone;
                  txtEmail.text=snapshot.data!.email;
                  return showForm();
                }else if(snapshot.hasError){
                  return Center(
                    child:const CircularProgressIndicator(),
                  );
                }
                return Center(
                  child: const CircularProgressIndicator(),
                );
              }),

          //showForm(),
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
            inputText(txtAddress, "Adresi ", false,TextInputType.text),
            inputDigital(txtPhone, "0 (999) 999 99 99", "Öğrencinin Telefonu", maskPhone),
            inputText(txtEmail, "Email", false,TextInputType.emailAddress),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                showLogoutButton(),
                showSaveButton()
              ],
            ),
            //showSaveButton(),
          ],
        ),
      ),
    );
  }

  Widget showLogoutButton(){
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
      child: ElevatedButton(
        style:  ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
        child: Text("Çıkış"),
        onPressed: (){
          widget.logoutCallback();
        },
      ),
    );
  }

  Widget showSaveButton(){
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
      child: ElevatedButton(
        style:  ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
        child: Text("Kaydet"),
        onPressed: (){
          BranchController().getBranchAll();
          if(formKey.currentState!.validate()){
            print("Giriş");
          }
        },
      ),
    );
  }

}