import 'package:cipherschool/Widgets/textField.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    bool? checkedValue = false;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sign Up'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                textField(hintText: 'Name', controller: nameController),
                textField(hintText: 'Email', controller: emailController),
                textField(hintText: 'Password', controller: passwordController),
                CheckboxListTile(
                  title: Text("title text"),
                  value: checkedValue,
                  onChanged: (newValue) {
                    setState(() {
                      checkedValue = newValue;
                    });
                  },
                  controlAffinity:
                      ListTileControlAffinity.leading, //  <-- leading Checkbox
                )
                // , FutureBuilder(
                //   future: Authentication.initializeFirebase(context: context),
                //   builder: (context, snapshot) {
                //     if (snapshot.hasError) {
                //       return Text('Error initializing Firebase');
                //     } else if (snapshot.connectionState == ConnectionState.done) {
                //       return GoogleSignInButton();
                //     }
                //     return CircularProgressIndicator(
                //       valueColor: AlwaysStoppedAnimation<Color>(
                //         CustomColors.firebaseOrange,
                //       ),
                //     );
                //   },
                // ),
              ],
            ),
          ),
        ));
  }
}
