import 'package:flutter/material.dart';

/// TextField をカスタマイズした Widget。
class CustomInput extends StatelessWidget {
  final String labelText;
  final Function(String value) onChanged;
  final double fontSize;

  const CustomInput({
    Key? key,
    required this.labelText,
    required this.onChanged,
    this.fontSize = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          fontSize: fontSize,
        ),
        border: const OutlineInputBorder(),
      ),
      onChanged: (String value) {
        onChanged(value);
      },
    );
  }
}
