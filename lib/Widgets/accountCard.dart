import 'package:cipherschool/Routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:flutter_svg/svg.dart';

import '../Utils/colors.dart';

class accountCard extends StatefulWidget {
  final Color color;
  final int Amount;
  final String CardIcon;
  final String title;

  const accountCard(
      {super.key,
      required this.color,
      required this.Amount,
      required this.CardIcon,
      required this.title});

  @override
  State<accountCard> createState() => _accountCardState();
}

class _accountCardState extends State<accountCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.title == "Expense") {
          Navigator.pushNamed(context, RouteName.expansePage)
              .then((_) => setState(() {}));
        } else {
          Navigator.pushNamed(context, RouteName.incomePage);
        }
      },
      child: Container(
          padding: EdgeInsets.all(10),
          height: 9.h,
          width: 43.w,
          decoration: BoxDecoration(
              color: widget.color, borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: [
              Container(
                height: 5.h,
                width: 12.w,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: SvgPicture.asset(
                  'assets/icons/${widget.CardIcon}.svg',
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.title,
                      style: TextStyle(
                          fontSize: 12.dp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          overflow: TextOverflow.ellipsis)),
                  Text("₹${widget.Amount}",
                      style: TextStyle(
                          fontSize: 17.dp,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w700,
                          color: Colors.white))
                ],
              )
            ],
          )),
    );
  }
}
