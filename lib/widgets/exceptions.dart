import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../authentication/signup_page.dart';



String CheckImage(String image) {
  if (image == '') {
    return 'Assets/Images/no_image.jpg';
  }
  if (image.contains('data/user')) {
    return '$image';
  }
  return "Assets/Images/$image";
}

bool CheckText(String a) {
  if (a != '') return true;
  return false;
}

ImageProvider<Object> appImage(String image) {
  return image.contains('data/user')
      ? Image.file(
          File(image.toString()),
          fit: BoxFit.cover,
        ).image
      : AssetImage(CheckImage(image));
}

Future<String> getImageAndSave({required bool gallery}) async {
  // Use the image_picker package to open the device's image gallery

  final ImagePicker _picker = ImagePicker();
  final XFile? image = gallery
      ? await _picker.pickImage(source: ImageSource.gallery)
      : await _picker.pickImage(source: ImageSource.camera);

  File? file = File(image!.path);
  // Check if an image was selected
  if (file == null) {
    print('No image was selected.');
    return '';
  }

  final directory = await getApplicationDocumentsDirectory();

  final File newImageFile = File('${directory.path}/${DateTime.now()}.jpg');

  await file.copy(newImageFile.path);

  return newImageFile.path;
}

class NoItem extends StatelessWidget {
  String title;
  NoItem({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        alignment: Alignment.center,
        width: 220,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey[300],
                ),
                Container(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(height: 10, width: 80, color: Colors.grey[300]),
                    Container(height: 10),
                    Container(height: 10, width: 145, color: Colors.grey[300]),
                    Container(height: 10),
                    Container(height: 10, width: 40, color: Colors.grey[300])
                  ],
                )
              ],
            ),
            Container(height: 20),
            Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey[300],
                ),
                Container(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(height: 10, width: 80, color: Colors.grey[300]),
                    Container(height: 10),
                    Container(height: 10, width: 145, color: Colors.grey[300]),
                    Container(height: 10),
                    Container(height: 10, width: 40, color: Colors.grey[300])
                  ],
                )
              ],
            ),
            Container(height: 20),
            Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey[200],
                ),
                Container(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(height: 10, width: 100, color: Colors.grey[200]),
                    Container(height: 10),
                    Container(height: 10, width: 145, color: Colors.grey[200]),
                    Container(height: 10),
                    Container(height: 10, width: 40, color: Colors.grey[200])
                  ],
                )
              ],
            ),
            Container(height: 25),
            Text("${title} appear here",
                style:
                    MyText.subhead(context)!.copyWith(color: Colors.grey[700])),
          ],
        ),
      ),
    );
  }
}
