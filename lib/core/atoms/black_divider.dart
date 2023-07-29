import 'package:flutter/material.dart';

class BlackDivider extends StatelessWidget {
  const BlackDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: 0.5,
      indent: 2,
      endIndent: 3,
      color: Colors.purple,
    );
  }
}
