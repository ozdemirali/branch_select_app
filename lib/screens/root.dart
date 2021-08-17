import 'package:branch_select_app/models/token.dart';
import 'package:flutter/material.dart';
import 'package:branch_select_app/services/auth.dart';

import 'home.dart';
import 'login.dart';
import 'admin.dart';

enum AuthStatus{
  Not_Logged_In,
  Logged_In,
}

class Root extends StatefulWidget{
  Root({required this.auth});

  final BaseAuth auth;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RootState();
  }

}

class RootState extends State<Root> {
  AuthStatus authStatus=AuthStatus.Not_Logged_In;
  String token="";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     authStatus=token==""?AuthStatus.Not_Logged_In:AuthStatus.Logged_In;
     print(Token.accessToken);
  }

  void loginCallback(){

      setState(() {
        authStatus=AuthStatus.Logged_In;
        print("loginCallBack");
        print(Token.accessToken);
      });
  }

  void logoutCallBack(){
    setState(() {
      authStatus=AuthStatus.Not_Logged_In;

      token="";
      print(Token.accessToken);
      print("Logout");
    });
  }

  @override
  Widget build(BuildContext context) {
    switch(authStatus){
      case AuthStatus.Not_Logged_In:
        return Login(
          auth:widget.auth,
          loginCallback:loginCallback,
        );
        break;
      case AuthStatus.Logged_In:
        if(true){
          return Admin(
            auth: widget.auth,
            logoutCallback: logoutCallBack,
          );
        }
        return Home();
        break;
      default:
        return Login(
          auth: widget.auth,
          loginCallback: loginCallback,
        );
    }
  }

}