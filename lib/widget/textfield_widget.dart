import 'package:flutter/material.dart';

import 'package:flutter_signin_ui_test/utils/app_colors.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController;

  final IconData iconData;

  final String hintText;

  final bool? obscureText;
  const TextFieldWidget({Key? key,
    required this.textEditingController,
    required this.hintText,
    this.obscureText=false,
    required this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: textEditingController,
        obscureText: obscureText!,
        decoration: InputDecoration(
          labelText: hintText,
          hintText: hintText,
          filled: true,
          fillColor: AppColors.textHolder,
            //正在用的texfield 的 border
          prefixIcon: Icon(iconData,color: Colors.black,size: 18,),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
            //可用（還沒用到）的texfield 的 border
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
          labelStyle: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          floatingLabelStyle: const TextStyle(
            color: Colors.black,
            fontSize: 18.0,
          ),
        ),
    );
  }
}
