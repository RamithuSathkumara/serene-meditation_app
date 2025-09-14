import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:ui';

import 'package:meditation_app/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width; // screen width for responsiveness
    final screenHeight = MediaQuery.of(context).size.height; // screen height for responsiveness

    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            'assets/images/background.svg',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover, // fills the screen
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
            child: Container(
              color: const Color.fromARGB(0, 0, 0, 0).withAlpha(51),
            ),
          ),
          Center(
            child: Container(
              width: screenWidth * 0.77,
              height: screenHeight * 0.47,
              decoration: BoxDecoration(
                color: const Color(0xFFFAF9EC),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: screenHeight * 0.0387,
                      // left: screenWidth * 0.211,
                      // right: screenWidth * 0.211,
                    ),
                    child: Text(
                      "Welcome",
                      style: TextStyle(
                        fontSize: screenHeight * 0.033,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF392513),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.07),
                    child: Text(
                      "Unlock brain locks through meditation",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: screenHeight * 0.02,
                        color: const Color(0xFF9E6532),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.07),
                    child: SizedBox(
                      width: screenWidth * 0.63,
                      height: screenHeight * 0.052,
                      child: ElevatedButton(
                        onPressed: () async {
                          final prefs = await SharedPreferences.getInstance();
                          await prefs.setBool('hasSeenWelcome', true);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Home(),
                            ),
                          );
                        },
                        child: Text("Get Start"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
