import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
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
                  "My Code is",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 38.5,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF010001),
                  ),
                ),
              ),

              SizedBox(
                width: 107,
                height: 24,
                child: Text(
                  "000000",
                  style: TextStyle(
                    fontSize: 19.48,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF444142),
                    letterSpacing: -0.02,
                  ),
                )
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.05),

              SizedBox(
                width: 313,
                child: OtpTextField(
                  numberOfFields: 6,
                  decoration: InputDecoration(
                    border: underlineBorder,
                    enabledBorder: underlineBorder,
                    focusedBorder: underlineBorder,
                  ),
                  borderColor: Color(0xFF828693),
                  fillColor: Color(0xFF828693),
                  textStyle: textStyle,
                  enabledBorderColor: Color(0xFF828693),
                  keyboardType: TextInputType.number,
                  
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.20),

              Align(
                alignment: Alignment.center,
                child: CustomTextButton(
                  textButton: "CONTINUE",
                  onTap: () {
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) {
                    //       return ();
                    //     },
                    //   ),
                    // );
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