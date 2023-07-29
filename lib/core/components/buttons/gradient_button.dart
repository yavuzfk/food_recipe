import 'package:flutter/material.dart';

import '../../../constants/utility/decorations.dart';
import '../../../constants/utility/project_styles.dart';

class GradientButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Icon icon;

  const GradientButton(
      {Key? key,
      required this.title,
      required this.onPressed,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ProjectDecorations().gradientButtonDecorationGray,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          disabledForegroundColor: Colors.transparent.withOpacity(0.38),
          disabledBackgroundColor: Colors.transparent.withOpacity(0.12),
          shadowColor: Colors.transparent,
        ),
        label: Center(
          child: Text(
            title,
            style: ProjectStyles().grayButtonTextStyle,
            textAlign: TextAlign.center,
          ),
        ),
        icon: icon,
      ),
    );
  }
}
