import 'package:flutter/material.dart';

Widget SettingsChoise({
  String? txt1,
  String? txt2,
  String? txt3,
  bool? lights,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            txt1!,
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 10),
          Text(txt2!),
          Text(
            txt3!,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
      const Spacer(),
      Switch(
        value: lights!,
        activeColor: Colors.redAccent,
        onChanged: (bool? value) {
          lights;
        },
      ),
    ],
  );
}
