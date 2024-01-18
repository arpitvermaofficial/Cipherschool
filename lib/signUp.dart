import 'package:cipherschool/Widgets/textField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

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
                Row(
                  children: [
                    Checkbox(
                      value: this.value,
                      onChanged: (bool? value) {
                        setState(() {
                          this.value = value!;
                        });
                      },
                    ),
                    RichText(
                        text: TextSpan(
                            text: 'By signing up, you agree to the ',
                            style: TextStyle(color: Colors.black, fontSize: 15),
                            children: [
                          TextSpan(
                            text: 'Terms of Service and Privacy Policy',
                            style: TextStyle(color: Colors.blue),
                          )
                        ])),
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFF7F3DFF)
                  ),
                  child: Center(child:  Text('Sign Up' ,style: TextStyle(fontSize: 15.sp,color: Colors.white,fontWeight: FontWeight.w600),)),
                ),
                Text('Or with', style: TextStyle(color: Colors.grey,),),


              ],
            ),
          ),
        ));
  }
}
