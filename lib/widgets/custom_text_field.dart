import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool isPassword;
 final Function(String) onChanged;
 final Color textFieldColor;
 final Color hintTextColor;
  final int maxLines;
  final String initialValue; 

final  void Function(String?)? onSaved;

 const CustomTextField(
      {super.key,
      required this.initialValue  , 
      required this.hintText,
      this.maxLines = 1,
      this.isPassword = false,
      required this.onChanged,
      this.textFieldColor = Colors.white,
      this.hintTextColor = Colors.white,
      this.onSaved});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: TextFormField(
        initialValue: initialValue,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onSaved: onSaved,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'it cannot be empty';
          }
          return null;
        },
        onChanged: onChanged,
        maxLines: maxLines,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: hintTextColor,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: textFieldColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: textFieldColor, width: 2),
          ),
        ),
      ),
    );
  }
}
