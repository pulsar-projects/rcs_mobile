import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rcs_mobile/common/tflite_helper.dart';

class ProcessedImage extends StatefulWidget {
  @override
  _ProcessedImageState createState() => _ProcessedImageState();
}

class _ProcessedImageState extends State<ProcessedImage> {
  TfliteHelper _tfliteHelper = TfliteHelper();

  File _image;

  double _imageWidth;

  double _imageHeight;

  List<Widget> stackChildren = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    stackChildren.add(Positioned(
      top: 0.0,
      left: 0.0,
      width: size.width,
      child: _image == null
          ? Card(child: Text("No Image Selected"))
          : Image.file(_image),
    ));

    stackChildren
        .addAll(_tfliteHelper.renderBoxes(size, _imageWidth, _imageHeight));

    return Stack(
      children: stackChildren,
    );
  }
}
