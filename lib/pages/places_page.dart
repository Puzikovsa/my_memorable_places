import 'package:flutter/material.dart';
import 'package:my_memorable_places/pages/added_place_page.dart';
import 'package:my_memorable_places/providers/my_places.dart';
import 'package:provider/provider.dart';

import '../models/place.dart';

class PlacesPage extends StatelessWidget {
  const PlacesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Памятные места'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AddedPlacePage.rout);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: FutureBuilder(
          future:
              Provider.of<MyPlaces>(context, listen: false).fetchAndSetData(),
          builder: (context, snapshot) {
            return snapshot.connectionState == ConnectionState.waiting
            ? const Center(
              child: CircularProgressIndicator(),
            )
            : Consumer<MyPlaces>(
              builder: (context, myPlaces, child) => myPlaces.items.isEmpty
                  ? child!
                  : ListView.builder(
                      itemCount: myPlaces.items.length,
                      itemBuilder: (context, index) => ListTile(
                        title: Text(myPlaces.items[index].title),
                        onTap: () {
                          //TODO go to detail page
                        },
                        leading: CircleAvatar(
                          backgroundImage:
                              FileImage(myPlaces.items[index].image),
                        ),
                      ),
                    ),
              child: const Center(
                child: Text(
                  'Не найдено ни одного места.\nСамое время добавить новое!',
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }),
    );
  }
}
