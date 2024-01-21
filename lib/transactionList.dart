import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'Model/transactionModel.dart';
import 'addData.dart';
import 'database/db_helper.dart';

class NoteList extends StatefulWidget {
  const NoteList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return NoteListState();
  }
}

class NoteListState extends State<NoteList> {
  late Database dbFuture;
  late List<TranscationModel> noteList;
  DatabaseHelper databaseHelper = DatabaseHelper();
  int count = 0;
  int axisCount = 2;

  @override
  void initState() {
    // TODO: implement initState
    updateListView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 100,
                  color: Colors.white,
                  child: FutureBuilder<List<TranscationModel>>(
                    future: updateAndGetList(),
                    builder: (BuildContext context, AsyncSnapshot<List<TranscationModel>> snapshot) {
                      if (snapshot.hasData) {

                        // the word list as retrieved from your future
                        List<TranscationModel>? wordList = noteList;
                        return ListView.builder(
                            itemCount: wordList!.length,
                            itemBuilder: (context, i) {
                              print("wordlength is ${noteList[i].category}");
                              Text(noteList[i].date,style: TextStyle(color: Colors.black, fontSize: 12),);
                            });
                      }else if (snapshot.hasError) {
                        return Text("Oops!");
                      }
                      return Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
          Container(
            height: MediaQuery.of(context).size.height-200,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NoteDetail()));
                  },
                  child: Text('Add Transaction')),
            ),
          )
        ],
      ),
    );
  }

  // Returns the priority color
  Color getPriorityColor(int priority) {
    switch (priority) {
      case 1:
        return Colors.red;
        break;
      case 2:
        return Colors.yellow;
        break;
      case 3:
        return Colors.green;
        break;

      default:
        return Colors.yellow;
    }
  }

  // Returns the priority icon
  String getPriorityText(int priority) {
    switch (priority) {
      case 1:
        return '!!!';
        break;
      case 2:
        return '!!';
        break;
      case 3:
        return '!';
        break;

      default:
        return '!';
    }
  }
  Future<List<TranscationModel>> updateAndGetList() async {
    await DatabaseHelper().initializeDatabase();
    // return the list here
    return DatabaseHelper().getNoteList();
  }
  // void _delete(BuildContext context, Note note) async {
  //   int result = await databaseHelper.deleteNote(note.id);
  //   if (result != 0) {
  //     _showSnackBar(context, 'Note Deleted Successfully');
  //     updateListView();
  //   }
  // }

  // void _showSnackBar(BuildContext context, String message) {
  //   final snackBar = SnackBar(content: Text(message));
  //   Scaffold.of(context).showSnackBar(snackBar);
  // }

  void updateListView() async {
    dbFuture = await databaseHelper.initializeDatabase();
    Future<List<TranscationModel>> noteListFuture =
        DatabaseHelper().getNoteList();
    noteList =  await noteListFuture;
      setState(() {
        count = noteList.length;
      });
     for(int i=0;i<noteList.length;i++){
       print("noteList is ${noteList[i].category}");
       print("noteList is ${noteList[i].date}");
       print("noteList is ${noteList[i].amount}");
        print("noteList is ${noteList[i].description}");
        print("noteList is ${noteList[i].icon}");
     };

  }
}
