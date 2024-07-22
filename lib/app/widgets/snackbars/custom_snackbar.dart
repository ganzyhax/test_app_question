import 'package:flutter/material.dart';

class CustomSnackbar {
  static void show(context, message) {
    var snackBar = SnackBar(
      content: Text(message),
    );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
