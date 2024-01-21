import 'package:cipherschool/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class dayList extends StatefulWidget {
  const dayList({super.key});

  @override
  State<dayList> createState() => _dayListState();
}

class _dayListState extends State<dayList> {
  List<String> freq = ["Today", "Week", "Month", "Year"];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: freq.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
                width: 22.w,
                height: 5.h,
                child: Center(
                    child: Text(
                  freq[index],
                  style: TextStyle(
                      color: selectedIndex == index
                          ? ColorUtils.golden
                          : Colors.grey),
                )),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: selectedIndex == index
                      ? ColorUtils.yellowLight
                      : Colors.white,
                )),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 2.w,
          );
        },
      ),
    );
  }
}
