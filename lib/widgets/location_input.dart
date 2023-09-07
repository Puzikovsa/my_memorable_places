import 'package:flutter/material.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key});

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 300,
          width: double.infinity,
          alignment: Alignment.center,
          child: _previewImageUrl == null
              ? const Text('Местоположение не выбрано')
              : Image.network(
                  _previewImageUrl!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Expanded(
          child: TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.location_on),
            label: const Text(
              'Текущее местоположение',
            ),
          ),
        ),
      ],
    );
  }
}
