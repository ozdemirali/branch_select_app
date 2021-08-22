import 'dart:convert';
import 'dart:io';

import 'package:branch_select_app/models/student.dart';
import 'package:branch_select_app/models/token.dart';
import 'package:branch_select_app/models/urlAddress.dart';
import 'package:http/io_client.dart';

class StudentController{


  Future<Student> getById(String id) async{
       try{
         var url = Uri.parse(UrlAddress().getStudentById+id);
         final ioc = new HttpClient();
         ioc.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
         final http = new IOClient(ioc);

         final response= await http.get(url,headers: {
           HttpHeaders.authorizationHeader:"Bearer "+Token.accessToken
         });
         if(response.statusCode==200){
           return Student.fromJson(jsonDecode(response.body));
         }else{
           throw Exception('Bilgileri yüklerken problem Oluştu');
         }
       }catch(e){
          print("Hata");
          print(e.toString());
          throw Exception('Bilgileri yüklerken problem Oluştu');
       }
      }

      Future postStudent(Student student) async{
          try{
            var url = Uri.parse(UrlAddress().postStudent);
            final ioc = new HttpClient();
            ioc.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
            final http = new IOClient(ioc);
            //print(student.toJson());
            print(Token.accessToken);
            print(jsonEncode(student.toJson()));

            final response= await http.post(url,headers:{
              HttpHeaders.authorizationHeader:"Bearer "+Token.accessToken,
              HttpHeaders.contentTypeHeader:"application/json"
           },body:jsonEncode(student.toJson()) );

            print(response.statusCode);
            print(response.body);

          }catch(error){

          }
      }

  // Future getByIdd(String id) async{
  //   try {
  //     print(id);
  //     var url = Uri.parse(UrlAddress().getStudentById+id);
  //     final ioc = new HttpClient();
  //     ioc.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  //     final http = new IOClient(ioc);
  //     http.get(url,headers: {
  //       HttpHeaders.authorizationHeader:"Bearer "+Token.accessToken
  //     }).then((response) {
  //       print(response.statusCode);
  //       print(jsonDecode(response.body));
  //       //print(Student.fromJson(jsonDecode(response.body)));
  //       //return Student.fromJson(jsonDecode(response.body));
  //     }).catchError((onError){
  //       print("Hata---");
  //       print(onError);
  //       //throw Exception("Failed to load album");
  //     });
  //   } catch (e) {
  //     print("Hata");
  //     print(e.toString());
  //     //throw Exception("Failed to load album");
  //   }
  // }
}