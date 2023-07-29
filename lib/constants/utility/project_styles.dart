import 'package:flutter/material.dart';

class ProjectStyles {
  ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    backgroundColor: Colors.transparent,
    disabledForegroundColor: Colors.transparent.withOpacity(0.38),
    disabledBackgroundColor: Colors.transparent.withOpacity(0.12),
    shadowColor: Colors.transparent,
  );
  ButtonStyle buttonStyleGray = ElevatedButton.styleFrom(
    backgroundColor: Colors.blueGrey[500],
    disabledForegroundColor: Colors.transparent.withOpacity(0.38),
    disabledBackgroundColor: Colors.transparent.withOpacity(0.12),
    shadowColor: Colors.transparent,
  );
  ButtonStyle buttonStyleGraySelected = ElevatedButton.styleFrom(
    backgroundColor: Colors.blueGrey[800],
    disabledForegroundColor: Colors.transparent.withOpacity(0.38),
    disabledBackgroundColor: Colors.transparent.withOpacity(0.12),
    shadowColor: Colors.transparent,
  );
  ButtonStyle buttonSelectionActive = ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: Colors.teal,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30))),
  );
  ButtonStyle buttonSelectionPassive = ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: const Color.fromARGB(255, 153, 167, 166),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30))),
  );
  TextStyle darkButtonTextStyle = const TextStyle(
    fontSize: 16,
    color: Color(0xffffffff),
    letterSpacing: -0.3858822937011719,
  );
  TextStyle grayButtonTextStyle = const TextStyle(
    fontSize: 16,
    color: Color(0xFF100101),
    letterSpacing: -0.3858822937011719,
    fontWeight: FontWeight.w500,
  );
  TextStyle blackTitleTextStyle = const TextStyle(
    fontSize: 22,
    color: Color(0xFF100101),
    letterSpacing: -0.3858822937011719,
    fontWeight: FontWeight.w500,
  );
  TextStyle blackTitleTextStyleMono = const TextStyle(
    fontSize: 20,
    color: Color(0xFF100101),
    letterSpacing: -0.3858822937011719,
    fontWeight: FontWeight.w300,
    fontFamily: "monospace",
  );
  TextStyle lightButtonTextStyle = const TextStyle(
    fontSize: 18,
    color: Colors.white,
    letterSpacing: -0.3858822937011719,
  );
  TextStyle lightButtonTextStyleBig = const TextStyle(
    fontSize: 22,
    color: Colors.white,
    letterSpacing: -0.3858822937011719,
  );
  TextStyle whiteMonoTextStyle = const TextStyle(
    fontSize: 18,
    color: Colors.white,
    fontFamily: "monospace",
    letterSpacing: -0.3858822937011719,
  );
}
