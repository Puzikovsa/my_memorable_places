import 'package:flutter/material.dart';
import 'package:location/location.dart';

import '../core/location_helper.dart';
import '../models/place_location.dart';

class LocationInput extends StatefulWidget {
  final Function(PlaceLocation) onSelectedLocation;
  const LocationInput({super.key, required this.onSelectedLocation});

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImageUrl;

  Future<void> _getUserLocation()async {
    final locationData = await Location().getLocation();

    if(locationData.latitude == null || locationData.longitude == null){
      return;
    }
    _getPreviewImageUrl(locationData.latitude!, locationData.longitude!);
  }

  Future<void> _getPreviewImageUrl(
      double latitude,
      double longitude) async {

    setState(() {
      _previewImageUrl = LocationHelper.generateLocationPreviewImage(
          latitude: latitude,
          longitude: longitude);
    });

    widget.onSelectedLocation(
        PlaceLocation(latitude, longitude, null),
    );
}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 300,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            )
          ),
          child: _previewImageUrl == null
              ? const Text('Местоположение не выбрано')
              : Image.network(
                  _previewImageUrl!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextButton.icon(
          onPressed: _getUserLocation,
          icon: const Icon(Icons.location_on),
          label: const Text(
            'Установить текущее местоположение',
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
