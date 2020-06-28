import 'dart:io';

import 'package:flutter/material.dart';

class ProcessedImage extends StatelessWidget {
  final File imgFile;
  final recognitions;
  final Size size;

  ProcessedImage({
    this.imgFile,
    this.recognitions,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> stackChildren = <Widget>[];

    stackChildren.add(Positioned(
      top: 0.0,
      left: 0.0,
      width: size.width,
      child: imgFile == null
          ? Card(child: Text("No Image Selected"))
          : Image.file(imgFile),
    ));

    stackChildren.addAll(recognitions);

    return Stack(
      children: stackChildren,
    );
  }
}
