import 'package:flutter/material.dart';

import 'color_lists.dart';

class ProjectDecorations {
  Decoration gradientButtonDecorationBlue = BoxDecoration(
    borderRadius: BorderRadius.circular(6.0),
    gradient: LinearGradient(
      begin: const Alignment(-0.95, 0.0),
      end: const Alignment(1.0, 0.0),
      colors: [
        Colors.blueGrey.shade800,
        const Color.fromARGB(255, 23, 20, 173),
      ],
      stops: const [0.0, 1.0],
    ),
  );
  Decoration gradientButtonDecorationGray = BoxDecoration(
    borderRadius: BorderRadius.circular(12.0),
    gradient: LinearGradient(
      begin: const Alignment(-0.95, 0.0),
      end: const Alignment(1.0, 0.0),
      colors: [
        Colors.blueGrey.shade300,
        Colors.blueGrey.shade200,
      ],
      stops: const [0.0, 1.0],
    ),
  );
  Decoration squareButtonDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(70.0),
    color: const Color.fromARGB(255, 142, 6, 9),
  );

  Decoration slimBorderDecoration = BoxDecoration(
    border: Border.all(color: const Color.fromARGB(255, 17, 84, 107), width: 1),
    borderRadius: BorderRadius.circular(5),
    shape: BoxShape.rectangle,
  );

  Decoration blueGradientDecoration = BoxDecoration(
    // color: Colors.white,
    borderRadius: BorderRadius.circular(6.0),
    gradient: LinearGradient(
      begin: const Alignment(-0.95, 0.0),
      end: const Alignment(1.0, 0.0),
      colors: blueColors,
      stops: const [0.0, 1.0],
    ),
    // borderRadius: BorderRadius.all(Radius.circular(12),

    // ),
  );

  SliverGridDelegate gridDelegate =
      const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20);
}
