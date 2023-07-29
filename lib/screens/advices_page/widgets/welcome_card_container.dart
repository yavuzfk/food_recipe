import 'package:flutter/material.dart';

import '../../../utility/colors.dart';

class WelcomeCardContainer extends StatelessWidget {
  const WelcomeCardContainer({
    super.key,
    required this.innerWidget,
  });
  final Widget innerWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: ProjectColors().projectHeaderColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: innerWidget,
      ),
    );
  }
}
