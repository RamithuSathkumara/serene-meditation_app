import 'package:flutter/material.dart';
import 'package:meditation_app/data/meditation_list.dart';
import 'package:meditation_app/screens/meditation.dart';

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
                  color: Color(0xff392513),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: meditationTypes.length,
                  itemBuilder: (context, index) {
                    final meditation = meditationTypes[index];
                    return Padding(
                      padding: EdgeInsets.only(
                        left: screenHeight * 0.02,
                        right: screenHeight * 0.02,
                        top: screenHeight * 0.02,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Meditation(
                                name: meditation.name,
                                explanation: meditation.explanation,
                                backgroundImage: meditation.backgroundImage,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xffE8E1C6),
                          ),
                          height: screenHeight * 0.23,
                          child: Padding(
                            padding: EdgeInsets.all(screenHeight * 0.02),
                            child: Row(
                              children: [
                                Image.asset(
                                  meditation.image,
                                  width: screenWidth * 0.4,
                                  height:
                                      screenHeight * 0.23, // Now works properly
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Unlock ${meditation.name}",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: screenHeight * 0.025,
                                        ),
                                      ),
                                      Text(
                                        meditation.description,
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                          fontSize: screenHeight * 0.0145,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
