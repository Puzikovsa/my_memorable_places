import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_memorable_places/providers/my_place.dart';
import 'package:provider/provider.dart';

import '../widgets/image_input.dart';

class AddedPlacePage extends StatefulWidget {
  static const String rout = '/add_place';

  const AddedPlacePage({super.key});

  @override
  State<AddedPlacePage> createState() => _AddedPlacePageState();
}

class _AddedPlacePageState extends State<AddedPlacePage> {
  final _titleController = TextEditingController();

  File? _pikedImage;

  _savePlace() {
    if (_titleController.text.isEmpty || _pikedImage == null) {
      return;
    }
    Provider.of<MyPlace>(context, listen: false)
        .addPlace(_titleController.text, _pikedImage!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Новое место'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Придумайте название',
                      ),
                      controller: _titleController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const ImageInput()
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {
              _savePlace();
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.add,
              color: Colors.black,
            ),
            label: const Text(
              'Добавить',
              style: TextStyle(color: Colors.black),
            ),
            style: ElevatedButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                backgroundColor: Theme.of(context).colorScheme.secondary),
          ),
        ],
      ),
    );
  }
}
