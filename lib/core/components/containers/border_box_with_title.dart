import 'package:flutter/material.dart';

import '../../../constants/utility/decorations.dart';

class BorderBoxWithTitle extends StatelessWidget {
  final String title;
  final List<Widget> widgetList;
  const BorderBoxWithTitle(
      {Key? key, required this.title, required this.widgetList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.24,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          padding: const EdgeInsets.only(bottom: 10, top: 10),
          decoration: ProjectDecorations().slimBorderDecoration,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // children: const [RadioButtonBarkod(), RadioButtonLot()],
              children: widgetList,
            ),
          ),
        ),
        Positioned(
          left: 50,
          top: 12,
          child: Container(
            padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
            color: const Color.fromARGB(255, 233, 225, 225),
            child: Text(
              // borderText,
              title,
              style: const TextStyle(color: Colors.black, fontSize: 12),
            ),
          ),
        ),
      ],
    );
  }
}
