import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class TakePhoto extends StatefulWidget {
  final Function onSelectedImage;

  TakePhoto(this.onSelectedImage);

  @override
  _TakePhotoState createState() => _TakePhotoState();
}

class _TakePhotoState extends State<TakePhoto> {
  File _storedImage;

  Future<void> _takePicture() async {
    final picker = ImagePicker();
    final imageFile = await picker.getImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    //handle case when a user opens the camera but doesn't take a picture
    //this will prevent a runtime error for when imageFile is null on path call
    if (imageFile == null) {
      return;
    }
    setState(() {
      _storedImage = File(imageFile.path);
    });
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile.path);
    final savedImage =
    await File(imageFile.path).copy('${appDir.path}/$fileName');
    widget.onSelectedImage(savedImage);
  }

  Future<void> _selectPicture() async {
    final picker = ImagePicker();
    final imageFile = await picker.getImage(
      source: ImageSource.gallery,
      maxWidth: 600,
    );
    if (imageFile == null) {
      return;
    }
    setState(() {
      _storedImage = File(imageFile.path);
    });
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile.path);
    final savedImage =
    await File(imageFile.path).copy('${appDir.path}/$fileName');
    widget.onSelectedImage(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 150,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Theme.of(context).colorScheme.onSecondary),
            borderRadius: BorderRadius.circular(10)
          ),
          child: _storedImage != null
              ? Image.file(
            _storedImage,
            fit: BoxFit.cover,
            width: double.infinity,
          )
              : Text(
            'Get a photo first please',
            textAlign: TextAlign.center,
          ),
          alignment: Alignment.center,
        ),
        SizedBox(
          width: 10,
        ),
        Column(children: <Widget>[
          Container(
            child: FlatButton.icon(
              icon: Icon(Icons.camera_alt),
              label: Text('Take Picture'),
              textColor: Theme.of(context).primaryColor,
              onPressed: _takePicture,
            ),
          ),
          Container(
            child: FlatButton.icon(
              icon: Icon(Icons.photo_library),
              label: Text('Select Picture'),
              textColor: Theme.of(context).primaryColor,
              onPressed: _selectPicture,
            ),
          )
        ],),
      ],
    );
  }
}
