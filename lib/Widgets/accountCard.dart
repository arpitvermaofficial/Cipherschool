import 'package:cipherschool/Routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:flutter_svg/svg.dart';

import '../Utils/colors.dart';

class accountCard extends StatelessWidget {
  final Color color;
  final int Amount;
  final String CardIcon;
  final String title;
  const accountCard({super.key, required this.color, required this.Amount, required this.CardIcon, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
       if(title=="Expense") {
          Navigator.pushNamed(context, RouteName.expansePage);
       }

        else {
          Navigator.pushNamed(context, RouteName.incomePage);
        }
      },
      child: Container(
          padding: EdgeInsets.all(10),
          height: 8.5.h,
          width: 43.w,
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 5.h,
                width: 13.w,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: SvgPicture.asset(
                  'assets/images/$CardIcon.svg',
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title,
                      style: TextStyle(
                          fontSize:8.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white)),
                  Text("₹$Amount",
                      style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.white))
                ],
              )
            ],
          )),
    );
  }
}
