import 'package:flutter/material.dart';

class Button2 extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const Button2({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: const Color(0xFF448AFF), width: 1),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: Colors.blueAccent, fontSize: 16),
        ),
      ),
    );
  }
}
