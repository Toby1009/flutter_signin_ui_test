import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class TextFormFieldWidget extends StatefulWidget {
  final TextEditingController textEditingController;
  final bool? obscureText;
  final String hintText;
  final IconData iconData;
  final String? Function(String?)? validator;
  final  Function(String)? onChanged;
  const  TextFormFieldWidget({
    Key? key,
    required this.textEditingController,
    this.obscureText=false,
    required this.hintText,
    required this.iconData,
    this.validator,
    this.onChanged,

  }) : super(key: key);

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textEditingController,
      obscureText: widget.obscureText!,
      decoration: InputDecoration(
        labelText: widget.hintText,
        hintText: widget.hintText,
        filled: true,
        fillColor: AppColors.textHolder,
//正在用的texfield 的 border
        prefixIcon: Icon(widget.iconData,color: Colors.black,size: 18,),
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
      validator: widget.validator,
      onChanged: widget.onChanged,
    );
  }
}
