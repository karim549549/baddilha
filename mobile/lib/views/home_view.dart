import 'package:flutter/material.dart';
import 'package:mobile/views/custom_problem_with_sign_in.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: (){}, 
          icon: Icon(
            Icons.arrow_back_ios_new_rounded
          ),
        ),
      ),
      body: CustomProblemWithSignIn(),
    );
  }
}