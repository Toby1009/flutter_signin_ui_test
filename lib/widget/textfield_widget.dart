import 'package:flutter/material.dart';

import 'package:flutter_signin_ui_test/utils/app_colors.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController;

  final String hintText;

  final bool? obscureText;
  const TextFieldWidget({Key? key,
    required this.textEditingController,
    required this.hintText,
    this.obscureText=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: textEditingController,
        obscureText: obscureText!,
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: AppColors.textHolder,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
    );
  }
}
