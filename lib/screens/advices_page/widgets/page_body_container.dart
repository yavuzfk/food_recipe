import 'package:flutter/material.dart';

import '../../../constants/utility/colors.dart';

class MainPageBodyContainer extends StatelessWidget {
  final Widget innerWidget;
  const MainPageBodyContainer({
    super.key,
    required this.innerWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.79,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(34)),
          color: ProjectColors().projectPageColorWhite,
        ),
        child: innerWidget,
      ),
    );
  }
}
