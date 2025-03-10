import 'package:flutter/material.dart';

// Model data untuk checkbox
class CheckboxDataModel {
  bool _isChecked = false; // Variabel private

  bool get isChecked => _isChecked; // Getter
  set isChecked(bool value) => _isChecked = value; // Setter
}

// Widget Checkbox
class CheckboxModel extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool> onChanged;

  const CheckboxModel({
    Key? key,
    required this.initialValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CheckboxModelState createState() => _CheckboxModelState();
}

class _CheckboxModelState extends State<CheckboxModel> {
  late bool isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = widget.initialValue;
  }

  void _toggleCheckbox() {
    setState(() {
      isChecked = !isChecked;
    });
    widget.onChanged(isChecked);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleCheckbox,
      child: Image.asset(
        isChecked ? 'assets/icon_checkbox.png' : 'assets/icon_checkbox2.png',
        width: 24,
        height: 24,
      ),
    );
  }
}
