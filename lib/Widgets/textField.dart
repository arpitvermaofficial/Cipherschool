import 'package:flutter/material.dart';

class textField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  const textField({super.key, required this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return
      TextField(
        controller: controller,
        // onTapOutside: (event) {
        //   print('onTapOutside');
        //   FocusManager.instance.primaryFocus?.unfocus();
        // },
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(
              20,
            ),
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(
              20,
            ),
          ),
        ),
      );
  }
}
