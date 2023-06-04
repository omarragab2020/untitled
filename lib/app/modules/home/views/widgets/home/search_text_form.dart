// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/main_controller.dart';
import '../text_utils.dart';

class MyTextField extends StatelessWidget {
  const MyTextField(this.controller, {this.onChanged, Key? key})
      : super(key: key);

  final TextEditingController controller;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: Colors.black,
      keyboardType: TextInputType.text,
      onChanged: onChanged,
      decoration: InputDecoration(
        fillColor: Colors.white,
        focusColor: Colors.red,

        labelText: 'Search by name',
        labelStyle: TextStyle(color: Colors.black),
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.grey,
        ),
        suffixIcon: controller.text.isNotEmpty
            ? IconButton(
                onPressed: () {
                  controller.clear();
                },
                icon: const Icon(
                  Icons.close,
                  color: Colors.black,
                ),
              )
            : null,
        // hintText: "Search with name",
        // hintStyle: const TextStyle(
        //   color: Colors.black45,
        //   fontSize: 16,
        //   fontWeight: FontWeight.w500,
        // ),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: mainColor),
          borderRadius: BorderRadius.circular(50),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: mainColor),
          borderRadius: BorderRadius.circular(50),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: mainColor),
          borderRadius: BorderRadius.circular(50),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: mainColor),
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}
