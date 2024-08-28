import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'answer_page.dart';
import 'dart:async';

class WaitingScreen extends StatelessWidget {
  final String question;

  WaitingScreen({required this.question});

  @override
  Widget build(BuildContext context) {
    // Simulate a delay before showing the answer
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => AnswerPage(question: question),
        ),
      );
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset(
          'assets/robot_thinking_animation.json', // Path to your Lottie animation
          height: 300, // Adjust the height of the animation
          width: 300, // Adjust the width of the animation
        ),
      ),
    );
  }
}
