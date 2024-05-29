import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  CustomTextfield({this.hintText, super.key, this.onChanged ,this.textInputType});
  String? hintText;
  Function(String)? onChanged;
  TextInputType? textInputType = TextInputType.number;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        keyboardType: textInputType,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.black),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)),
        ),
      ),
    );
  }
}
