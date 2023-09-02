import 'package:flutter/material.dart';

class PlacesPage extends StatelessWidget{
  const PlacesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Памятные места'),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add))
        ],
      ),
      body: const Center(
          child: CircularProgressIndicator(),
      ),
    );
  }
}