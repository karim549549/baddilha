import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key, required this.textButton});
  final String textButton;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.all(3.36),
        padding: EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 16.12
        ),
        width: 331.5,
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(67.18),
          border: Border.all(width: 1.34, color: Colors.white),
        ),
        child: Text(
          textButton,
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
            fontSize: 14.78,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            letterSpacing: 0.01,
          ),
        ),
      ),
    );
  }
}
