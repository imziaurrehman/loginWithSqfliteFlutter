import 'package:flutter/material.dart';

InputDecoration customInputDecoration(
    {required String label, hint, required IconData? prefXIcon, sufXIcon}) {
  return InputDecoration(
    fillColor: Colors.white70,
    enabled: true,
    filled: true,
    label: Text(
      label,
    ),
    hintText: hint,
    suffixIcon: Icon(sufXIcon),
    prefixIcon: Icon(prefXIcon),
    border: InputBorder.none,
    contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
    disabledBorder: InputBorder.none,
  );
}
