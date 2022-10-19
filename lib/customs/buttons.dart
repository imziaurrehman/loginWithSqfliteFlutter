import 'package:flutter/material.dart';

ElevatedButton mainButton(
    {required VoidCallback pressed, required List<Widget> values}) {
  return ElevatedButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
      primary: Colors.orange.shade600,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: values,
    ),
  );
}

TextButton secondryButton({
  required VoidCallback pressed,
  required List<Widget> values,
}) {
  return TextButton(
    onPressed: pressed,
    style: ElevatedButton.styleFrom(
      // primary: Colors.orange.shade800,
      textStyle: const TextStyle(color: Colors.orange),
      alignment: Alignment.center,
    ),
    child: Row(children: values),
  );
}
