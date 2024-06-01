// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../view/home/home.dart';

import 'Exercise_page.dart';
import 'profile.dart';

// ignore: use_key_in_widget_constructors
class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationsEnabled = true;
  String _selectedLanguage = 'English';
  int _selectedIndex = 0;

  // İlgili sayfaların listesi
  final List<Widget> _screens = [
    HomeScreen(), // Home screen
    ExerciseScreen(), // Exercise screen
    ProfileScreen(), // Profile screen
    SettingsPage(), // Settings screen
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
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF1E236B),
              Color.fromARGB(196, 93, 99, 187),
              Color(0xFF1E236B),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const Text(
                    'Settings',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 48), // Placeholder for alignment
                ],
              ),
            ),
            ListTile(
              title: const Text(
                'Enable Notifications',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              trailing: Switch(
                value: _notificationsEnabled,
                onChanged: (bool value) {
                  setState(() {
                    _notificationsEnabled = value;
                  });
                },
                activeColor: Colors.white,
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: Colors.white30,
              ),
            ),
            ListTile(
              title: const Text(
                'Language',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              trailing: DropdownButton<String>(
                dropdownColor: Colors.black,
                value: _selectedLanguage,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedLanguage = newValue!;
                  });
                },
                items: <String>[
                  'English',
                  'Spanish',
                  'French',
                  'German',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(color: Colors.white),
                    ),
                  );
                }).toList(),
              ),
            ),
            ListTile(
              title: const Text('Account',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
              trailing:
                  const Icon(Icons.arrow_forward_ios, color: Colors.white),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AccountSettingsPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Privacy',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
              trailing:
                  const Icon(Icons.arrow_forward_ios, color: Colors.white),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PrivacySettingsPage()),
                );
              },
            ),
          ],
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

// ignore: use_key_in_widget_constructors
class AccountSettingsPage extends StatefulWidget {
  @override
  _AccountSettingsPageState createState() => _AccountSettingsPageState();
}

class _AccountSettingsPageState extends State<AccountSettingsPage> {
  String _username = 'JohnDoe';
  String _email = 'john.doe@example.com';
  double _weight = 70.0; // in kg
  // ignore: prefer_final_fields
  double _height = 165.0; // in cm
  // ignore: prefer_final_fields
  String _gender = 'Female';
  int _selectedIndex = 0;

  // İlgili sayfaların listesi
  final List<Widget> _screens = [
    HomeScreen(), // Home screen
    ExerciseScreen(), // Exercise screen
    ProfileScreen(), // Profile screen
    SettingsPage(), // Settings screen
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

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _usernameController.text = _username;
    _weightController.text = _weight.toString();
  }

  void _editUsername() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Username'),
          content: TextField(
            controller: _usernameController,
            decoration: const InputDecoration(
              labelText: 'Username',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  _username = _usernameController.text;
                });
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _editEmail() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Email'),
          content: TextField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  _email = _emailController.text;
                });
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _editWeight() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Weight'),
          content: TextField(
            controller: _weightController,
            decoration: const InputDecoration(
              labelText: 'Weight (kg)',
            ),
            keyboardType: TextInputType.number,
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  _weight = double.tryParse(_weightController.text) ?? _weight;
                });
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF1E236B),
              Color.fromARGB(196, 93, 99, 187),
              Color(0xFF1E236B),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const Text(
                    'Account Settings',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 48), // Placeholder for alignment
                ],
              ),
            ),
            _buildInfoTile(
              'Username',
              _username,
              Icons.edit,
              _editUsername,
            ),
            const SizedBox(
              height: 5,
            ),
            _buildInfoTile('Email', _email, Icons.edit, _editEmail),
            const SizedBox(
              height: 5,
            ),
            _buildInfoTile(
              'Weight (kg)',
              _weight.toString(),
              Icons.edit,
              _editWeight,
            ),
            const SizedBox(
              height: 5,
            ),
            _buildInfoTile(
              'Height (cm)',
              _height.toString(),
              null,
              null,
            ),
            const SizedBox(
              height: 5,
            ),
            _buildInfoTile(
              'Gender',
              _gender,
              null,
              null,
            ),
          ],
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

  ListTile _buildInfoTile(
      String title, String value, IconData? icon, Function()? onTap) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 19,
        ),
      ),
      subtitle: Text(
        value,
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 17,
        ),
      ),
      trailing: icon != null
          ? IconButton(
              icon: Icon(icon, color: Colors.white),
              onPressed: onTap,
            )
          : null,
      onTap: onTap,
    );
  }
}

// ignore: use_key_in_widget_constructors
class PrivacySettingsPage extends StatefulWidget {
  @override
  _PrivacySettingsPageState createState() => _PrivacySettingsPageState();
}

class _PrivacySettingsPageState extends State<PrivacySettingsPage> {
  bool _locationTrackingEnabled = false;
  bool _dataSharingEnabled = true;
  bool _accountPrivate = false;
  int _selectedIndex = 0;

  // İlgili sayfaların listesi
  final List<Widget> _screens = [
    HomeScreen(), // Home screen
    ExerciseScreen(), // Exercise screen
    ProfileScreen(), // Profile screen
    SettingsPage(), // Settings screen
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
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF1E236B),
              Color.fromARGB(196, 93, 99, 187),
              Color(0xFF1E236B),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const Text(
                    'Privacy Settings',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 48), // Placeholder for alignment
                ],
              ),
            ),
            _buildPrivacyTile(
              'Location Tracking',
              _locationTrackingEnabled,
              (bool value) {
                setState(() {
                  _locationTrackingEnabled = value;
                });
              },
            ),
            _buildPrivacyTile(
              'Data Sharing',
              _dataSharingEnabled,
              (bool value) {
                setState(() {
                  _dataSharingEnabled = value;
                });
              },
            ),
            _buildPrivacyTile(
              'Account Private',
              _accountPrivate,
              (bool value) {
                setState(() {
                  _accountPrivate = value;
                });
              },
            ),
            ListTile(
              title: const Text(
                'Clear Search History',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.white),
                onPressed: () {
                  // Clear search history logic
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Search history cleared'),
                    ),
                  );
                },
              ),
            ),
          ],
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

  ListTile _buildPrivacyTile(
      String title, bool value, Function(bool) onChanged) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: Colors.white,
        inactiveThumbColor: Colors.white,
        inactiveTrackColor: Colors.white30,
      ),
    );
  }
}

// Blocked Users Management Sayfası
