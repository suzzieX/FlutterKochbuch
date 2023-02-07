//Alex was here
import 'package:flutter/material.dart';


import 'dart:io';

import 'package:image_picker/image_picker.dart';

import '../helper/imagepicker.dart';

class addCat extends StatefulWidget {

  @override
  _addCatState createState() => _addCatState();
}

class _addCatState extends State<addCat> {
  var _image;



  getImg(){
    Future<File> ip = imgPicker();
    ip.then((value) =>setState(() { _image = value; }));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _image == null
            ? Text('No image selected.')
            : Image.file(_image),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {getImg(); },
        child: Icon(Icons.add_a_photo),
      ),
    );

  }
}

