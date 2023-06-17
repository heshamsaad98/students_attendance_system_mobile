import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  final String? Function(String?) validate;
  final TextEditingController controller;
  final TextInputType type;
  final bool isPassword;
  final IconData? prefix;
  final IconData? suffix;
  final TextInputAction? textInputAction;
  final Function()? suffixPressed;
  final String? hintText;
  final InputBorder? border;

  const CustomTextForm({
    super.key,
    required this.validate,
    required this.controller,
    required this.type,
    this.isPassword = false,
    this.suffix,
    this.suffixPressed,
    required this.prefix,
    required this.hintText,
    this.border = InputBorder.none,
    required this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
      decoration: const BoxDecoration(
          color: Color(0xffe5eafc),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: TextFormField(
        keyboardType: type,
        validator: validate,
        controller: controller,
        obscureText: isPassword,
        textInputAction: textInputAction,
        decoration: InputDecoration(
          hintText: hintText,
          border: border,
          prefixIcon: Icon(
            prefix,
          ),
          suffixIcon: suffix != null
              ? IconButton(
                  onPressed: suffixPressed,
                  icon: Icon(
                    suffix,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
