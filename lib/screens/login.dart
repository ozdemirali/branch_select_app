import 'dart:convert';

import 'package:branch_select_app/models/token.dart';
import 'package:branch_select_app/services/auth.dart';
import 'package:branch_select_app/widgets/inputText.dart';
import 'package:branch_select_app/widgets/logo.dart';
import 'package:branch_select_app/screens/root.dart' as root;
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'dart:io';

///This class is for login screen
///There are Form that two form element and Submit Button
///And there is submit method to connect home screen
class Login extends StatefulWidget{
  Login({required this.auth,required this.loginCallback});

  final BaseAuth auth;
  final VoidCallback loginCallback;
  @override
  State<StatefulWidget> createState() {


    return LoginState();
  }
}

class LoginState  extends State<Login>{
  TextEditingController txtUserName=new TextEditingController();
  TextEditingController txtPassword=new TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: Text("Dal Seçimi"),
      ),
      body: Stack(
        children: [
        showForm()
        ],

      ),
    );
  }


  Widget showForm(){
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: new ListView(
          shrinkWrap: true,
          children: [
            logo("Dal Seçim Logosu",60,0,50,0,0,"logo.png"),
            showEmailInput(),
            showPasswordInput(),
            showLoginButton(),
          ],
        ),
      ),
    );
  }

  Widget showEmailInput(){
    return new Padding(
      padding: EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
      child: inputText(txtUserName, "Kullanıcı Adı",false,TextInputType.text),
    );
  }

  Widget showPasswordInput(){
    return new Padding(
      padding:const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: inputText(txtPassword, "Şifreniz",true,TextInputType.emailAddress),
    );
  }

  Widget showLoginButton(){
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
      child: ElevatedButton(
        style:  ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
        child: Text("Giriş"),
        onPressed: () async {
            if(_formKey.currentState!.validate()){
              String token;
              widget.auth.getToken(txtUserName.text, txtPassword.text);
              await Future.delayed(Duration(seconds: 1));

              if(Token.accessToken!=""){
                //print("ttt");
                print("--->>> "+Token.accessToken);
                widget.loginCallback();
              }

              //print(token);
              //widget.loginCallback();

            }
          }
      ),
    );
  }

  getToken() async{
    var url = Uri.parse('https://192.168.1.88:45455/token');
    print(url);
    var response = await http.post(url, body: {'userName': "Admin", 'password': "123456"})
        .then((value) {
          print(value.statusCode);
          print(value.body);
    }).catchError((e){
      print(e.toString());
    });
    // var response=await http
    //     .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

    //print('Response status: ${response.statusCode}');
    //print('Response body: ${response.body}');
  }


  Future getAccessToken() async {
    try {
      var url = Uri.parse('https://192.168.1.88:45455/token');
      print(url);
      final ioc = new HttpClient();
      ioc.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      final http = new IOClient(ioc);
      http.post(url, body: {"userName": "Admin", "password": "123456","grant_type":"password"}).then(
              (response) {
            print("Reponse status : ${response.statusCode}");
            print("Response body : ${response.body}");
            var myresponse = jsonDecode(response.body);
            String token = myresponse["token"];
          }).catchError((onError){
            print("Hata---");
            print(onError);
      });
    } catch (e) {
      print("Hata");
      print(e.toString());
    }
  }



}