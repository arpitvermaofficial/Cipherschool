import 'package:cipherschool/Widgets/accountCard.dart';
import 'package:cipherschool/Utils/colors.dart';
import 'package:cipherschool/Widgets/dayList.dart';
import 'package:cipherschool/Widgets/transactionListTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final items = List<String>.generate(20, (i) => "Item ${i + 1}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(30.h), // here the desired height
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: ColorUtils.cream,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
            ),
            child: Column(children: [
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: ColorUtils.purplelight,
                    child: CircleAvatar(
                        radius: 19,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 18,
                          backgroundImage:
                              AssetImage('assets/images/profileImg.png'),
                        )),
                  ),
                  Row(
                    children: [
                      Icon(Icons.keyboard_arrow_down_outlined,
                          color: ColorUtils.purplelight),
                      Text(
                        'October',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18.sp),
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        FontAwesomeIcons.solidBell,
                        color: ColorUtils.purplelight,
                      )),
                ],
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                'Account  Balance',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15.sp,
                    color: Colors.grey),
              ),
              Text(
                "₹38000",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 40.sp),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  accountCard(
                      color: ColorUtils.greenLight,
                      Amount: 15000,
                      CardIcon: "incomeIcon",
                      title: "Income"),
                  accountCard(
                      color: ColorUtils.redLight,
                      Amount: 18000,
                      CardIcon: "expenseIcon",
                      title: "Expense")
                ],
              ),
            ]),
          )),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 2.h,
            ),
            dayList(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Recent Transactions',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                        color: Colors.black)),
                Container(
                  height: 5.h,
                  width: 20.w,
                  decoration: BoxDecoration(
                      color: ColorUtils.purplelight.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      'See All',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                          color: ColorUtils.purplelight),
                    ),
                  ),
                )
              ],
            ),
            Container(
              height: 50.h,
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Dismissible(
                    // Specify the direction to swipe and delete
                    direction: DismissDirection.endToStart,
                    key: Key(item),
                    onDismissed: (direction) {
                      // Removes that item the list on swipwe
                      setState(() {
                        items.removeAt(index);
                      });
                      // Shows the information on Snackbar
                    },
                    background: Container(color: Colors.red),
                    child: tranSactionListTile(iconcolor: ColorUtils.golden),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
