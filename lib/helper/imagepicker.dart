import 'dart:io';

import 'package:image_picker/image_picker.dart';

Future<File>imgPicker() async{
  late File _image ;
  final ImagePicker _picker = ImagePicker();
  final XFile? photo = await _picker.pickImage(source: ImageSource.gallery);
  if(photo!=null) _image  = File(photo.path);

  return Future<File>.value(_image);

}
