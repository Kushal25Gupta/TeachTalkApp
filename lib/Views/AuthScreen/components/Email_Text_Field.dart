import 'package:flutter/material.dart';

import '../../../Utils/Utils.dart';
import '../../../Resources/Components/TextFields/Custom_Text_Field.dart';

class EmailTextField extends StatelessWidget {
  final String text;
  final FocusNode currentNode;
  final FocusNode nextNode;
  final TextEditingController editingController;

  const EmailTextField({
    required this.text,
    required this.nextNode,
    required this.currentNode,
    required this.editingController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      text: text,
      currentNode: currentNode,
      editingController: editingController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "";
        }
        return null; // Return null if validation passes
      },
      onTapOuside: (_) {
        Utils.removeFocus(currentNode);
        return "";
      },
      onFieldSubmitted: (_) {
        if (editingController.text.isNotEmpty) {
          Utils.fieldFocusChange(context, currentNode, nextNode);
        }
        return;
      },
    );
  }
}
