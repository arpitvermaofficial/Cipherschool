import 'package:cipherschool/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';

class tranSactionListTile extends StatelessWidget {
  final Color iconcolor;
  final String category = "Shopping";
  final String description = "Bought a new phone";
  final int amount = 5000;

  const tranSactionListTile({super.key, required this.iconcolor});

  @override
  Widget build(BuildContext context) {
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
                  color: iconcolor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20)),
              child: SvgPicture.asset(
                "assets/images/shopping.svg",
                color: iconcolor,
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
                          category,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 15.sp),
                        ),
                        Text(
                          amount.toString() + "₹",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18.sp),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          description,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
                              color: Colors.grey),
                        ),
                        Text(
                          ' 12:00 PM',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
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
