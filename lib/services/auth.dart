import 'dart:convert';
import 'dart:io';
import 'package:branch_select_app/models/token.dart';
import 'package:http/io_client.dart';

abstract class BaseAuth{
  Future getToken(String userName,String password);
  //Future<void> signOut();

}

class Auth implements BaseAuth{

  Future getToken(String userName,String password) async {
    try {
      var url = Uri.parse('https://192.168.1.88:45455/token');
      print(url);
      print(userName);
      print(password);

      final ioc = new HttpClient();
      ioc.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      final http = new IOClient(ioc);
      http.post(url, body: {"userName": userName, "password": password,"grant_type":"password"}).then(
              (response) {
            print("Reponse status : ${response.statusCode}");
           // print("Response body : ${response.body}");
            var myresponse = jsonDecode(response.body);
            String token = myresponse["access_token"];
            //print(token);
            Token.accessToken=token;
            print(Token.accessToken);
          }).catchError((onError){
        print("Hata---");
        print(onError);
      });
    } catch (e) {
      print("Hata");
      print(e.toString());
    }
  }

  // Future<void> signOut() async {
  //     return null;
  // }



}