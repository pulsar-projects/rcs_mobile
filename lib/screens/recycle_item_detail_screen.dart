import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rcs_mobile/model/recycle_center_model.dart';
import 'package:rcs_mobile/model/recycled_item_model.dart';
import 'package:rcs_mobile/model/recycled_item_status_enum.dart';
import 'package:rcs_mobile/providers/recycled_items_provider.dart';
import 'package:rcs_mobile/widgets/common/index.dart';

class RecycleItemDetailScreen extends StatefulWidget {
  static const routeName = '/recycle-item-detail';

  @override
  _RecycleItemDetailScreenState createState() =>
      _RecycleItemDetailScreenState();
}

class _RecycleItemDetailScreenState extends State<RecycleItemDetailScreen> {
  final _descriptionFocusNode = FocusNode();

  final _form = GlobalKey<FormState>();
  File _pickedImage;

  void _onSelectedImage(File pickedImage) {
    _pickedImage = pickedImage;
    _editedItem = RecycledItem(
      id: _editedItem.id,
      name: _editedItem.name,
      description: _editedItem.description,
      dateTime: _editedItem.dateTime,
      image: _pickedImage,
      imagePath: _pickedImage.path,
//        final RecycleCenter recycleCenter;
//        RecycledItemStatus status;
    );
  }

  var _editedItem = RecycledItem(
    id: null,
    name: '',
    description: '',
    dateTime: null,
    image: null,
    imagePath: null,
    recycleCenter: RecycleCenter(
      id: null,
      description: '',
      longitude: null,
      latitude: null,
    ),
    status: RecycledItemStatus.DEFAULT,
  );

  var _setInitValues = {
    'id': null,
    'name': '',
    'description': '',
    'dateTime': '',
    'image': null,
    'imagePath': null,
    'recycleCenter': {
      'id': null,
      'description': '',
      'longitude': null,
      'latitude': null,
    },
    'status': RecycledItemStatus.DEFAULT.toString(),
  };

  var _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final String recycledItemId =
          ModalRoute.of(context).settings.arguments as String;
      if (recycledItemId != null) {
        _editedItem = Provider.of<RecycledItemsProvider>(context, listen: false)
            .getItemById(recycledItemId);
        _setInitValues = {
          'id': _editedItem.id,
          'name': _editedItem.name,
          'description': _editedItem.description,
          'dateTime': _editedItem.dateTime.toString(),
          'image': _editedItem.image,
          'imagePath': _editedItem.imagePath,
          'recycleCenter': {
            'id': _editedItem.recycleCenter.id,
            'description': _editedItem.recycleCenter.description,
            'longitude': _editedItem.recycleCenter.longitude,
            'latitude': _editedItem.recycleCenter.latitude,
          },
          'status': _editedItem.status,
        };
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  Future<void> _saveForm() async {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      print('is not valid');
      return;
    }
    _form.currentState.save();

    print('_editedItem.id = ' + _editedItem.id.toString());
    if (_editedItem.id != null) {
      print('update flow');
      await Provider.of<RecycledItemsProvider>(context, listen: false)
          .updateItem(_editedItem.id, _editedItem);
    } else {
      try {
        await Provider.of<RecycledItemsProvider>(context, listen: false)
            .addItem(_editedItem);
      } catch (error) {
        await showDialog<Null>(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Error'),
            content: Text(error.toString()),
            actions: <Widget>[
              FlatButton(
                child: Text('ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      }
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit your item',
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveForm,
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _form,
          child: ListView(
            children: <Widget>[
              TextFormField(
                initialValue: _setInitValues['name'],
                decoration: InputDecoration(labelText: 'Name'),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_descriptionFocusNode);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please insert an item name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedItem = RecycledItem(
                    id: _editedItem.id,
                    name: value,
                    description: _editedItem.description,
                    dateTime: _editedItem.dateTime,
                    image: _editedItem.image,
                    imagePath: _editedItem.imagePath,
                  );
                },
              ),
              TextFormField(
                initialValue: _setInitValues['description'],
                decoration: InputDecoration(labelText: 'Description'),
                textInputAction: TextInputAction.next,
//                onFieldSubmitted: (_) {
//                  FocusScope.of(context).requestFocus(_dateTimeFocusNode);
//                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please insert a description for your item';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedItem = RecycledItem(
                    id: _editedItem.id,
                    name: _editedItem.name,
                    description: value,
                    dateTime: _editedItem.dateTime,
                    image: _editedItem.image,
                    imagePath: _editedItem.imagePath,
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: TakePhoto(_onSelectedImage),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
