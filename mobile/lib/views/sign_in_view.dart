import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/views/widgets/custom_text_button.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentDirectional.bottomStart,
            end: AlignmentDirectional.topEnd,
            colors: [Color(0xFFF531ED), Color(0xFF5E00FF)],
          ),
        ),
        child: SingleChildScrollView(
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.20),
              SvgPicture.asset(
                "assets/images/logo+tinder.svg",
                width: 190,
                height: 45,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              SizedBox(
                width: 340,
                height: 54,
                child: Text(
                  "By tapping Create Account or Sign In, you agree to our Terms. Learn how we process your data in our Privacy Policy and Cookies Policy.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    fontSize: 12.43,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
          
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
          
              CustomTextButton(
                textButton: "SIGN IN WITH APPLE",
              ),
              CustomTextButton(
                textButton: "SIGN IN WITH FACEBOOK",
              ),
              CustomTextButton(
                textButton: "SIGN IN WITH PHONE NUMBER",
              ),
          
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: 150,
                    height: 18,
                    child: Text(
                      "Trouble Signing In?",
                      style: GoogleFonts.montserrat(
                        fontSize: 14.11,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              )
            ],
          ),
        ),
      ),
    );
  }
}


