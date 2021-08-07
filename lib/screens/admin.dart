import 'package:branch_select_app/widgets/choicesMade.dart';
import 'package:flutter/material.dart';

class Admin extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AdminState();
  }
}

class AdminState extends State<Admin> with SingleTickerProviderStateMixin {
  static const List<Tab> myTabs = <Tab>[
    Tab(icon: Icon(Icons.home)),
    Tab(icon: Icon(Icons.list),),
    Tab(icon:Icon(Icons.settings)),
    Tab(icon: Icon(Icons.file_upload),),
  ];
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: myTabs.length,initialIndex: 0,vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Admin",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.normal)),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: myTabs,
        ),
        actions: [
          TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20,fontWeight: FontWeight.normal),
                primary: Colors.white
              ),
              // style: TextButton.styleFrom(
              //   //padding: const EdgeInsets.all(16.0),
              //   primary: Colors.white,
              //   textStyle: const TextStyle(fontSize: 20),
              // ),
              onPressed: (){print("Çıkış");},
              child: Text("Çıkış"))
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ChoicesMade(),
          Text("Anlık Dal Sayıları"),
          Text("Okul Bİligileri"),
          Text("Öğrenci Bilgileri Yükle"),
        ],
      ),
    );
  }
}