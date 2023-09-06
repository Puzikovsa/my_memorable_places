import 'package:hive_flutter/hive_flutter.dart';
part 'place_location.g.dart';

@HiveType(typeId: 1)
class PlaceLocation{
  @HiveField(0)
  final double latitude;
  @HiveField(1)
  final double longitude;
  @HiveField(2)
  final String? address;

  PlaceLocation(
      this.latitude,
      this.longitude,
      this.address);
}