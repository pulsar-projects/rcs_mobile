import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rcs_mobile/common/tflite_helper.dart';
import 'package:rcs_mobile/model/recycled_item_model.dart';
import 'package:rcs_mobile/model/recycle_center_model.dart';
import 'package:rcs_mobile/screens/recycle_centers.dart';
import 'package:rcs_mobile/widgets/common/index.dart';
import 'package:rcs_mobile/providers/recycled_items_provider.dart';
import 'package:provider/provider.dart';

class RecycleItemAddScreen extends StatefulWidget {
  static const routeName = '/recycle-item-add';

  @override
  _RecycleItemAddScreenState createState() => _RecycleItemAddScreenState();
}

class _RecycleItemAddScreenState extends State<RecycleItemAddScreen> {
  bool _isLoading = false;
  TfliteHelper _tfliteHelper = TfliteHelper();
  File _predictedImage;

  List _recognitions = [];
  RecycleCenter _recycleCenter;
  List<Widget> _renderBoxes = [];

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
    final imagePicker = await picker.getImage(
      source: ImageSource.gallery,
    );
    if (imagePicker == null) return;
    final imageFile = File(imagePicker.path);

    print('selectFromImagePicker image.path: ' + imageFile.path);
    var results = await _tfliteHelper.predictImage(imageFile);

    setState(() {
      _predictedImage = imageFile;
      _isLoading = false;
      _recognitions = results['recognitions'];
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    _renderBoxes = _tfliteHelper.renderBoxes(size, size.width, size.height);

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
                    imgFile: _predictedImage,
                    renderBoxes: _renderBoxes,
                    size: size,
                  ),
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
                ),
                RaisedButton(
                  child: Text('Find nearest recycle centers'),
                  textColor: Colors.white,
                  onPressed: (_recognitions.length == 0)
                      ? null
                      : () async {
                    var rc = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              RecycleCentersMap(recognitions: _recognitions)
                      ),
                    );

                    setState(() {
                      _recycleCenter = rc;
                    });
                  },
                  color: Colors.green,
                ),
                RaisedButton(
                  child: Text('Save'),
                  onPressed: (_recognitions == null || _recognitions.length == 0 || _recycleCenter == null) ? null : () async {
                    RecycledItem newItem = new RecycledItem(
                        id: DateTime.now().toIso8601String(),
                        name: _recognitions[0]['detectedClass'],
                        description: _recognitions[0]['detectedClass'],
                        recycleCenter: _recycleCenter,
                        dateTime: DateTime.now(),
                        image: _predictedImage,
                        imagePath: _predictedImage.path,
                    );

                    await Provider.of<RecycledItemsProvider>(context, listen: false)
                        .addItem(newItem);

                    Navigator.pop(context);

                  },
                  textColor: Colors.white,
                  color: Colors.green,
                )
              ],
            ),
    );
  }
}
