import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/views/custom_problem_with_sign_in.dart';
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
            colors: mainColors,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.40),
              SvgPicture.asset(
                "assets/images/logo+tinder.svg",
                width: 190,
                height: 45,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.10),

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

              SizedBox(height: MediaQuery.of(context).size.height * 0.04),

              CustomTextButton(
                textButton: "SIGN IN WITH APPLE", 
                onTap: () {}, 
                width: 331.5, 
                height: 55,
                size: 15,
                weight: FontWeight.w600,
                gradient: null,
                padding: EdgeInsets.only(left: 26.87, top: 14.11),
                margin: EdgeInsets.all(3.36),
              ),
              CustomTextButton(
                textButton: "SIGN IN WITH FACEBOOK",
                onTap: () {}, 
                width: 331.5, 
                height: 55,
                size: 15,
                weight: FontWeight.w600,
                gradient: null,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16.12),
                margin: EdgeInsets.all(3.36),
              ),
              CustomTextButton(
                textButton: "SIGN IN WITH PHONE NUMBER",
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return CustomProblemWithSignIn();
                      },
                    ),
                  );
                }, 
                width: 331.5, 
                height: 55,
                size: 15,
                weight: FontWeight.w600,
                gradient: null,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16.12),
                margin: EdgeInsets.all(3.36),
              ),
              
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),

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
            ],
          ),
        ),
      ),
    );
  }
}
