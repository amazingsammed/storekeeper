import 'dart:io';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class Dbhelper extends GetxController {
  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  initDb() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "store.db");
    bool dbExists = await File(path).exists();

    if (!dbExists) {
      // Copy from asset
      print("start");
      ByteData data = await rootBundle.load("Assets/mystore.db");
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
      // print('file create done');
    }

    var theDb = await databaseFactory.openDatabase(path);
    return theDb;
  }

  // Future<List<KBook>> getBooks() async {
  //   books.clear();
  //   var dbClient = await db;
  //   List<Map<String, dynamic>> lists =
  //       await dbClient!.rawQuery('Select * from books order By list_order');
  //   for (var element in lists) {
  //     books.add(KBook.fromMap(element));
  //   }
  //   return books;
  // }


}
