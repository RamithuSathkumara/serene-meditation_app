import 'package:flutter/material.dart';
import 'package:meditation_app/data/quotes.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  final Function(int) onNavigate;
  // ignore: prefer_const_constructors_in_immutables
  Home({super.key, required this.onNavigate});

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
                  color: Color(0xff392513),
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
                child: SizedBox(
                  height: screenHeight * 0.063,
                  width: screenWidth * 0.7,
                  child: ElevatedButton(
                    onPressed: () => widget.onNavigate(1),
                    child: Text(
                      "Start Meditating",
                      style: TextStyle(
                        fontSize: screenHeight * 0.01675,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: screenHeight * 0.069),
                child: Column(
                  children: [
                    Text(
                      "Mindful Days",
                      style: TextStyle(
                        fontSize: screenHeight * 0.02,
                        color: Color(0xff392513),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.034,
                    ), // space before boxes
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: screenHeight * 0.046,
                                  width: screenWidth * 0.1,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xFF461A04),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.0083),
                                Text("Mon"),
                              ],
                            ),
                            SizedBox(width: screenWidth * 0.009),
                            Column(
                              children: [
                                Container(
                                  height: screenHeight * 0.046,
                                  width: screenWidth * 0.1,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xFF461A04),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.0083),
                                Text("Tue"),
                              ],
                            ),
                            SizedBox(width: screenWidth * 0.009),
                            Column(
                              children: [
                                Container(
                                  height: screenHeight * 0.046,
                                  width: screenWidth * 0.1,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xFF461A04),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.0083),
                                Text("Wed"),
                              ],
                            ),
                            SizedBox(width: screenWidth * 0.009),
                            Column(
                              children: [
                                Container(
                                  height: screenHeight * 0.046,
                                  width: screenWidth * 0.1,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xFF461A04),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.0083),
                                Text("Thu"),
                              ],
                            ),
                            SizedBox(width: screenWidth * 0.009),
                            Column(
                              children: [
                                Container(
                                  height: screenHeight * 0.046,
                                  width: screenWidth * 0.1,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xFF461A04),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.0083),
                                Text("Fri"),
                              ],
                            ),
                            SizedBox(width: screenWidth * 0.009),
                            Column(
                              children: [
                                Container(
                                  height: screenHeight * 0.046,
                                  width: screenWidth * 0.1,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xFF461A04),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.0083),
                                Text("Sat"),
                              ],
                            ),
                            SizedBox(width: screenWidth * 0.009),
                            Column(
                              children: [
                                Container(
                                  height: screenHeight * 0.046,
                                  width: screenWidth * 0.1,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Color(0xFF461A04),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.0083),
                                Text("Sun"),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Container(
                  padding: EdgeInsetsGeometry.only(top: screenHeight * 0.025),
                  child: Image.asset(
                    "assets/images/Lotus.png",
                    height: screenHeight * 0.24,
                    width: screenWidth * 0.7,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
