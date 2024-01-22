import 'dart:async';

import 'package:cipherschool/Routes/routes_name.dart';
import 'package:cipherschool/View/signUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Utils/sharedPrefrences.dart';
import '../ViewModel/Services/authentication.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    isUserLoggedIn();
    super.initState();
  }
  void isUserLoggedIn() async {
    String? UserId = await UserCredentialPreferences.getUserUID();
    Future.delayed(Duration(seconds: 3), () {
      print(UserId);
      if (UserId ==null || UserId.isEmpty || UserId == '') {
        Navigator.pushNamed(context, RouteName.onBoardingPage);
      } else {
        Navigator.pushNamed(context, RouteName.HomePage);

      }
    });
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
