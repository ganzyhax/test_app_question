import 'package:flutter/material.dart';

class AppColors {
  static const Color bgColor = Color.fromARGB(255, 248, 247, 247);
  static const Color secondaryColor = Colors.white;
  static const Color blue = Color.fromARGB(255, 42, 177, 221);

  static const Color secondaryBlue = Color.fromARGB(255, 223, 244, 250);
  final LinearGradient blueGradient = const LinearGradient(
    colors: [blue, blue],
    stops: [0.25, 0.75],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  final LinearGradient kPrimaryGradientWhite = const LinearGradient(
    colors: [Colors.grey, Colors.grey],
    stops: [0.25, 0.75],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
