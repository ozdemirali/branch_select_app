import 'dart:convert';
import 'dart:io';

import 'package:branch_select_app/models/branch.dart';
import 'package:branch_select_app/models/token.dart';
import 'package:branch_select_app/models/urlAddress.dart';
import 'package:http/io_client.dart';

class BranchController{
  Future<List<Branch>> getBranchAll() async{
    try{
      var data=<Branch>[];
      var url = Uri.parse(UrlAddress().getBranchAll);
      final ioc = new HttpClient();
      ioc.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      final http = new IOClient(ioc);

      final response= await http.get(url,headers: {
        HttpHeaders.authorizationHeader:"Bearer "+Token.accessToken
      });
      //print(response.statusCode);
      if(response.statusCode==200){
        var value=jsonDecode(response.body);
        value.forEach((v){
          //print(v["Id"]);
          data.add(Branch.fromJson(v));
        });
        return data;
      }else{
        throw Exception('Bilgileri yüklerken problem Oluştu');
      }
    }catch(error){
      throw Exception(error);
    }
  }
}