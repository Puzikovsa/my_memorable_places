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
  PlaceLocation? _selectedPlace;

  Future<void> _getUserLocation() async {
    final locationData = await Location().getLocation();

    if (locationData.latitude == null || locationData.longitude == null) {
      return;
    }
    _getPreviewImageUrl(locationData.latitude!, locationData.longitude!);
  }

  Future<void> _getPreviewImageUrl(double latitude, double longitude) async {
    String address = await LocationHelper.getAdressFromLocation(
      latitude: latitude,
      longitude: longitude,
    );
    PlaceLocation placeLocation = PlaceLocation('id',latitude, longitude, address);

    setState(() {
      _selectedPlace = placeLocation;
    });

    widget.onSelectedLocation(_selectedPlace!);
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
          )),
          child: _selectedPlace == null
              ? const Text('Местоположение не выбрано')
              : Image.network(
                  LocationHelper.generateLocationPreviewImage(
                      latitude: _selectedPlace!.latitude,
                      longitude: _selectedPlace!.longitude),
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
