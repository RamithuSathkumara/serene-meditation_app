import 'package:flutter/material.dart';
import 'package:meditation_app/data/quotes.dart';
import 'package:intl/intl.dart';
import 'package:meditation_app/screens/meditation_types.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String quote = "";
  @override
  void initState() {
    super.initState();
    int dayOfTheYear = int.parse(DateFormat("D").format(DateTime.now()));
    int index = dayOfTheYear % quotes.length;
    quote = quotes[index];
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(
      context,
    ).size.width; // screen width for responsiveness
    final screenHeight = MediaQuery.of(
      context,
    ).size.height; // screen height for responsiveness

    String getGreeting() {
      int time = DateTime.now().hour;
      if (time >= 0 && time <= 11) {
        return "Morning";
      } else if (time >= 12 && time <= 17) {
        return "Afternoon";
      } else {
        return "Evening";
      }
    } // Return the greeting.

    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              Text(
                "Good ${getGreeting()}",
                style: TextStyle(
                  fontSize: screenHeight * 0.037,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff461A04),
                ),
              ),

              Padding(
                padding: EdgeInsetsGeometry.only(
                  top: screenHeight * 0.069,
                  left: screenWidth * 0.11,
                  right: screenWidth * 0.11,
                ),
                child: Container(
                  padding: EdgeInsets.all(
                    screenWidth * 0.03,
                  ), // paddin inside the box
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF461A04), width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '"$quote"',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: screenWidth * 0.0409,
                      fontStyle: FontStyle.italic,
                      color: Color(0xFF461A04),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsGeometry.only(top: screenHeight * 0.078),
                child: ElevatedButton(
                  onPressed: ,
                  child: Text("Start Meditation"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
