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



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     authStatus=Token.accessToken==""?AuthStatus.Not_Logged_In:AuthStatus.Logged_In;
     //print("iniint State -->"+Token.accessToken);
  }

  void loginCallback(){

      setState(() {
        authStatus=AuthStatus.Logged_In;
        //print("loginCallBack");
        //print("token --> login"+Token.accessToken);
      });
  }

  void logoutCallBack(){
    setState(() {
      authStatus=AuthStatus.Not_Logged_In;
      //print("Logout");
      Token.accessToken="";
      //print("token -->"+Token.accessToken);

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
        if(Token.userName.toLowerCase()=="admin"){
          return Admin(
            auth: widget.auth,
            logoutCallback: logoutCallBack,
          );
        }
        return Home(
          logoutCallback: logoutCallBack,
        );
        break;
      default:
        return Login(
          auth: widget.auth,
          loginCallback: loginCallback,
        );
    }
  }

}