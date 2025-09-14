import 'package:flutter/material.dart';

class MeditationTypes extends StatelessWidget {
  const MeditationTypes({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(
      context,
    ).size.width; // screen width for responsiveness
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              Text(
                "Meditation Types",
                style: TextStyle(
                  fontSize: screenHeight * 0.037,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff461A04),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
