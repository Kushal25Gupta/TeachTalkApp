
import 'package:flutter/material.dart';
import '../../../Utils/Utils.dart';
import '../../../Resources/Components/TextFields/Custom_Text_Field.dart';

class PasswordTextField extends StatefulWidget {
  final String text;
  final FocusNode currentNode;
  late bool isVisible;
  final TextEditingController editingController;

  PasswordTextField({
    super.key,
    required this.text,
    required this.currentNode,
    required this.isVisible,
    required this.editingController,
  });

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      text: widget.text,
      currentNode: widget.currentNode,
      editingController: widget.editingController,
      obscureText: widget.isVisible,
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            widget.isVisible = !widget.isVisible;
          });
        },
        icon: widget.isVisible
            ? const Icon(Icons.remove_red_eye)
            : const Icon(
                Icons.remove_red_eye_outlined,
                color: Colors.black26,
              ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "";
        }
        return null; // Return null if validation passes
      },
      onTapOuside: (_) {
        Utils.removeFocus(widget.currentNode);
        return "";
      },
    );
  }
}
