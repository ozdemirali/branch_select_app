

import 'package:branch_select_app/dialog/showToAlert.dart';
import 'package:branch_select_app/models/student.dart';
import 'package:branch_select_app/services/studentController.dart';
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
TextEditingController txtScore =new TextEditingController();

var maskIdentity = new MaskTextInputFormatter(mask: '###########', filter: { "#": RegExp(r'[0-9]') });
var maskPhone = new MaskTextInputFormatter(mask: '# (###) ### ## ##', filter: { "#": RegExp(r'[0-9]') });
var maskScore = new MaskTextInputFormatter(mask: '##.##', filter: { "#": RegExp(r'[0-9]') });

showToStudentChoice(BuildContext context,Student student) async{

  txtIdentity.text=student.id;
  txtNameAndSurname.text=student.nameAndSurname;
  student.firstSelect==0?txtFirstSelect.text="1":txtFirstSelect.text=student.firstSelect.toString();
  student.secondSelect==0?txtSecondSelect.text="2":txtSecondSelect.text=student.secondSelect.toString();
  txtParentNameAndSurname.text=student.parentNameAndSurname;
  txtClass.text=student.className;
  txtAddress.text=student.address;
  txtPhone.text=student.phone;
  txtEmail.text=student.email;
  txtScore.text=student.score.toString();





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
                        inputText(txtNameAndSurname, "Adı ve Soyadı", true,false,TextInputType.text),
                        inputText(txtClass, "Sınıf ve Şubesi ",true, false,TextInputType.text),
                        Choice(titleText:"1. Tercihiniz",selectValue: txtFirstSelect,),
                        Choice(titleText:"2. Tercihiniz",selectValue: txtSecondSelect,),
                        inputText(txtParentNameAndSurname, "Velinin Adı ve Soyadı ",true, false,TextInputType.text),
                        inputText(txtAddress, "Adresi ",true, false,TextInputType.text),
                        inputDigital(txtPhone, "0 (999) 999 99 99", "Öğrencinin Telefonu", maskPhone),
                        inputText(txtEmail, "Email",true, false,TextInputType.emailAddress),
                        inputDigital(txtScore, "00.00", "Puanı", maskScore),
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
                        if(formKey.currentState!.validate()){
                          // print("Giriş");
                          // print(txtFirstSelect.text);
                          var student=Student(
                              id: txtIdentity.text,
                              nameAndSurname: txtNameAndSurname.text,
                              firstSelect: int.parse(txtFirstSelect.text),
                              secondSelect: int.parse(txtSecondSelect.text),
                              choice: "",
                              parentNameAndSurname: txtParentNameAndSurname.text,
                              className: txtClass.text,
                              address: txtAddress.text,
                              phone: txtPhone.text,
                              email: txtEmail.text,
                              score: double.parse(txtScore.text));

                          if(txtFirstSelect.text==txtSecondSelect.text){
                            showToAlert(context, "Tercihleriniz aynı olamaz");
                          }else{
                            StudentController().postStudent(student);
                           // print(student.score);
                            Navigator.pop(context);
                          }
                        }


                        },
                      child: Text("Kaydet")),
                ],
              ),
            ),
          ],
        );
      });
}