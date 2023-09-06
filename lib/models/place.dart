import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_memorable_places/models/place_location.dart';
part 'place.g.dart';

@HiveType(typeId: 0)
class Place{
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final PlaceLocation? location;
  @HiveField(3)
  final File image;

  Place(
      this.id,
      this.title,
      this.location,
      this.image);
}