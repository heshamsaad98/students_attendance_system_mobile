import 'package:flutter/material.dart';

class CustomMaterialButton extends StatelessWidget {
  final double height;
  final Function()? function;
  final String? text;
  const CustomMaterialButton({
    Key? key,
    this.height = 15.0,
    required this.function,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          text!,
          style: const TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
