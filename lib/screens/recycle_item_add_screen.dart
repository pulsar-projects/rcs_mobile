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

  var _recognitions = [];

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
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image == null) return;
    setState(() {
      _isLoading = true;
    });
    Size size = MediaQuery.of(context).size;

    setState(() {
      _tfliteHelper.predictImage(image).then((value) {
        _predictedImage = value;
        _recognitions = _tfliteHelper.renderBoxes(size,
            _predictedImage['imageWidth'], _predictedImage['imageHeight']);
        print(_predictedImage);
        _isLoading = _predictedImage['isLoading'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  child: ProcessedImage(),
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
