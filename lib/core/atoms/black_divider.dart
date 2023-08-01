import 'package:flutter/material.dart';

class BlackDivider extends StatelessWidget {
  const BlackDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: 0.7,
      // indent: 2,
      // endIndent: 3,
      color: Color.fromARGB(255, 226, 226, 226),
    );
  }
}
