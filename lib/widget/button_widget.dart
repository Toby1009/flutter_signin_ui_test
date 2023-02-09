import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_signin_ui_test/utils/app_colors.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  const ButtonWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        height: MediaQuery.of(context).size.height/14,
        decoration: BoxDecoration(
          color: AppColors.buttonColors,
          borderRadius: BorderRadius.circular(10),
        ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
