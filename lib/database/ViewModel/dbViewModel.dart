import 'package:cipherschool/Widgets/transactionListTile.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

import '../../Model/transactionModel.dart';
import '../db_helper.dart';

class TodoDB with ChangeNotifier {
  String transactionTable = 'transactiontable';
  String colCategory = 'category';
  String colDescription = 'description';
  String colIcon = 'icon';
  String colAmount = 'amount';
  String colDate = 'time';
  String colIconColor = 'color';
  int totalIncome = 0;
  int totalExpense = 0;

  int get totalIncome1 => totalIncome;

  int get totalExpense1 => totalExpense;
  List<TransacationModel> allMyTransaction = [];

  List<TransacationModel> get transaction => allMyTransaction;

  Future<void> createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE transactiontable(time TEXT PRIMARY KEY,$colCategory TEXT,$colDescription TEXT,$colIcon TEXT,$colAmount INTEGER,$colIconColor TEXT)');
  }

  Future<void> insertNote(TransacationModel note) async {
    final database1 = await DatabaseHelper().database;
    int result = await database1!.insert(transactionTable, note.toMap());
    notifyListeners();
  }

  Future<List<Map<String, dynamic>>> getNoteMapList() async {
    final database1 = await DatabaseHelper().database;
    var result = await database1!.query(
      transactionTable,
    );
    notifyListeners();
    return result;
  }

  Future<void> getNoteList() async {
    print("call");
    var noteMapList = await getNoteMapList();
    int count = noteMapList.length;

    List<TransacationModel> noteList = [];
    for (int i = 0; i < count; i++) {
      noteList.add(TransacationModel.fromMapObject(noteMapList[i]));
    }
    allMyTransaction.clear();
    totalExpense = 0;
    totalIncome = 0;
    allMyTransaction.addAll(noteList);
    notifyListeners();
    for (int i = 0; i < noteList.length; i++) {
      if (noteList[i].amount > 0) {
        totalIncome += noteList[i].amount;
      } else {
        totalExpense += noteList[i].amount;
      }
    }
    notifyListeners();
  }

  Future<void> deleteNote(String date) async {
    final database1 = await DatabaseHelper().database;

    for (int i = 0; i < allMyTransaction.length; i++) {
      if (allMyTransaction[i].time == date) {
        if (allMyTransaction[i].amount > 0)
          totalIncome -= allMyTransaction[i].amount;
        else {
          totalExpense += allMyTransaction[i].amount.abs();
        }
      }
    }

    notifyListeners();
    allMyTransaction.removeWhere((element) => element.time == date);
    int result = await database1!
        .delete('$transactionTable', where: '$colDate = ?', whereArgs: [date]);
    notifyListeners();
  }
}
