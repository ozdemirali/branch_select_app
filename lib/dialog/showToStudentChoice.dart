import 'package:branch_select_app/widgets/choice.dart';
import 'package:branch_select_app/widgets/inputDigital.dart';
import 'package:branch_select_app/widgets/inputText.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

final formKey = GlobalKey<FormState>();
TextEditingController txtIdentity =new TextEditingController();
TextEditingController txtNameAndSurname =new TextEditingController();
TextEditingController txtClass =new TextEditingController();
TextEditingController txtFirstSelect=new TextEditingController();
TextEditingController txtSecondSelect=new TextEditingController();
TextEditingController txtParentNameAndSurname =new TextEditingController();
TextEditingController txtAddress =new TextEditingController();
TextEditingController txtPhone =new TextEditingController();
TextEditingController txtEmail =new TextEditingController();
var maskIdentity = new MaskTextInputFormatter(mask: '###########', filter: { "#": RegExp(r'[0-9]') });
var maskPhone = new MaskTextInputFormatter(mask: '# (###) ### ## ##', filter: { "#": RegExp(r'[0-9]') });

showToStudentChoice(BuildContext context) async{
  await showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          contentPadding: EdgeInsets.only(left: 5,right: 5),
          title: Center(child: Text("Öğrenci Bilgileri"),),
          shape: RoundedRectangleBorder( borderRadius: BorderRadius.all(Radius.circular(5.0))),
          content: Container(
            height: MediaQuery.of(context).size.width,
            width: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Form(
                    key:formKey ,
                    child: Column(
                      children: [
                        inputDigital(txtIdentity,"99999999999", "T.C. Kimlik No", maskIdentity),
                        inputText(txtNameAndSurname, "Adı ve Soyadı", false,TextInputType.text),
                        inputText(txtClass, "Sınıf ve Şubesi ", false,TextInputType.text),
                        Choice(titleText:"1. Tercihiniz",selectValue: txtFirstSelect,),
                        Choice(titleText:"2. Tercihiniz",selectValue: txtSecondSelect,),
                        inputText(txtParentNameAndSurname, "Velinin Adı ve Soyadı ", false,TextInputType.text),
                        inputText(txtAddress, "Sınıf ve Şubesi ", false,TextInputType.text),
                        inputDigital(txtPhone, "0 (999) 999 99 99", "Öğrencinin Telefonu", maskPhone),
                        inputText(txtEmail, "Email", false,TextInputType.emailAddress),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          actions: [
            Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextButton(
                      style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 18,fontWeight: FontWeight.normal),
                          primary: Colors.green
                      ),
                      onPressed: (){
                        print("İptal");
                        Navigator.pop(context);
                        },
                      child: Text("İptal")),
                  TextButton(
                      style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 18,fontWeight: FontWeight.normal),
                          primary: Colors.green
                      ),
                      onPressed: (){
                        print("Kaydet");
                        Navigator.pop(context);
                        },
                      child: Text("Kaydet")),
                ],
              ),
            ),
          ],
        );
      });
}