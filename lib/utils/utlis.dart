import 'package:flutter/material.dart';

class Utils {
  void showSnackBar(BuildContext context, value) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));
  }
}
