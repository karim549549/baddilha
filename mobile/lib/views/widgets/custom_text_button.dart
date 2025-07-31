import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.textButton,
    required this.onTap,
    required this.width,
    required this.height,
    required this.size,
    required this.weight,
    required this.gradient, required this.padding, required this.margin,
  });
  final String textButton;
  final VoidCallback onTap;
  final double width;
  final double height;
  final double size;
  final FontWeight weight;
  final Gradient? gradient;
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: margin,
        padding: padding,
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(67.18),
          border: Border.all(width: 1.34, color: Colors.white),
          gradient: gradient,
        ),
        child: Text(
          textButton,
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
            fontSize: size,
            fontWeight: weight,
            color: Colors.white,
            letterSpacing: 0.01,
          ),
        ),
      ),
    );
  }
}
