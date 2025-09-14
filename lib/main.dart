import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meditation_app/navigation.dart';
import 'package:meditation_app/screens/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final hasSeenWelcome = prefs.getBool('hasSeenWelcome') ?? false;
  runApp(MainApp(hasSeenWelcome: hasSeenWelcome));
}

class MainApp extends StatelessWidget {
  final bool hasSeenWelcome;
  const MainApp({super.key, required this.hasSeenWelcome});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Serene',
      home: hasSeenWelcome ? NavigationMenu() : const WelcomeScreen(),
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Color(0xFFFAF9EC),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
              if (states.contains(WidgetState.pressed)) {
                return const Color(0xFF3A1300);
              }
              return const Color(0xFF461A04);
            }),
            foregroundColor: const WidgetStatePropertyAll(Color(0xFFFFFFFF)),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            ),
            textStyle: const WidgetStatePropertyAll(
              TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ),
        ),
        textTheme: GoogleFonts.poppinsTextTheme(ThemeData.light().textTheme),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
