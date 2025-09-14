import 'package:flutter/material.dart';
import 'package:meditation_app/screens/home.dart';
import 'package:meditation_app/screens/meditation_types.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int selectedIndex = 0;
  // To keep track of the selected page
  void navigateBottomBar(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double navHeight = 74; // tweak as needed
    final double horizontalMargin = 18;

    final List pages = [
      //Home
      Home(onNavigate: navigateBottomBar),
      //Meditation types
      MeditationTypes(),
    ];
 
    return Scaffold(
      backgroundColor: const Color(0xFFF9F5EC),
      body: pages[selectedIndex],

      // Put the custom pill into Scaffold.bottomNavigationBar so it is fixed
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: EdgeInsets.only(
            left: horizontalMargin,
            right: horizontalMargin,
            bottom: 12, // distance above the system gesture area
          ),
          child: Container(
            height: navHeight,
            decoration: BoxDecoration(
              color: const Color(0xFFEFE9D7), // pill background
              borderRadius: BorderRadius.circular(40),
              // no boxShadow -> removes any dark shadow under the bar
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment is center by default -> perfectly vertically centered
              children: [
                // Left icon (Home)
                _NavIcon(
                  isSelected: selectedIndex == 0,
                  onTap: () {
                    setState(() => selectedIndex = 0);
                    // if you instead want to push a new screen, do:
                    // Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
                  },
                  icon: Icons.home_rounded,
                ),

                // Right icon (Meditation)
                _NavIcon(
                  isSelected: selectedIndex == 1,
                  onTap: () {
                    setState(() => selectedIndex = 1);
                    // If you prefer to open MeditationTypes as a new route:
                    // Navigator.push(context, MaterialPageRoute(builder: (_) => MeditationTypes()));
                  },
                  icon: Icons.self_improvement_rounded,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// small reusable widget for icon + circular selected background
class _NavIcon extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;
  final IconData icon;

  const _NavIcon({
    required this.isSelected,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    // Use Material + InkWell to get ripple if desired
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(999),
          onTap: onTap,
          child: SizedBox(
            width: 56, // how much horizontal tap area each icon has
            height: double
                .infinity, // so the child centers vertically inside the pill
            child: Center(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                width: isSelected ? 48 : 44,
                height: isSelected ? 48 : 44,
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color.fromARGB(
                          60,
                          162,
                          129,
                          44,
                        ) // translucent circle
                      : Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 24, color: Colors.black),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
