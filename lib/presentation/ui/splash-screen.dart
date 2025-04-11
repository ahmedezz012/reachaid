import 'package:flutter/material.dart';

import '../components/rounded-corner-button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 15),
            alignment: Alignment.topCenter,
            child: Image.asset(
              'assets/images/reach-aid.jpg',
            ),
          ),
          const Spacer(), // Pushes the button to the bottom
          Padding(
            padding: const EdgeInsets.all(20.0), // Add some padding around the button
            child: SizedBox( // To control the button's width
              width: double.infinity, // Makes the button take the full width
              child: RoundedCornerButton(
                text: 'تسجيل الدخول',
                color: Colors.red,
                onPressed: () {
                  // Handle button press
                },
              )
            ),
          ),
        ],
      ),
    );
  }
}