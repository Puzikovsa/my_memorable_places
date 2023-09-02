import 'package:flutter/material.dart';
import 'package:my_memorable_places/pages/added_place_page.dart';
import 'package:my_memorable_places/pages/places_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.indigo)
            .copyWith(secondary: Colors.amber),
        ),
      home: const PlacesPage(),
      routes: {
        AddedPlacePage.rout: (context) => const AddedPlacePage()
      },
    );
  }
}

