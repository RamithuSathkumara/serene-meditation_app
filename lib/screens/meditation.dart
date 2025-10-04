import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';

class Meditation extends StatefulWidget {
  final String name;
  final String explanation;
  final String backgroundImage;
  const Meditation({
    super.key,
    required this.name,
    required this.explanation,
    required this.backgroundImage,
  });

  @override
  State<Meditation> createState() => _MeditationState();
}

class _MeditationState extends State<Meditation> {
  String _selectedMode = "Unguided";
  int _selectedHours = 0;
  int _selectedMinutes = 0;
  bool _isRunning = false;
  late Duration _remainingTime;
  Timer? _timer;

  void _openModeSelector() {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xff4D2816),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text(
                  "Unguided",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  setState(() => _selectedMode = "Unguided");
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text(
                  "Guided Lessons (Coming Soon)",
                  style: TextStyle(color: Colors.grey),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _openTimePicker({required bool isHour}) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xff4D2816),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          height: 250,
          padding: const EdgeInsets.all(10),
          child: CupertinoPicker(
            backgroundColor: const Color(0xff4D2816),
            itemExtent: 40,
            scrollController: FixedExtentScrollController(
              initialItem: isHour ? _selectedHours : _selectedMinutes,
            ),
            onSelectedItemChanged: (value) {
              setState(() {
                if (isHour) {
                  _selectedHours = value;
                } else {
                  _selectedMinutes = value;
                }
              });
            },
            children: List.generate(
              isHour ? 13 : 60,
              (index) => Center(
                child: Text(
                  index.toString().padLeft(2, '0'),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _startTimer() {
    if (_selectedHours == 0 && _selectedMinutes == 0) return;

    setState(() {
      _isRunning = true;
      _remainingTime = Duration(
        hours: _selectedHours,
        minutes: _selectedMinutes,
      );
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime.inSeconds > 0) {
          _remainingTime -= const Duration(seconds: 1);
        } else {
          timer.cancel();
          _isRunning = false;
        }
      });
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    setState(() => _isRunning = false);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(
      context,
    ).size.width; // screen width for responsiveness
    final screenHeight = MediaQuery.of(context).size.height;

    String timeDisplay = _isRunning
        ? "${_remainingTime.inHours.toString().padLeft(2, '0')}:${(_remainingTime.inMinutes % 60).toString().padLeft(2, '0')}:${(_remainingTime.inSeconds % 60).toString().padLeft(2, '0')}"
        : "${_selectedHours.toString().padLeft(2, '0')}:${_selectedMinutes.toString().padLeft(2, '0')}";

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  widget.backgroundImage,
                  fit: BoxFit.cover,
                  width: screenWidth,
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.34),
                    child: Container(
                      // To display the meditation name
                      decoration: BoxDecoration(
                        color: Color.fromARGB(100, 217, 217, 217),
                        borderRadius: BorderRadius.circular(29),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          widget.name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontSize: screenHeight * 0.037,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.03870292887),
            Container(
              width: screenWidth * 0.9,
              height: screenHeight * 0.2468619247,
              decoration: BoxDecoration(
                color: const Color(0xff461A04),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.all(screenHeight * 0.02092050209),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Unguided button
                  SizedBox(
                    width: screenWidth * 0.8181818182,
                    height: screenHeight * 0.05230125523,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff4D2816),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: _openModeSelector,
                      child: Text(
                        _selectedMode,
                        style: TextStyle(
                          fontSize: screenHeight * 0.02,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  // Hours + Minutes Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => _openTimePicker(isHour: true),
                        child: Container(
                          height: screenHeight * 0.05230125523,
                          width: screenWidth * 0.2045454545,
                          decoration: BoxDecoration(
                            color: const Color(0xff4D2816),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "${_selectedHours.toString().padLeft(2, '0')}h",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.05),
                      GestureDetector(
                        onTap: () => _openTimePicker(isHour: false),
                        child: Container(
                          height: screenHeight * 0.05230125523,
                          width: screenWidth * 0.2045454545,
                          decoration: BoxDecoration(
                            color: const Color(0xff4D2816),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "${_selectedMinutes.toString().padLeft(2, '0')}m",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Music + Start Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: null, // No function
                        icon: const Icon(Icons.music_note, color: Colors.white),
                      ),
                      SizedBox(width: screenWidth * 0.05),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff4D2816),
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.1,
                            vertical: screenHeight * 0.012,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        onPressed: _isRunning ? _stopTimer : _startTimer,
                        child: Text(
                          _isRunning ? "Stop" : "Start",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(screenHeight * 0.03870292887),
              child: Text(
                widget.explanation,
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: screenHeight * 0.02092050209),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
