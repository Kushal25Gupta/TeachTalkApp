import 'package:teachtool/Resources/Colors/App_Colors.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({required this.onPress, required this.text, super.key});

  final VoidCallback onPress;
  final String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 52,
        decoration: BoxDecoration(
          color: AppColor.primaryButton,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontFamily: 'Ubuntu',
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
