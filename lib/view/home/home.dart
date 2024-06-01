import 'package:dinckallapp/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../pages/Exercise_page.dart';
import '../../pages/settings_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // İlgili sayfaların listesi
  final List<Widget> _screens = [
    HomeScreen(),
    ExerciseScreen(),
    ProfileScreen(),
    SettingsPage(),
    // Profile screen
    // Settings screen
  ];

  void _onTabChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => _screens[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1E236B),
              Color.fromARGB(196, 93, 99, 187),
              Color(0xFF1E236B),
            ],
          ),
        ),
        child: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome Back",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                    Text(
                      "Elifs.Bayraktar",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 29,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/welcome.jpeg'),
                      radius: 35,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: GNav(
        backgroundColor: Colors.white,
        color: const Color(0xFF1E236B),
        activeColor: const Color(0xFF1E236B),
        tabBackgroundColor: Colors.white,
        padding: const EdgeInsets.all(30),
        gap: 10,
        selectedIndex: _selectedIndex,
        onTabChange: _onTabChange,
        tabs: const [
          GButton(
            icon: Icons.home,
            text: "Home",
          ),
          GButton(
            icon: Icons.fitness_center,
            text: "Exercise",
          ),
          GButton(
            icon: Icons.person,
            text: "Profile",
          ),
          GButton(
            icon: Icons.settings,
            text: "Settings",
          ),
        ],
      ),
    );
  }
}
