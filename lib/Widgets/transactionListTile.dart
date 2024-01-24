import 'package:cipherschool/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sqflite/sqflite.dart';
import 'package:intl/intl.dart';

import '../Model/transactionModel.dart';

class tranSactionListTile extends StatelessWidget {
  final TransacationModel transaction;

  const tranSactionListTile({super.key,  required this.transaction});

  @override
  Widget build(BuildContext context) {
    String a=transaction.amount.abs().toString();

    String valueString = transaction.iconcolor.split('(0x')[1].split(')')[0]; //
    int value = int.parse(valueString, radix: 16);
    Color iconColor = new Color(value);
    print(transaction.time);
    print(DateFormat.jm().format(DateTime.parse(transaction.time)));
    var time= DateFormat.jm().format(DateTime.parse(transaction.time));
    return Container(
        height: 10.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 8.h,
              width: 8.h,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20)),
              child: SvgPicture.asset(
                transaction.icon,
                color: iconColor,
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          transaction.category,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 15.sp),
                        ),
                        Text((transaction.amount > 0 ? "+" : "-") + " ₹" + "${(transaction.amount.abs()).toString()}",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18.dp,overflow: TextOverflow.ellipsis,color: transaction.amount>0?Colors.green:Colors.red),
                        overflow: TextOverflow.ellipsis,),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          transaction.description,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12.dp ,
                              color: Colors.grey),
                        ),
                        Text(
                          time,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12.dp,overflow: TextOverflow.ellipsis,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ]),
            )
          ],
        ));
  }
}
