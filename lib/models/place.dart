import 'dart:io';

import 'package:my_memorable_places/models/place_location.dart';

class Place{

  final String id;
  final String title;
  final PlaceLocation location;
  final File image;

  Place(
      this.id,
      this.title,
      this.location,
      this.image);
}