// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  TitleText({super.key, required this.text, required this.ctne});
  bool ctne = true;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Text(text),
        RichText(
            text: TextSpan(children: [
          TextSpan(
              text: ctne ? 'Prime -' : '',
              style: TextStyle(color: const Color.fromARGB(255, 1, 96, 173))),
          TextSpan(text: ' $text')
        ])),
        Icon(Icons.keyboard_arrow_right_outlined),
      ],
    );
  }
}
