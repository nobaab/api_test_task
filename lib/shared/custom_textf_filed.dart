import 'package:api_test_task/config/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BexcaTextField extends StatefulWidget {
  BexcaTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.keyboardType,
      this.obscureText = false,
      this.onChanged,
      this.prefixIcon,
      this.validator});
  TextEditingController? controller;
  String? hintText;
  TextInputType? keyboardType;
  Widget? prefixIcon;
  String? Function(String?)? validator;
  Function(String)? onChanged;
  bool obscureText;

  @override
  State<BexcaTextField> createState() => _BexcaTextFieldState();
}

class _BexcaTextFieldState extends State<BexcaTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.start,
      style: TextStyle(color: kTextBlackColor, fontSize: 17.0, fontWeight: FontWeight.w300),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 12.0,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: borderColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5), borderSide: BorderSide(color: borderColor, width: 2.0)),
        prefixIcon: widget.prefixIcon,
        hintText: widget.hintText,
        filled: true,
        fillColor: const Color(0xFFF8F8F8),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        isDense: true,
        hintStyle: TextStyle(color: softColor, fontSize: 14.0, fontWeight: FontWeight.w400),
      ),
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      onChanged: widget.onChanged,
      obscureText: widget.obscureText,
    );
  }
}
