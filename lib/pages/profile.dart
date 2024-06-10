import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../view/home/home.dart';
import 'exercise_page.dart';
import 'settings_page.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex = 0;
  String _username = '';
  String _emailOrPhone = '';
  String _dateOfBirth = '';
  String _weight = '';
  String _height = '';
  String _gender = '';

  final List<Widget> _screens = [
    HomeScreen(),
    ExerciseScreen(),
    ProfileScreen(),
    SettingsPage(),
  ];

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  Future<void> _getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString('name');
    String? emailOrPhone = prefs.getString('emailOrPhone');
    String? dateOfBirth = prefs.getString('dateOfBirth');
    String? weight = prefs.getString('weight');
    String? height = prefs.getString('height');
    String? gender = prefs.getString('gender');
    setState(() {
      _username = username ?? '';
      _emailOrPhone = emailOrPhone ?? '';
      _dateOfBirth = dateOfBirth ?? '';
      _weight = weight ?? '';
      _height = height ?? '';
      _gender = gender ?? '';
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
    var media = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: media.height * 0.1),
                SizedBox(height: 20),
                Text(
                  _username,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  _emailOrPhone,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      ProfileDetailRow(
                        icon: Icons.cake,
                        label: 'Doğum Tarihi',
                        value: _dateOfBirth,
                      ),
                      ProfileDetailRow(
                        icon: Icons.line_weight,
                        label: 'Kilo',
                        value: _weight + ' KG',
                      ),
                      ProfileDetailRow(
                        icon: Icons.height,
                        label: 'Boy',
                        value: _height + ' CM',
                      ),
                      ProfileDetailRow(
                        icon: Icons.transgender,
                        label: 'Cinsiyet',
                        value: _gender,
                      ),
                      ProfileDetailRow(
                        icon: Icons.email,
                        label: 'Email/Telefon',
                        value: _emailOrPhone,
                      ),
                    ],
                  ),
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

class ProfileDetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const ProfileDetailRow({
    Key? key,
    required this.icon,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 45.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.white70),
          SizedBox(width: 10),
          Text(
            '$label:',
            style: TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 10),
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
