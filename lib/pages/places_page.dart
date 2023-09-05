import 'package:flutter/material.dart';
import 'package:my_memorable_places/pages/added_place_page.dart';
import 'package:my_memorable_places/providers/my_place.dart';
import 'package:provider/provider.dart';

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
        body: Consumer<MyPlace>(
          builder: (context, myPlace, child) => myPlace.items.isEmpty
              ? child!
              : ListView.builder(
                  itemCount: myPlace.items.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(myPlace.items[index].title),
                    onTap: () {},
                    leading: CircleAvatar(
                      backgroundImage: FileImage(myPlace.items[index].image),
                    ),
                  ),
                ),
          child: const Center(
            child: Text(
              'Не найдено ни одного места.\nСамое время добавить новое!',
              textAlign: TextAlign.center,
            ),
          ),
        ),
    );
  }
}
