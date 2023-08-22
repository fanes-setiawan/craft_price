import 'package:flutter/material.dart';

class FormText extends StatefulWidget {
  final String hintText;
  final String? helperText;
  final bool obscureText;
  final Widget? suffixIcon;

  final void Function(String) onPressed;

  const FormText(
      {super.key,
      required this.hintText,
      this.helperText,
      required this.obscureText,
      this.suffixIcon,
      required this.onPressed});

  @override
  State<FormText> createState() => _FormTextState();
}

class _FormTextState extends State<FormText> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: Colors.grey[200],
        border: InputBorder.none,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.transparent,
            )),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.red,
            )),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.grey,
            )),
        focusColor: Colors.white,
        hintText: widget.hintText,
        suffixIcon: widget.suffixIcon,
        hintStyle: TextStyle(
          color: Colors.blueGrey,
        ),
        helperText: widget.helperText,
      ),
      onChanged: widget.onPressed,
    );
  }
}
