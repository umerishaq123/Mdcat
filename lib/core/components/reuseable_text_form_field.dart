  
  
  import 'package:flutter/material.dart';

Widget buildCustomTextField({
  required TextEditingController controller,
  required String labelText,
  IconData? icon,
  bool obscureText = false,
}) {
  return TextFormField(
    controller: controller,
    obscureText: obscureText,
    decoration: InputDecoration(
      labelText: labelText,
      icon: icon != null ? Icon(icon) : null,
      border: OutlineInputBorder(),
    ),
  );
}