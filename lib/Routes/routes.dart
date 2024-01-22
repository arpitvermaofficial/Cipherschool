import 'package:cipherschool/Routes/routes_name.dart';
import 'package:cipherschool/View/expansePage.dart';
import 'package:cipherschool/View/incomePage.dart';
import 'package:cipherschool/View/onBoardingPage.dart';
import 'package:cipherschool/View/profilePage.dart';
import 'package:cipherschool/View/signUp.dart';
import 'package:cipherschool/View/splashScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Routes {
  static Route<dynamic> genrateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splash:
        return MaterialPageRoute(builder: (context) => Splash());
      case RouteName.incomePage:
        return MaterialPageRoute(builder: (context) => IncomePage());
      case RouteName.expansePage:
        return MaterialPageRoute(builder: (context) => ExpansePage());
      case RouteName.profilePage:
        return MaterialPageRoute(builder: (context) => ProfilePage());
      case RouteName.signUp:
        return MaterialPageRoute(builder: (context) => SignUp());
      case RouteName.onBoarding:
        return MaterialPageRoute(builder: (context) => onBoardingPage());
      default:
        return MaterialPageRoute(builder: (context) {
          return Scaffold(
            body: Center(
              child: Text("No route defining"),
            ),
          );
        });
    }
  }
}
