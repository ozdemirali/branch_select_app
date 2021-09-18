import 'package:branch_select_app/models/token.dart';
import 'package:branch_select_app/services/auth.dart';
import 'package:branch_select_app/widgets/inputText.dart';
import 'package:branch_select_app/widgets/logo.dart';
import 'package:flutter/material.dart';

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
  late bool isLoading=false;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: Text("Dal Seçimi"),
      ),
      body: Stack(
        children: [
        showForm(),
        showCircularProgress()
        ],

      ),
    );
  }

  Widget showCircularProgress(){
    if(isLoading){
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Container(
      height: 0.0,
      width: 0.0,
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
            showErrorMessage(),
            showLoginButton(),
          ],
        ),
      ),
    );
  }

  Widget showEmailInput(){
    return new Padding(
      padding: EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
      child: inputText(txtUserName, "Kullanıcı Adı",true,false,TextInputType.text),
    );
  }

  Widget showPasswordInput(){
    return new Padding(
      padding:const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: inputText(txtPassword, "Şifreniz",true,true,TextInputType.emailAddress),
    );
  }

  Widget showLoginButton(){
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
      child: ElevatedButton(
        style:  ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
        child: Text("Giriş"),
        onPressed: () {
            if(_formKey.currentState!.validate()){
              submit();
            }
          }
      ),
    );
  }

  Widget showErrorMessage(){
    if(Token.error.length>0 && Token.error!=null){
      return new Padding(
        padding:const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
        child: new Text(
          Token.error,
          style: TextStyle(
              fontSize: 14.0,
              color: Colors.grey,
              height: 1.0,
              fontWeight: FontWeight.bold),
        ),
      );
    }else{
      return new Container(
        height: 0.0,
      );
    }
  }

  submit() async{
    setState(() {
      isLoading=true;
      //print(isLoading);
    });
    try{
      widget.auth.getToken(txtUserName.text, txtPassword.text);
      await Future.delayed(Duration(seconds: 1));
      setState(() {
        isLoading=false;
      });
      if(Token.accessToken!=""){
        //print("ttt");
        //print("--->>> "+Token.accessToken);
        widget.loginCallback();
      }
    }catch(error){
      setState(() {
        isLoading = false;
        //errorMessage=error.toString();
      });
    }
  }
}