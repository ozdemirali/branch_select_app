import 'dart:convert';
import 'dart:io';
import 'package:branch_select_app/models/token.dart';
import 'package:branch_select_app/models/urlAddress.dart';
import 'package:http/io_client.dart';

///This class is created to check [username] and [password] from Database
///And login to Home and Admin screen page
///There is one method which called getToken
abstract class BaseAuth{
  Future getToken(String userName,String password);
}

class Auth implements BaseAuth{

  //This method has to parameter(userName and password)
  //and certificate is used to get data from https web api
  Future getToken(String userName,String password) async {
    try {
      Token.error="";
      var url = Uri.parse(UrlAddress().token);
      final ioc = new HttpClient();
      ioc.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      final http = new IOClient(ioc);
      http.post(url, body: {"userName": userName, "password": password,"grant_type":"password"}).then(
              (response) {
            var myResponse = jsonDecode(response.body);
            if(response.statusCode==200){
              Token.accessToken=myResponse["access_token"];
              //Token.userName=userName;

              http.get(Uri.parse(UrlAddress().getRole+userName),
                  headers: { HttpHeaders.authorizationHeader:"Bearer "+Token.accessToken}).then(
                      (response){
                        if(response.statusCode==200){
                          //print(jsonDecode(response.body)["role"]);
                          Token.userName=jsonDecode(response.body)["id"];
                          Token.role=jsonDecode(response.body)["role"];
                        }
                      });
            }
            if(response.statusCode==400){
              Token.error=myResponse["error_description"];
            }
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