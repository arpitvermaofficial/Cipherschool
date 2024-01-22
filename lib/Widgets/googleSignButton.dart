import 'package:cipherschool/Routes/routes_name.dart';
import 'package:cipherschool/Utils/colors.dart';
import 'package:cipherschool/View/homePage.dart';
import 'package:cipherschool/View/transactionDashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../ViewModel/Services/authentication.dart';

class GoogleSignInButton extends StatefulWidget {
  @override
  _GoogleSignInButtonState createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  bool _isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return _isSigningIn
        ? CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(ColorUtils.purplelight),
          )
        : Container(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: OutlinedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: BorderSide(color: Colors.grey.shade100)),
                  ),
                ),
                onPressed: () async {
                  setState(() {
                    _isSigningIn = true;
                  });

                  User? user =
                      await Authentication.signInWithGoogle(context: context);

                  setState(() {
                    _isSigningIn = false;
                  });

                  if (user != null) {
                    Navigator.pushNamed(
                        context, RouteName.transactionDashBoard);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image(
                        image: AssetImage("assets/images/logo.png"),
                        height: 35.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Sign in with Google',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black54,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
