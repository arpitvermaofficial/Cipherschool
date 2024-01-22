import 'package:cipherschool/Utils/colors.dart';
import 'package:cipherschool/Utils/category.dart';
import 'package:cipherschool/Model/categoryModel.dart';
import 'package:cipherschool/View/homePage.dart';
import 'package:cipherschool/View/transactionDashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:flutter_svg/svg.dart';

import '../Model/transactionModel.dart';
import '../database/ViewModel/dbViewModel.dart';
import 'package:intl/intl.dart';

class ExpansePage extends StatefulWidget {
  const ExpansePage({super.key});

  @override
  State<ExpansePage> createState() => _ExpansePageState();
}

class _ExpansePageState extends State<ExpansePage> {
  @override
  String selectedCategory = "";
  List<String> isWallet = ["Yes", "No"];
  String selectedWallet = "";
  final todoDB = TodoDB();
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

  void _save(String Category, String icon, String iconcColor) async {
    print("category is $Category");
    print("icon is $icon");
    print("iconcolor is $iconcColor");
    String Timestamp =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()).toString();
    await todoDB.insertNote(TransacationModel(
        amount: int.parse(amountController.text) * -1,
        category: Category,
        description: descriptionController.text,
        time: Timestamp,
        icon: icon,
        iconcolor: iconcColor));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorUtils.cyan,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 30.sp,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: ColorUtils.cyan,
          title: Text(
            "Expanse Page",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Column(
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
                    style: TextStyle(fontSize: 17.sp, color: Colors.white54),
                  ),
                  Row(
                    children: [
                      Text(
                        "₹ ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50.sp,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                            controller: amountController,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 50.sp,
                            ),
                            decoration: InputDecoration(
                              hintText: "0",
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 50.sp,
                              ),
                            )),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                
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
                      height: 8.h,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(15)),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        icon: Icon(Icons.keyboard_arrow_down),
                        underline: Container(),
                        iconSize: 45,
                        isDense: true,
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
                            child: Row(
                              children: <Widget>[
                                Container(
                                  height: 6.h,
                                  padding: EdgeInsets.all(10),
                                  width: 13.w,
                                  decoration: BoxDecoration(
                                      color: map["iconcolor"].withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(20)),
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
                          );
                        }).toList(),
                      ),
                    ),
                    TextField(
                      controller: descriptionController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        hintText: "Description",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 8.h,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(15)),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        icon: Icon(Icons.keyboard_arrow_down),
                        underline: Container(),
                        iconSize: 45,
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
                    GestureDetector(
                      onTap: () {
                        test = selectedCategory.split('#');
              
                        _save(test[0], test[1], test[2]);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
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
                              fontSize: 20.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
