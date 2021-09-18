import 'package:branch_select_app/dialog/showToAlert.dart';
import 'package:branch_select_app/models/student.dart';
import 'package:branch_select_app/models/token.dart';
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
  TextEditingController txtFirstSelect=new TextEditingController();
  TextEditingController txtSecondSelect=new TextEditingController();
  TextEditingController txtChoice=new TextEditingController();
  TextEditingController txtParentNameAndSurname =new TextEditingController();
  TextEditingController txtAddress =new TextEditingController();
  TextEditingController txtPhone =new TextEditingController();
  TextEditingController txtEmail =new TextEditingController();
  var maskIdentity = new MaskTextInputFormatter(mask: '###########', filter: { "#": RegExp(r'[0-9]') });
  var maskPhone = new MaskTextInputFormatter(mask: '# (###) ### ## ##', filter: { "#": RegExp(r'[0-9]') });
  late Future<Student> student;
  late double score;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    student= StudentController().getById(Token.userName);
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
              future: student,
              builder: (context,snapshot){
                if(snapshot.hasData){
                  txtIdentity.text=snapshot.data!.id==""?Token.userName:snapshot.data!.id;
                  txtNameAndSurname.text=snapshot.data!.nameAndSurname;
                  txtClass.text=snapshot.data!.className;
                  txtFirstSelect.text=snapshot.data!.firstSelect==0?"1":snapshot.data!.firstSelect.toString();
                  txtSecondSelect.text=snapshot.data!.secondSelect==0?"1":snapshot.data!.secondSelect.toString();
                  txtChoice.text=snapshot.data!.choice;
                  txtParentNameAndSurname.text=snapshot.data!.parentNameAndSurname;
                  txtAddress.text=snapshot.data!.address;
                  txtPhone.text= snapshot.data!.phone;
                  txtEmail.text=snapshot.data!.email;
                  score=snapshot.data!.score;
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
            //inputDigital(txtIdentity,"99999999999", "T.C. Kimlik No", maskIdentity),
            inputText(txtNameAndSurname, "Adı ve Soyadı", true,false,TextInputType.text),
            inputText(txtClass, "Sınıf ve Şubesi ",true, false,TextInputType.text),
            Choice(titleText:"1. Tercihiniz",selectValue: txtFirstSelect,),
            Choice(titleText:"2. Tercihiniz",selectValue: txtSecondSelect,),
            inputText(txtParentNameAndSurname, "Velinin Adı ve Soyadı ",true, false,TextInputType.text),
            inputText(txtAddress, "Adresi ",true, false,TextInputType.text),
            inputDigital(txtPhone, "0 (999) 999 99 99", "Öğrencinin Telefonu", maskPhone),
            inputText(txtEmail, "Email", true,false,TextInputType.emailAddress),
            txtChoice.text.isEmpty?Text(""):inputText(txtChoice, "Sonuc", false,false,TextInputType.text),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                showLogoutButton(),
                showScoreButton(),
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
      padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
      child: ElevatedButton(
        style:  ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
        child: Text("Çıkış"),
        onPressed: (){
          widget.logoutCallback();
        },
      ),
    );
  }

  Widget showScoreButton(){
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
      child: ElevatedButton(
        style:  ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
        child: Text("Puanınız "+score.toString()),
        onPressed: null,
      ),
    );
  }


  Widget showSaveButton(){
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
      child: ElevatedButton(
        style:  ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
        child: Text("Kaydet"),
        onPressed:txtChoice.text.isEmpty?(){
          //BranchController().getBranchAll();
          //print(txtFirstSelect.text);
          if(formKey.currentState!.validate()){
            // print("Giriş");
            // print(txtFirstSelect.text);
            var student=Student(
                id: txtIdentity.text,
                nameAndSurname: txtNameAndSurname.text,
                firstSelect: int.parse(txtFirstSelect.text),
                secondSelect: int.parse(txtSecondSelect.text),
                choice: txtChoice.text,
                parentNameAndSurname: txtParentNameAndSurname.text,
                className: txtClass.text,
                address: txtAddress.text,
                phone: txtPhone.text,
                email: txtEmail.text,
                score: score,
                isDeleted: false);

            if(txtFirstSelect.text==txtSecondSelect.text){
              showToAlert(context, "Tercihleriniz aynı olamaz");
            }else{
              StudentController().postStudent(student);
            }
          }
        }:null,
      ),
    );
  }

}