import 'package:cipherschool/Utils/colors.dart';
import 'package:cipherschool/Utils/category.dart';
import 'package:cipherschool/Model/categoryModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:flutter_svg/svg.dart';

class ExpansePage extends StatefulWidget {
  const ExpansePage({super.key});

  @override
  State<ExpansePage> createState() => _ExpansePageState();
}

class _ExpansePageState extends State<ExpansePage> {
  @override
  String _selected = "";
  List<String> isWallet = ["Yes", "No"];
  String selectedWallet = "";

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorUtils.cyan,
        appBar: AppBar(
          backgroundColor: ColorUtils.cyan,
          title: Text(
            "Expanse Page",
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
              Container(
                height: 57.7.h,
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
                        value: _selected == "" ? null : _selected,
                        onChanged: (newValue) {
                          setState(() {
                            _selected = newValue!;
                          });

                          print(_selected);
                        },
                        items: categories.map((Map map) {
                          return DropdownMenuItem<String>(
                            value: map["category"].toString(),
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
                    Container(
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
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
