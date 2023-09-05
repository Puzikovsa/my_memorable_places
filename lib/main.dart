import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_memorable_places/pages/added_place_page.dart';
import 'package:my_memorable_places/pages/places_page.dart';
import 'package:my_memorable_places/providers/my_places.dart';
import 'package:provider/provider.dart';

void main() async{
  await Hive.initFlutter();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: MyPlaces(),
      child: MaterialApp(
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
      ),
    );
  }
}

