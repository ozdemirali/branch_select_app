import 'package:branch_select_app/screens/root.dart';
import 'package:branch_select_app/services/auth.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Branch Select App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home:Root(
        auth: new Auth(),
      ),
    );
  }
}

