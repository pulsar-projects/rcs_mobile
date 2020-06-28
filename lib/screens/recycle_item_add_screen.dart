import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rcs_mobile/common/tflite_helper.dart';
import 'package:rcs_mobile/widgets/common/index.dart';

class RecycleItemAddScreen extends StatefulWidget {
  static const routeName = '/recycle-item-add';

  @override
  _RecycleItemAddScreenState createState() => _RecycleItemAddScreenState();
}

class _RecycleItemAddScreenState extends State<RecycleItemAddScreen> {
  bool _isLoading = false;
  TfliteHelper _tfliteHelper = TfliteHelper();
  var _predictedImage;

  List<Widget> _recognitions = [];

  @override
  void initState() {
    super.initState();
    _isLoading = true;

    _tfliteHelper.loadModel().then((val) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  selectFromImagePicker() async {
    final picker = ImagePicker();
    final image = await picker.getImage(
      source: ImageSource.gallery,
    );
    if (image == null) return;

    setState(() {
      print('selectFromImagePicker image.path: ' + image.path);
      _tfliteHelper.predictImage(File(image.path)).then((value) {
        print(value);
        _predictedImage = image;
        _recognitions = value['recognitions'];
        _isLoading = false;
        print(_predictedImage);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(),
      body: (_isLoading == true)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: ProcessedImage(
                    recognitions: _recognitions,
                    imgFile: _predictedImage,
                    size: size,
                  ),
                ),
                RaisedButton(
                  child: Text('Find nearest recycle centers'),
                  textColor: Colors.white,
//            onPressed: (_recognitions.length == 0)
//                ? null
//                : () {
//                    Navigator.push(
//                      context,
//                      MaterialPageRoute(
//                        builder: (context) =>
//                            RecycleCentersMap(recognitions: _recognitions),
//                      ),
//                    );
//                  },
                  color: Colors.green,
                ),
                RaisedButton(
                  child: Text('Load image from device'),
                  onPressed: selectFromImagePicker,
                  textColor: Colors.white,
                  color: Colors.green,
                ),
                RaisedButton(
                  child: Text('Take photo'),
                  onPressed: null,
                  textColor: Colors.white,
                  color: Colors.green,
                )
              ],
            ),
    );
  }
}
