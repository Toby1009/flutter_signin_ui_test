import 'package:flutter/material.dart';

class ToastWidget extends StatelessWidget {
  final String text;
  final Color color;
  final IconData icon;
  const ToastWidget({Key? key,
    required this.text,
    required this.color,
    required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: color,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children:  [
          Icon(icon),
          const SizedBox(
            width: 12.0,
          ),
          Text(text),
        ],
      ),
    );
  }
}
