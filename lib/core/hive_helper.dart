import 'package:hive_flutter/adapters.dart';

class HiveHelper{
  static Future<Box<T>> getDataBase<T>(String nameBox) async{
    return await Hive.openBox<T>(nameBox);
  }
}