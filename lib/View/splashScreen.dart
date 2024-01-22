import 'dart:async';

import 'package:cipherschool/Routes/routes_name.dart';
import 'package:cipherschool/View/signUp.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3),
        () => Navigator.pushNamed(context, RouteName.onBoarding));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF7B61FF),
      body: SafeArea(
        child: Container(
            decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/SplashScreen.png'),
            fit: BoxFit.cover,
          ),
        )),
      ),
    );
  }
}
