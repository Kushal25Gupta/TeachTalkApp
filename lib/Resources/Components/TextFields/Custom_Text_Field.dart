import 'package:flutter/material.dart';
import '../../Colors/App_Colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.text,
    required this.currentNode,
    required this.editingController,
    this.suffixIcon,
    this.obscureText,
    this.validator,
    this.onTapOuside,
    this.onFieldSubmitted,
    super.key,
  });
  final String text;
  final FocusNode currentNode;
  final TextEditingController editingController;
  final suffixIcon;
  final obscureText;
  final validator;
  final onFieldSubmitted;
  final onTapOuside;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: editingController,
      cursorColor: Colors.black26,
      obscureText: obscureText ?? false,
      focusNode: currentNode,
      style: const TextStyle(
        fontFamily: 'Ubuntu',
        color: Colors.black54,
      ),
      decoration: InputDecoration(
        hintText: text,
        hintStyle: const TextStyle(
          color: Colors.black26,
          height: 1.5,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        filled: true,
        fillColor: AppColor.backGround,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        suffixIcon: suffixIcon,
      ),
      validator: validator,
      onTapOutside: onTapOuside,
      onFieldSubmitted: onFieldSubmitted ?? onFieldSubmitted,
    );
  }
}
