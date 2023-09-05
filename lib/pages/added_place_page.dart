import 'package:flutter/material.dart';

import '../widgets/image_input.dart';

class AddedPlacePage extends StatelessWidget {
  static const String rout = '/add_place';
  final _titleController = TextEditingController();

  AddedPlacePage({super.key});

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
              Navigator.pop(context);
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
