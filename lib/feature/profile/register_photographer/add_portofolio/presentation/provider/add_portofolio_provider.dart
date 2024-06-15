import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPortofolioProvider extends ChangeNotifier {
  final List<File> _images = [];
  final picker = ImagePicker();

  List<File> get images => _images;

  Future<void> pickImage() async {
    final pickedFile = await picker.pickMultiImage();

    if (pickedFile != null) {
      _images.addAll(pickedFile.map((e) => File(e.path)));
      notifyListeners();
    } else {
      print('No image selected.');
    }
  }

  void removeImage(int index) {
    if (index >= 0 && index < _images.length) {
      _images.removeAt(index);
      notifyListeners();
    }
  }
}
