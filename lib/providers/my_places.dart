import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_memorable_places/core/hive_helper.dart';

import '../models/place.dart';

class MyPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(String pikedTitle, File pikedImage) async {
    final newPlace =
        Place(DateTime.now().toString(), pikedTitle, null, pikedImage);
    _items.add(newPlace);
    (await HiveHelper.getDataBase<Place>('user_places')).add(newPlace);

    notifyListeners();
  }

  Future<void> fetchAndSetData()async {
    var db = await HiveHelper.getDataBase<Place>('user_places');
    _items = db.values.toList();
  }
}
