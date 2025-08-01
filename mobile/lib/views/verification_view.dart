import 'package:flutter/material.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/views/widgets/custom_text_button.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_sharp, color: Color(0xFF828693)),
        ),
      ),
      body: Center(
        child: SizedBox(
          width: 330,
          height: 852,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),

              SizedBox(
                width: 250,
                height: 50,
                child: Text(
                  "My number is",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 38.5,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF010001),
                  ),
                ),
              ),

              SizedBox(
                child: Text("OTP")
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.05),

              SizedBox(
                width: 292,
                height: 48,
                child: RichText(
                  text: TextSpan(
                    text:
                        "We will send a text with a verification code. Message and data rates may apply. ",
                    style: TextStyle(
                      fontSize: 13.59,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF828693),
                      letterSpacing: -0.02,
                    ),
                    children: [
                      TextSpan(
                        text: "Learn what happens when your number changes.",
                        style: TextStyle(
                          fontSize: 13.59,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF444142),
                          letterSpacing: -0.02,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.start,
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.20),

              Align(
                alignment: Alignment.center,
                child: CustomTextButton(
                  textButton: "CONTINUE",
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return VerificationView();
                        },
                      ),
                    );
                  },
                  width: 312.38,
                  height: 50.38,
                  size: 18,
                  weight: FontWeight.w700,
                  gradient: LinearGradient(
                    colors: mainColors,
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  margin: null,
                  shadows: <BoxShadow>[
                    BoxShadow(
                      offset: Offset(0, 20),
                      blurRadius: 5.04,
                      spreadRadius: 0,
                      color: Color(0x00000026),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}