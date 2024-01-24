import 'package:cipherschool/Utils/colors.dart';
import 'package:cipherschool/Utils/category.dart';
import 'package:cipherschool/Model/categoryModel.dart';
import 'package:cipherschool/View/homePage.dart';
import 'package:cipherschool/View/transactionDashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../Model/transactionModel.dart';
import '../database/ViewModel/dbViewModel.dart';
import 'package:intl/intl.dart';

class IncomePage extends StatefulWidget {
  const IncomePage({super.key});

  @override
  State<IncomePage> createState() => _IncomePageState();
}

class _IncomePageState extends State<IncomePage> {
  @override
  String selectedCategory = "";
  List<String> isWallet = ["Yes", "No"];
  String selectedWallet = "";
  List<String> test = [];
  TextEditingController amountController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void initState() {
    super.initState();
  }

  void dispose() {
    amountController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorUtils.purplelight,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 30.dp,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: ColorUtils.purplelight,
          title: Text(
            "Income Page",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 30.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "How much?",
                      style: TextStyle(
                          fontSize: 17.dp,
                          overflow: TextOverflow.ellipsis,
                          color: Colors.white54),
                    ),
                    Row(
                      children: [
                        Text(
                          "₹ ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 50.dp,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Expanded(
                          child: TextField(
                              controller: amountController,
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 50.dp,
                                overflow: TextOverflow.ellipsis,
                              ),
                              decoration: InputDecoration(
                                hintText: "0",
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 50.dp,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                height: 60.h,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 7.h,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(15)),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        icon: Icon(Icons.keyboard_arrow_down),
                        underline: Container(),
                        iconSize: 40.dp,
                        isDense: false,
                        hint: new Text("Category",
                            style: TextStyle(color: Colors.grey)),
                        value: selectedCategory == "" ? null : selectedCategory,
                        onChanged: (newValue) {
                          setState(() {
                            selectedCategory = newValue!;
                          });
                        },
                        items: categories.map((Map map) {
                          return DropdownMenuItem<String>(
                            value: map["category"].toString() +
                                "#" +
                                map["icon"].toString() +
                                "#" +
                                map["iconcolor"].toString() +
                                "#",
                            // value: _mySelection,
                            child: Container(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    height: 25.h,
                                    padding: EdgeInsets.all(10),
                                    width: 13.w,
                                    decoration: BoxDecoration(
                                        color:
                                            map["iconcolor"].withOpacity(0.1),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: SvgPicture.asset(map["icon"],
                                        color: map["iconcolor"]),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    map["category"],
                                    style: TextStyle(fontSize: 18.sp),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    TextField(
                      controller: descriptionController,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        hintText: "Description",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 7.h,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(15)),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        icon: Icon(Icons.keyboard_arrow_down),
                        underline: Container(),
                        iconSize: 40.dp,
                        isDense: true,
                        hint: new Text(
                          "Wallet",
                          style: TextStyle(color: Colors.grey),
                        ),
                        value: selectedWallet == "" ? null : selectedWallet,
                        onChanged: (newValue) {
                          setState(() {
                            selectedWallet = newValue!;
                          });
                        },
                        items: isWallet.map((String item) {
                          return DropdownMenuItem<String>(
                              value: item,
                              // value: _mySelection,
                              child: Text(item));
                        }).toList(),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Consumer<TodoDB>(
                      builder: (context, todo, child) {
                        return GestureDetector(
                          onTap: () {
                            if (descriptionController == null ||
                                amountController.text.isEmpty ||
                                amountController.text == "") {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text('Please enter all fields'),
                                duration: Duration(seconds: 1),
                              ));
                            } else if (amountController.text.length > 10) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text('Please enter valid amount'),
                                duration: Duration(seconds: 1),
                              ));
                            } else {
                              test = selectedCategory.split('#');
                              String Timestamp =
                                  DateFormat('yyyy-MM-dd HH:mm:ss')
                                      .format(DateTime.now())
                                      .toString();
                              todo.insertNote(TransacationModel(
                                  amount: int.parse(amountController.text),
                                  category: test[0],
                                  description: descriptionController.text,
                                  time: Timestamp,
                                  icon: test[1],
                                  iconcolor: test[2]));
                              Navigator.pop(context);
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            height: 7.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: ColorUtils.purplelight),
                            child: Center(
                                child: Text(
                              'Continue',
                              style: TextStyle(
                                  fontSize: 20.dp,
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            )),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
