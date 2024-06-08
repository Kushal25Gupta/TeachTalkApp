import 'package:teachtool/Resources/Colors/App_Colors.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  CustomContainer({
    required this.Child,
    required this.Height,
    this.Width = double.infinity,
    this.color = AppColor.purpleBackgroundColor,
    super.key,
  });

  final Widget Child;
  final double Height;
  final double Width;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      width: Width,
      height: Height,
      child: Child,
    );
  }
}
