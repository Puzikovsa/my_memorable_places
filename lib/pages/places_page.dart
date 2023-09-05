import 'package:flutter/material.dart';
import 'package:my_memorable_places/pages/added_place_page.dart';

class PlacesPage extends StatelessWidget{
  const PlacesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Памятные места'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, AddedPlacePage.rout);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: const Center(
          child: Text('Приложение в разработке'),
      ),
    );
  }
}