import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // White Top Section
          Container(
            height: 250,
            color: Colors.white, // White background for the top section
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'EduGenie', // Centered app name
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(221, 222, 10, 10),
                    fontFamily: 'cursive',
                  ),
                ),
                SizedBox(height: 80),
                Text(
                  'Your AI-powered gateway to success.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontFamily: 'cursive',
                  ),
                ),
              ],
            ),
          ),

          // Space between the top section and the animation
          SizedBox(height: 20),

          // Larger Lottie Animation
          Lottie.asset(
            'assets/education_animation.json',
            height: 400, // Increased height
            width:
                400, // Optional: specify width if you want the animation to scale uniformly
          ),

          // Space before the button
          SizedBox(height: 40),

          // Ask a Question Button
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _buildFeatureButton(
                    context,
                    'Ask a Question',
                    Icons.question_answer,
                    '/question',
                    const Color.fromARGB(255, 0, 0, 0),
                    Colors.tealAccent,
                  ),
                  SizedBox(height: 40), // Extra space at the bottom
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureButton(
    BuildContext context,
    String title,
    IconData icon,
    String route,
    Color startColor,
    Color endColor,
  ) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        backgroundColor: startColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 20, color: Colors.white),
          SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
