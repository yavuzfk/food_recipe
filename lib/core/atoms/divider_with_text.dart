import 'package:flutter/material.dart';
import 'package:food_recipe/core/atoms/red_ince_divider.dart';

class DividerWithText extends StatelessWidget {
  const DividerWithText({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(children: <Widget>[
        const Expanded(child: RedInceDivider()),
        Text(text),
        const Expanded(child: RedInceDivider()),
      ]),
    );
  }
}
