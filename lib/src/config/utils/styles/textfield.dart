import 'package:flutter/material.dart';

InputDecoration customprefixDecoration(String hinttext,Icon icon) {
  return InputDecoration(
      fillColor: Colors.white,
      hintText: hinttext,
      prefixIcon: icon,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14)
      )
  );
}