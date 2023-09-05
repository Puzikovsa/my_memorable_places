import 'dart:io';

import 'package:flutter/material.dart';

import '../models/place.dart';

class MyPlace with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(String pikedTitle, File pikedImage) {
    final newPlace =
        Place(DateTime.now().toString(), pikedTitle, null, pikedImage);
  }
}
