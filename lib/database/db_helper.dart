import 'package:cipherschool/database/ViewModel/dbViewModel.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class DatabaseHelper {
  Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    } else
      _database = await initializeDatabase();
    return _database!;
  }

  Future<String> getDatabasePath() async {
    String documentsDirectory = await getDatabasesPath();
    String path = documentsDirectory + 'cypherschool.db';
    return path;
  }

  Future<Database> initializeDatabase() async {
    final path = await getDatabasePath();
    var datatbase1 = await openDatabase(path,
        version: 1, onCreate: create, singleInstance: true);
    return datatbase1;
  }

  Future<void> create(Database database, int version) async =>
      await TodoDB().createDb(database, version);
}
