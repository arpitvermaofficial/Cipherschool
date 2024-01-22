import 'package:cipherschool/Utils/colors.dart';
import 'package:cipherschool/View/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pageController = PageController(initialPage: 2);

  final _controller = NotchBottomBarController(index: 2);

  int maxCount = 5;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final List<Widget> bottomBarPages = [
    HomeScreen(),
    Container(),
    Container(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
            bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? AnimatedNotchBottomBar(
              notchBottomBarController: _controller,
              color: Colors.white,
              showLabel: false,
              shadowElevation: 1,
              kBottomRadius: 28.0,
              notchColor: ColorUtils.purplelight,
              removeMargins: false,
              bottomBarWidth: 500,
              durationInMilliSeconds: 300,
              bottomBarItems: [
                BottomBarItem(
                  inActiveItem: SvgPicture.asset(
                    'assets/images/homeIcon.svg',
                    color: Colors.grey,
                  ),
                  activeItem: SvgPicture.asset(
                    'assets/images/homeIcon.svg',
                    color: Colors.white,
                  ),
                  itemLabel: 'Page 3',
                ),
                BottomBarItem(
                  inActiveItem: SvgPicture.asset(
                    'assets/images/transactionIcon.svg',
                    color: Colors.grey,
                  ),
                  activeItem: SvgPicture.asset(
                    'assets/images/transactionIcon.svg',
                    color: Colors.white,
                  ),
                  itemLabel: 'Page 3',
                ),
                BottomBarItem(
                  inActiveItem: Icon(Icons.add, color: Colors.grey),
                  activeItem: Icon(Icons.add, color: Colors.white),
                  itemLabel: 'Page 3',
                ),
                BottomBarItem(
                  inActiveItem: SvgPicture.asset(
                    'assets/images/piechart.svg',
                    color: Colors.grey,
                  ),
                  activeItem: SvgPicture.asset(
                    'assets/images/piechart.svg',
                    color: Colors.white,
                  ),
                  itemLabel: 'Page 3',
                ),
                BottomBarItem(
                  inActiveItem: SvgPicture.asset(
                    'assets/images/userIcon.svg',
                    color: Colors.grey,
                  ),
                  activeItem: SvgPicture.asset(
                    'assets/images/userIcon.svg',
                    color: Colors.white,
                  ),
                  itemLabel: 'Page 3',
                ),
              ],
              onTap: (index) {
                _pageController.jumpToPage(index);
              },
              kIconSize: 24.0,
            )
          : null,
    );
  }
}
