import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? background;
  final bool isUpperCase;
  final double radius;
  final Function()? function;
  final String text;
  const CustomElevatedButton({
    super.key,
    this.width = double.infinity,
    this.height = 50.0,
    this.background = Colors.blue,
    this.isUpperCase = true,
    this.radius = 30.0,
    required this.function,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: function,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(background!),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              side: const BorderSide(
                color: Colors.white70,
              ),
              borderRadius: BorderRadius.all(Radius.circular(radius)),
            ),
          ),
        ),
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
