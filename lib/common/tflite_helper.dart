import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tflite/tflite.dart';

const String ssd = "SSD MobileNet";
const String yolo = "Tiny YOLOv2";

class TfliteHelper {
  static const String _model = yolo;
  List _recognitions = [];

  Future<List> _yolov2Tiny(File image) async {
    return await Tflite.detectObjectOnImage(
        path: image.path,
        model: "YOLO",
        threshold: 0.3,
        imageMean: 0.0,
        imageStd: 255.0,
        numResultsPerClass: 1);
  }

  Future<List> _ssdMobileNet(File image) async {
    return await Tflite.detectObjectOnImage(
        path: image.path, numResultsPerClass: 5);
  }

  Future<void> loadModel() async {
    Tflite.close();
    try {
      String res;
      if (_model == yolo) {
        res = await Tflite.loadModel(
          model: "assets/tflite/yolov2_tiny.tflite",
          labels: "assets/tflite/yolov2_tiny.txt",
        );
      } else {
        res = await Tflite.loadModel(
          model: "assets/tflite/ssd_mobilenet.tflite",
          labels: "assets/tflite/ssd_mobilenet.txt",
        );
      }
      print(res);
    } on PlatformException {
      print("Failed to load the model");
    }
  }

  List<Widget> renderBoxes(Size screen, double imageWidth, double imageHeight) {
    if (imageWidth == null || imageHeight == null) return [];

    double factorX = screen.width;
    double factorY = imageHeight / imageHeight * screen.width;

    Color blue = Colors.red;

    return _recognitions.map((re) {
      return Positioned(
        left: re["rect"]["x"] * factorX,
        top: re["rect"]["y"] * factorY,
        width: re["rect"]["w"] * factorX,
        height: re["rect"]["h"] * factorY,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
            color: blue,
            width: 3,
          )),
          child: Text(
            "${re["detectedClass"]} ${(re["confidenceInClass"] * 100).toStringAsFixed(0)}%",
            style: TextStyle(
              background: Paint()..color = blue,
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ),
      );
    }).toList();
  }

  Future<Map<String, dynamic>> predictImage(File image) async {
    Map<String, dynamic> _result = {
      'imageWidth': null,
      'imageHeight': null,
      'recognitions': [],
      'image': null,
    };

    if (image == null) return null;

    if (_model == yolo) {
      _recognitions = await _yolov2Tiny(image);
      print('end _yolov2Tiny');
    } else {
      _recognitions  = await _ssdMobileNet(image);
      print('end _ssdMobileNet');
    }
    _result['recognitions'] = _recognitions;

    FileImage(image)
        .resolve(ImageConfiguration())
        .addListener((ImageStreamListener((ImageInfo info, bool _) {
          print('ImageStreamListener');
          print(info.image.width.toDouble().toString());
          _result['imageWidth'] = info.image.width.toDouble();
          _result['imageHeight'] = info.image.height.toDouble();
          _result['image'] = info.image;
        })));

    return _result;
  }
}
