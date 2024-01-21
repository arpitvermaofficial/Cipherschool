import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';

import '../Model/transactionModel.dart';

class DatabaseHelper {
  String transactionTable = 'transaction_table';
  String colCategory = 'category';
  String colDescription = 'description';
  String colIcon = 'icon';
  String colAmount = 'amount';
  String colDate = 'date';
  String colIconColor = 'color';
  late Database database;

  Future<void> initializeDatabase() async {
    // Get the directory path for both Android and iOS to store database.
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'notes1.db';

    // Open/create the database at a given path
    db =
        await openDatabase(path, version: 1, onCreate: _createDb);

  }
  Future<int> updateNote(TranscationModel note) async {
    var db = await initializeDatabase();
    var result = await db.update(transactionTable, note.toMap(),
        where: '$colDate = ?', whereArgs: [note.date]);
    return result;
  }
  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $transactionTable($colDate TEXT PRIMARY KEY , $colCategory TEXT, '
        '$colDescription TEXT, $colIcon TEXT, $colAmount INTEGER,$colIconColor TEXT)');
  }

  // Fetch Operation: Get all note objects from database
  Future<List<Map<String, dynamic>>> getNoteMapList() async {
    Database db = await initializeDatabase();

//		var result = await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC');
    var result = await db.query(transactionTable, );
    return result;
  }

  // Insert Operation: Insert a Note object to database
  Future<int> insertNote(TranscationModel note) async {
    Database db = await initializeDatabase();
    var result = await db.insert(transactionTable, note.toMap());
    return result;
  }

  // Delete Operation: Delete a Note object from database
  Future<int> deleteNote(String date) async {
    var db = await initializeDatabase();
    int result = await db
        .rawDelete('DELETE FROM $transactionTable WHERE $colDate = $date');
    return result;
  }

  // Get number of Note objects in database
  Future<int?> getCount() async {
    Database db = await initializeDatabase();
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) from $transactionTable');
    int? result = Sqflite.firstIntValue(x);
    return result;
  }

  // Get the 'Map List' [ List<Map> ] and convert it to 'Note List' [ List<Note> ]
  Future<List<TranscationModel>> getNoteList() async {
    var noteMapList = await getNoteMapList(); // Get 'Map List' from database
    int count =
        noteMapList.length; // Count the number of map entries in db table

    List<TranscationModel> noteList = [];
    // For loop to create a 'Note List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      noteList.add(TranscationModel.fromMapObject(noteMapList[i]));
    }

    return noteList;
  }
}
