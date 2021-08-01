import 'package:branch_select_app/widgets/inputText.dart';
import 'package:branch_select_app/widgets/logo.dart';
import 'package:flutter/material.dart';


///This class is for login screen
///There are Form that two form element and Submit Button
///And there is submit method to connect home screen
class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
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
      child: inputText(txtUserName, "Kullanıcı Adı",false),
    );
  }

  Widget showPasswordInput(){
    return new Padding(
      padding:const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: inputText(txtPassword, "Şifreniz",true),
    );
  }

  Widget showLoginButton(){
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
      child: ElevatedButton(
        style:  ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
        child: Text("Giriş"),
        onPressed: (){
          if(_formKey.currentState!.validate()){
            print("Giriş");
          }
        },
      ),
    );
  }

}