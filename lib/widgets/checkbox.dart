import 'package:flutter/material.dart';

class CustomCheckboxRow extends StatefulWidget {
  @override
  _CustomCheckboxRowState createState() => _CustomCheckboxRowState();
}

class _CustomCheckboxRowState extends State<CustomCheckboxRow> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.scale(
          scale: 0.9,
          child: GestureDetector(
            onTap: () {
              setState(() {
                isChecked = !isChecked;
              });
            },
            child: Image.asset(
              isChecked
                  ? 'assets/icon_checkbox.png' // Gambar checkbox aktif
                  : 'assets/icon_checkbox2.png', // Gambar checkbox nonaktif
              width: 24,
              height: 24,
            ),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Text(
            'Anda setuju dengan nominal hasil convert.',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
