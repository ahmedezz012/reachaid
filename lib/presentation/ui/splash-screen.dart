import 'package:flutter/material.dart';
import 'package:reachaid/presentation/ui/select-user-type.dart';

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
          Padding(
            padding: const EdgeInsets.fromLTRB(50, 70, 50, 0),
            // Add some padding around the button
            child: SizedBox(
                // To control the button's width
                width: double.infinity, // Makes the button take the full width
                height: 60,
                child: RoundedCornerButton(
                  text: 'تسجيل الدخول',
                  color: Colors.red,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SelectUserType()),
                    );
                  },
                )),
          ),
        ],
      ),
    );
  }
}
