import 'dart:convert';
import 'dart:io';
import 'package:branch_select_app/models/student.dart';
import 'package:branch_select_app/models/studentChoice.dart';
import 'package:branch_select_app/models/studentChoiceStatus.dart';
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

  Future<List<Student>> getStudentAll() async{
    try{
      var data=<Student>[];
      var url=Uri.parse(UrlAddress().getStudentAll);
      final ioc = new HttpClient();
      ioc.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      final http = new IOClient(ioc);

      final response= await http.get(url,headers: {
        HttpHeaders.authorizationHeader:"Bearer "+Token.accessToken
      });

      if(response.statusCode==200){
        var value=jsonDecode(response.body);
        value.forEach((v){
          data.add(Student.fromJson(v));
        });
        return data;
      }
      else{
        throw Exception('Bilgileri yüklerken problem Oluştu');
      }

    }catch(error){
      throw Exception(error);
    }
  }

  Future<StudentChoiceStatus> getBranchStatus() async{
      try{
        var url=Uri.parse(UrlAddress().getBranchStatus);
        final ioc = new HttpClient();
        ioc.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
        final http = new IOClient(ioc);

        final response= await http.get(url,headers: {
          HttpHeaders.authorizationHeader:"Bearer "+Token.accessToken
        });
        if(response.statusCode==200){
          //print(response.body);
          return StudentChoiceStatus.fromJson(jsonDecode(response.body));
        }else{
          throw Exception('Bilgileri yüklerken problem Oluştu');
        }
      }catch (e){
        throw Exception('Bilgileri yüklerken problem Oluştu');
      }
  }

  Future<List<StudentChoice>> getStudentChoiceResult() async{
    try{
      var data=<StudentChoice>[];
      var url=Uri.parse(UrlAddress().getStudentChoiceResult);
      final ioc = new HttpClient();
      ioc.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      final http = new IOClient(ioc);

      final response= await http.get(url,headers: {
        HttpHeaders.authorizationHeader:"Bearer "+Token.accessToken
      });

      if(response.statusCode==200){
        var value=jsonDecode(response.body);
        value.forEach((v){
          data.add(StudentChoice.fromJson(v));
        });
        return data;
      }
      else{
        throw Exception('Bilgileri yüklerken problem Oluştu');
      }

    }catch(error){
      throw Exception(error);
    }
  }

  Future postStudent(Student student) async{
          try{
            var url = Uri.parse(UrlAddress().postStudent);
            final ioc = new HttpClient();
            ioc.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
            final http = new IOClient(ioc);

            final response= await http.post(url,headers:{
              HttpHeaders.authorizationHeader:"Bearer "+Token.accessToken,
              HttpHeaders.contentTypeHeader:"application/json"
           },body:jsonEncode(student.toJson()) );

          }catch(error){

          }
  }

  Future deleteStudent(String id) async{
    try{
      var url = Uri.parse(UrlAddress().deleteStudent+id);
      final ioc = new HttpClient();
      ioc.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      final http = new IOClient(ioc);
      final response= await http.delete(url,headers: {
        HttpHeaders.authorizationHeader:"Bearer "+Token.accessToken,
      });

    } catch(error){

    }
  }

}