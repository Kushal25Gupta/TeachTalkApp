import 'package:flutter/material.dart';

class IconTextPair extends StatelessWidget {
  const IconTextPair({
    required this.iconData,
    required this.texts,
    super.key,
  });

  final IconData iconData;
  final String texts;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconData,
          color: Colors.grey.shade500,
          size: 16,
        ),
        const SizedBox(width: 2),
        Text(
          texts,
          style: TextStyle(
            fontFamily: 'Ubuntu',
            fontSize: 13,
            color: Colors.grey.shade500,
          ),
        ),
        const SizedBox(width: 15),
      ],
    );
  }
}
