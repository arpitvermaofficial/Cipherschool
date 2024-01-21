import 'package:cipherschool/Widgets/colors.dart';
import 'package:cipherschool/category.dart';
import 'package:cipherschool/categoryModel.dart';
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
  late CategoryModel _chooseCategory;
  void initState() {
    super.initState();
    _chooseCategory = categories[0];
  }

  void _onDropDownItemSelected(CategoryModel newcategory) {
    setState(() {
      _chooseCategory= newcategory;
    });
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
        body: Column(
          children: [
            Container(
              height: 30.h,
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
                children: [
              DropdownButtonHideUnderline(
              child: DropdownButton<CategoryModel>(
                style: TextStyle(
                fontSize: 16,
                color: Colors.grey,

              ),
              hint: Text(
                "Category",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,

                ),
              ),
              items: categories
                  .map<DropdownMenuItem<CategoryModel>>(
                      (CategoryModel value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Row(
                        children: [
                          Container(
                            height: 8.h,
                            width: 8.h,
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: value.iconcolor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(20)),
                            child: SvgPicture.asset(
                              value.icon,
                              color: value.iconcolor,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(value.category),
                        ],
                      ),
                    );
                  }).toList(),
              isExpanded: true,
              isDense: true,
              onChanged: (CategoryModel? newSelectedBank) {
                _onDropDownItemSelected(newSelectedBank!);
              },
              value: _chooseCategory,
            ),
    ),

                ],
              ),
            )
          ],
        ));
  }
}
