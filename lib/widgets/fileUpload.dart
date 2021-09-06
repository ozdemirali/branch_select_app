import 'dart:io';

import 'package:branch_select_app/services/schoolController.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FileUpload extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FileUploadState();
  }
}

class FileUploadState extends State<FileUpload> {









  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child:  ElevatedButton(
        style:  ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
        onPressed: () => uploadFile(),
        child: const Text("Dosya Seç"),
      ),
    );
  }

  Future uploadFile() async {

    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ["xls","xlsx"]
    );

    if(result != null) {
      File file = File(result.files.single.path);
      print("file path :"+file.path);
      //SchoolController().test(file);
      SchoolController().uploadFile(file);

    } else {
      // User canceled the picker
    }

  }


}