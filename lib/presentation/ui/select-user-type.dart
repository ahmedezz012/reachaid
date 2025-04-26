import 'package:flutter/material.dart';
import 'package:reachaid/presentation/components/rounded-corner-button.dart';
import 'package:reachaid/presentation/ui/register-user.dart';
import 'package:reachaid/presentation/ui/register-rescuer.dart';

class SelectUserType extends StatelessWidget {
  const SelectUserType({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          // Background Image with Transparency
          Opacity(
            opacity: 0.1,
            child: Container(
              margin: const EdgeInsets.only(top: 15),
              child: Image.asset(
                'assets/images/select-user-type.jpeg',
                // Replace with your image path
                fit: BoxFit.fitWidth,
              ),
            ),
          ),

          // Buttons on Top Layer
          Padding(
            padding: EdgeInsets.fromLTRB(15, 300, 15, 0),
            child: Column(
              children: [
                SizedBox(
                  // To control the button's width
                    width: double.infinity,
                    height: 60,
                    // Submit Button
                    child:  RoundedCornerButton(
                  text: 'اسعاف و انقاذ',
                  color: Colors.red,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const RegisterRescuer()),
                    );
                    // Handle button press
                  },
                )),
                Padding(
                    padding: EdgeInsets.fromLTRB(0, 70, 0, 0),
                  child: SizedBox(
                    // To control the button's width
                      width: double.infinity,
                      height: 60,
                      // Submit Button
                      child:  RoundedCornerButton(
                      text: 'المستخدم',
                      color: Colors.red,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const RegisterUserScreen()),
                        );
                      },
                    ))
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
