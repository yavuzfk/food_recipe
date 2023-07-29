import 'package:flutter/material.dart';

class ProjectThemes {
  static final lightTheme = ThemeData(
    // useMaterial3: true,
    fontFamily: "OpenSans",
    scaffoldBackgroundColor: const Color.fromARGB(255, 233, 225, 225),
    appBarTheme: const AppBarTheme(
      shadowColor: Colors.blueAccent,
      iconTheme: IconThemeData(
        color: Color.fromARGB(255, 219, 219, 224),
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: Colors.blueGrey.shade800,
      secondary: const Color.fromARGB(255, 23, 20, 173),
    ),
  );
}
