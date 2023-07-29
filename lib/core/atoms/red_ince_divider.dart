import 'package:flutter/material.dart';

class RedInceDivider extends StatelessWidget {
  const RedInceDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 2,
      indent: 2,
      endIndent: 2,
      color: Colors.blueGrey.shade800,
    );
  }
}
