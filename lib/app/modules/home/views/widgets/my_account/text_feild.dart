import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget TextFieldWidget({
  String? text,
  FontWeight? fontWeight,
  int? fontSize,
  TextDecoration? underLine,
  Color? color,
}) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: TextField(
      decoration: InputDecoration(
        border: InputBorder.none,
        filled: true,
        fillColor: Colors.grey[200],
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(20.0),
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text!,
            style: const TextStyle(color: Colors.grey),
          ),
        ),
      ),
      textDirection: TextDirection.ltr,
      cursorColor: Colors.redAccent,
    ),
  );
}
