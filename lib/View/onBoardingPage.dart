import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Routes/routes_name.dart';

class onBoardingPage extends StatelessWidget {
  const onBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RouteName.signUp);
      },
      child: SvgPicture.asset("assets/images/onboardingPage.svg"),
    );
  }
}
