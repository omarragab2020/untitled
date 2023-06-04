import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthTextFromField extends StatelessWidget {
  final TextEditingController? controller;
  final bool? obscureText;
  final Function? validator;
  final Function? onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? label;
  final TextInputType? textInputType;
  final String? hintText;
  const AuthTextFromField({
    this.controller,
    this.obscureText,
    this.onChanged,
    this.validator,
    this.prefixIcon,
    this.label,
    this.suffixIcon,
    this.hintText,
    this.textInputType,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText!,
      cursorColor: Colors.black,
      keyboardType: textInputType,
      validator: (value) => validator!(value),
      style: const TextStyle(
        color: Colors.black,
      ),
      onChanged: (value) => onChanged,
      decoration: InputDecoration(
        fillColor: Colors.grey.shade200,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        label: Text(label ?? ''),
        hintStyle: const TextStyle(
          color: Colors.black45,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
