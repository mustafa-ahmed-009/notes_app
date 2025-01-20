import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
 final Color buttonColor;
  final bool isLoading;
 const CustomButton(
      {super.key,
      required this.text,
      required this.onTap,
      required this.buttonColor,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        child: Container(
          alignment: Alignment.center,
          height: 40,
          decoration: BoxDecoration(
              color: buttonColor, borderRadius: BorderRadius.circular(8)),
          child: isLoading
              ? const CircularProgressIndicator(
                  color: Colors.black,
                )
              : Text(
                  text,
                  style: const TextStyle(color: Colors.white),
                ),
        ),
      ),
    );
  }
}
