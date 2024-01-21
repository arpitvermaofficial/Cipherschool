import 'package:cipherschool/Utils/category.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

import 'Model/transactionModel.dart';
import 'database/db_helper.dart';


class NoteDetail extends StatefulWidget {


  const NoteDetail( {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return NoteDetailState();
  }
}

class NoteDetailState extends State<NoteDetail> {
  String Description= ""
      "545";
  int Amount=123;
  String Category="";
  String Date="123456";
  String Icon="52";
  String Iconcolor="89";


  DatabaseHelper helper = DatabaseHelper();


  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  bool isEdited = false;

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
        onWillPop: () async {
          isEdited ? showDiscardDialog(context) : moveToLastScreen();
          return false;
        },
        child: Scaffold(

          body: Container(

            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),


                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: titleController,
                    maxLength: 255,
                    style: Theme.of(context).textTheme.bodyText2,
                    onChanged: (value) {
                      updateTitle();
                    },
                    decoration: const InputDecoration.collapsed(
                      hintText: 'Title',
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: 10,
                      maxLength: 255,
                      controller: descriptionController,
                      style: Theme.of(context).textTheme.bodyText1,
                      onChanged: (value) {
                        updateDescription();
                      },
                      decoration: const InputDecoration.collapsed(
                        hintText: 'Description',
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  child: Text("Save",
                  ),
                  onPressed: () {
                  _save();
                  },
                ),
                ElevatedButton(
                  child: Text("Delete",
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ));
  }

  void showDiscardDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius:  BorderRadius.all(Radius.circular(10.0))),
          title: Text(
            "Discard Changes?",
            style: Theme.of(context).textTheme.bodyText2,
          ),
          content: Text("Are you sure you want to discard changes?",
              style: Theme.of(context).textTheme.bodyText1),
          actions: <Widget>[
            TextButton(
              child: Text("No",
                  ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Yes",
                  ),
              onPressed: () {
                Navigator.of(context).pop();
                moveToLastScreen();
              },
            ),
          ],
        );
      },
    );
  }

  void showEmptyTitleDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          title: Text(
            "Title is empty!",
            style: Theme.of(context).textTheme.bodyText2,
          ),
          content: Text('The title of the note cannot be empty.',
              style: Theme.of(context).textTheme.bodyText1),
          actions: <Widget>[
            TextButton(
              child: Text("Okay",
                 ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all( Radius.circular(10.0))),
          title: Text(
            "Delete Note?",
            style: Theme.of(context).textTheme.bodyText2,
          ),
          content: Text("Are you sure you want to delete this note?",
              style: Theme.of(context).textTheme.bodyText1),
          actions: <Widget>[
            TextButton(
              child: Text("No",
                  ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Yes",
                  ),
              onPressed: () {
                Navigator.of(context).pop();
                _delete();
              },
            ),

          ],
        );
      },
    );
  }

  void moveToLastScreen() {
    Navigator.pop(context, true);
  }

  void updateTitle() {
    isEdited = true;
    Category = titleController.text;
    setState(() {

    });
  }

  void updateDescription() {
    isEdited = true;
    Description = descriptionController.text;
    setState(() {

    });
  }

  // Save data to database
  void _save() async {


    Date = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()).toString();
    await helper.insertNote(TranscationModel(amount:100, category:"Shoping", date: "7350584526", description:"newdata", icon: "newicon", iconcolor: "red", ));
    // if (Category != null) {
    //   await helper.updateNote(TranscationModel(amount:Amount, category: Category, date: Date, description: Description, icon: '', iconcolor: '', ));
    // } else {
    //   await helper.insertNote(TranscationModel(amount:Amount, category: Category, date: Date, description: Description, icon: '', iconcolor: '', ));
    // }
  }

  void _delete() async {
    await helper.deleteNote(Date);
    moveToLastScreen();
  }
}