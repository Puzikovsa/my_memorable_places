import 'package:hive_flutter/hive_flutter.dart';
part 'place_location.g.dart';

@HiveType(typeId: 1)
class PlaceLocation{
  @HiveField(0)
  final String id;
  @HiveField(1)
  final double latitude;
  @HiveField(2)
  final double longitude;
  @HiveField(3)
  final String? address;

  PlaceLocation(
      this.id,
      this.latitude,
      this.longitude,
      this.address,
      );
}