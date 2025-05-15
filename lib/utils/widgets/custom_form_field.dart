import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final bool obscureText;
  final String hintText;
  //validator for form fields
  final String? Function(String?) validator;
  //function to control onsave button
  final Function(String?) onSaved;
  const CustomFormField({
    super.key,
    required this.obscureText,
    required this.hintText,
    required this.validator,
    required this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: TextFormField(
        decoration: InputDecoration(hintText: hintText),
        validator: validator,

        obscureText: obscureText,
        onSaved: onSaved,
      ),
    );
  }
}
