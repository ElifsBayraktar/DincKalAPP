import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../pages/exercise_page.dart';
import '../../pages/profile.dart';
import '../../pages/settings_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  String _username = '';

  // İlgili sayfaların listesi
  final List<Widget> _screens = [
    HomeScreen(),
    ExerciseScreen(),
    ProfileScreen(),
    SettingsPage(),
    // Profile screen
    // Settings screen
  ];

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  Future<void> _loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _username = prefs.getString('username') ?? '';
    });
  }

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
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Hoşgeldiniz",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                    Text(
                      _username, // Kullanıcı adını burada gösteriyoruz
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 29,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Dinç Kal App'e hoş geldin. Dilersen antrenmanları inceleyebilir veya sadece fit yemek tariflerine bakabilirsin.",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/images/göğüs.jpeg',
                              width: 500,
                              height: 500,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/images/fityemek.jpeg',
                              width: 500,
                              height: 500,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
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
            text: "Ana Sayfa",
          ),
          GButton(
            icon: Icons.fitness_center,
            text: "Egzersiz",
          ),
          GButton(
            icon: Icons.person,
            text: "Profil",
          ),
          GButton(
            icon: Icons.settings,
            text: "Ayarlar",
          ),
        ],
      ),
    );
  }
}
