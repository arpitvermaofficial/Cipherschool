import 'package:cipherschool/Utils/colors.dart';
import 'package:cipherschool/Widgets/textField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import '../Widgets/googleSignButton.dart';
import 'authentication.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Sign Up',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textField(hintText: 'Name', controller: nameController),
                textField(hintText: 'Email', controller: emailController),
                textField(hintText: 'Password', controller: passwordController),
                Row(
                  children: [
                    Transform.scale(
                      scale: 1.3,
                      child: Checkbox(
                        side:
                            BorderSide(color: ColorUtils.purplelight, width: 2),
                        value: this.value,
                        onChanged: (bool? value) {
                          setState(() {
                            this.value = value!;
                          });
                        },
                      ),
                    ),
                    Flexible(
                      child: RichText(
                          text: TextSpan(
                              text: 'By signing up, you agree to the ',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 15.sp),
                              children: [
                            TextSpan(
                              text: 'Terms of Service and Privacy Policy',
                              style: TextStyle(
                                color: ColorUtils.purplelight,
                                fontSize: 15.sp,
                              ),
                            )
                          ])),
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: 7.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ColorUtils.purplelight),
                  child: Center(
                      child: Text(
                    'Sign Up',
                    style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  )),
                ),
                Text(
                  'Or with',
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.grey,
                  ),
                ),
                FutureBuilder(
                  future: Authentication.initializeFirebase(context: context),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error initializing Firebase');
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      return GoogleSignInButton();
                    }
                    return CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.orangeAccent,
                      ),
                    );
                  },
                ),
                RichText(
                    text: TextSpan(
                        text: 'Already have an account? ',
                        style: TextStyle(color: Colors.grey, fontSize: 15.sp),
                        children: [
                      TextSpan(
                        text: 'Login',
                        style: TextStyle(
                            fontSize: 15.sp,
                            color: ColorUtils.purplelight,
                            decoration: TextDecoration.underline),
                      )
                    ])),
                SizedBox(
                  height: 20.5.h,
                )
              ],
            ),
          ),
        ));
  }
}
