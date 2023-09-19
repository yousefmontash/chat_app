import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    this.onTap,
    required this.text,
  });
  String text;
  Function()? onTap;
  // double height;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 45,
        child: Center(
          child: Text(text),
        ),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
      ),
    );
  }
}
