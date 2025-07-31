import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/views/widgets/custom_text_button.dart';

class CreateAccountView extends StatelessWidget {
  const CreateAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: SvgPicture.asset("assets/images/Tinder Icon.svg"),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          width: 393,
          height: 852,
          child: Column(
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.height * 0.10),

              SizedBox(
                width: 87,
                height: 36,
                child: Text(
                  "Oops!",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF444142)
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        
              SizedBox(
                width: 325,
                height: 80,
                child: Text(
                  textAlign: TextAlign.center,
                  "We couldn’t find a Tinder account connected to that Facebook Account.",
                  style: TextStyle(
                    fontSize: 19.48,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF828693),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.20),

              CustomTextButton(
                textButton: "CREATE NEW ACCOUNT", 
                onTap: (){},
                width: 273.75,
                height: 50.38,
                size: 18,
                weight: FontWeight.w700,
                gradient: LinearGradient(
                  colors: mainColors
                ),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12), 
                margin: null,
              )
          
            ],
          ),
        ),
      ),
    );
  }
}
