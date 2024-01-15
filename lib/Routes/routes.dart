import 'package:cipherschool/Routes/routes_name.dart';
import 'package:cipherschool/expansePage.dart';
import 'package:cipherschool/incomePage.dart';
import 'package:cipherschool/profilePage.dart';
import 'package:cipherschool/signUp.dart';
import 'package:cipherschool/splashScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> genrateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.homePage:
        return MaterialPageRoute(builder: (context) => Splash());
      case RouteName.splash:
        return MaterialPageRoute(builder: (context) => SignUp());
      case RouteName.incomePage:
        return MaterialPageRoute(builder: (context) => IncomePage());
      case RouteName.expansePage:
        return MaterialPageRoute(builder: (context) => ExpansePage());
      case RouteName.profilePage:
        return MaterialPageRoute(builder: (context) => ProfilePage());
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
