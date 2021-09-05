import 'dart:convert';
import 'dart:io';

import 'package:branch_select_app/models/school.dart';
import 'package:branch_select_app/models/token.dart';
import 'package:branch_select_app/models/urlAddress.dart';
import 'package:http/io_client.dart';

class SchoolController{
  Future<School> get() async{
    try{
      var url=Uri.parse(UrlAddress().getSchoolInformation);
      final ioc=new HttpClient();
      ioc.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      final http = new IOClient(ioc);
      final response= await http.get(url,headers: {
        HttpHeaders.authorizationHeader:"Bearer "+Token.accessToken
      });
      if(response.statusCode==200){
          return School.fromJson(jsonDecode(response.body));
      }
      else{
        throw Exception('Bilgileri yüklerken problem Oluştu');
      }

    }catch(e){
      throw Exception('Bilgileri yüklerken problem Oluştu');
    }
  }

  Future post(School school) async{
    try{
      var url=Uri.parse(UrlAddress().postSchoolInformation);
      final ioc = new HttpClient();
      ioc.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      final http = new IOClient(ioc);
      //print(student.toJson());
      final response= await http.post(url,headers:{
        HttpHeaders.authorizationHeader:"Bearer "+Token.accessToken,
        HttpHeaders.contentTypeHeader:"application/json"
      },body:jsonEncode(school.toJson()) );

      print(response.statusCode);
      print(response.body);

    }catch(error){

    }
  }
}