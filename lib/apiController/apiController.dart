import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:practice_hive4/apiController/apiModel.dart';
import 'package:http/http.dart' as http;

class ApiController extends ChangeNotifier {
  List<ApiNoteModel> apiList = [];

  Future<List<ApiNoteModel>> getData() async {
    http.Response response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        apiList.add(ApiNoteModel.fromJson(i));
      }
      return apiList;
    } else {
      return apiList;
    }
  }

  /// image url update

  String _imageUrl = 'Select Image';
  String get imageUrl => _imageUrl;

  chaneUrl(String val) {
    _imageUrl = val;
    notifyListeners();
  }

//// Image source

  File? _imgPath;
  File? get imgPath => _imgPath;

  Future<void> imagePicker() async {
    final _pickImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (_pickImage != null) {
      _imgPath = File(_pickImage.path);
      _imageUrl = _imgPath.toString();
      notifyListeners();
    }
  }
}
