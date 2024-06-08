import 'package:flutter/material.dart';
import 'package:teachtool/Resources/Colors/App_Colors.dart';

class CustomStudentTextFormField extends StatefulWidget {
  const CustomStudentTextFormField({
    required this.focusNode,
    required this.controller,
    required this.hintText,
    required this.onValidateText,
    required this.onFieldSubmitted,
    required this.onPress,
    this.readOnly = false,
    super.key,
  });

  final FocusNode focusNode;
  final TextEditingController controller;
  final String hintText;
  final String onValidateText;
  final VoidCallback onPress;
  final bool readOnly;
  final ValueChanged<String> onFieldSubmitted;

  @override
  State<CustomStudentTextFormField> createState() =>
      _CustomStudentTextFormFieldState();
}

class _CustomStudentTextFormFieldState
    extends State<CustomStudentTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.readOnly,
      showCursor: !widget.readOnly,
      focusNode: widget.focusNode,
      controller: widget.controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: widget.focusNode.hasFocus
            ? AppColor.purpleBackgroundColor
            : Colors.white,
        hintText: widget.hintText,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: const BorderSide(color: AppColor.presentCheckColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: const BorderSide(color: AppColor.absentCheckColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: const BorderSide(color: AppColor.absentCheckColor),
        ),
      ),
      validator: (value) {
        if (value!.isNotEmpty) {
          return null;
        }
        return widget.onValidateText;
      },
      onFieldSubmitted: (value) {
        widget.onFieldSubmitted(value);
      },
      onTap: widget.onPress,
    );
  }
}
