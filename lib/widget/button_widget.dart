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
          //繪製陰影
          boxShadow:  [
            BoxShadow(
            color: Colors.purple.withOpacity(0.2),//陰影顏色
              offset: const  Offset(0, 3),//隱影x和y軸偏移量
              blurRadius: 10,//陰影模糊程度
              spreadRadius: 4,//陰影擴散程度
          )
          ],
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
