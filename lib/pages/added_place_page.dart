import 'package:flutter/material.dart';

class AddedPlacePage extends StatelessWidget{
  static const String rout = '/add_place';

  const AddedPlacePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Новое место'),
      ),
    );
  }

}