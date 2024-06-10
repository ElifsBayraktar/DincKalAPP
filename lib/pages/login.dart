import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'complete_profile.dart';
import 'register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

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
              Color.fromARGB(255, 99, 108, 240),
              Color(0xFF1E236B),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 25,
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Giriş",
                    style: TextStyle(color: Colors.white, fontSize: 45),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    "Hoşgeldiniz",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(70),
                    topRight: Radius.circular(70),
                  ),
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 90,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xFF1E236B),
                            blurRadius: 20,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.blueGrey,
                                ),
                              ),
                            ),
                            child: TextField(
                              controller: _usernameController,
                              decoration: const InputDecoration(
                                hintText: "Kullanıcı Adı",
                                hintStyle: TextStyle(color: Colors.blueGrey),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xFF1E236B),
                            blurRadius: 20,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.blueGrey,
                                ),
                              ),
                            ),
                            child: TextField(
                              controller: _passwordController,
                              obscureText: true,
                              decoration: const InputDecoration(
                                hintText: "Parola",
                                hintStyle: TextStyle(color: Colors.blueGrey),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 150,
                    ),
                    const Text(
                      "Şifremi Hatırlamıyorum",
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    GestureDetector(
                      onTap: () {
                        String username = _usernameController.text;
                        String password = _passwordController.text;
                        _saveUserData(username, password);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CompleteProfileView(),
                          ),
                        );
                      },
                      child: Container(
                        height: 50,
                        margin: const EdgeInsets.symmetric(horizontal: 50),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color.fromARGB(255, 99, 108, 240),
                              Color.fromARGB(196, 93, 99, 187),
                              Color(0xFF1E236B),
                            ],
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            "Giriş Yap",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "Hesap Oluştur?",
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _saveUserData(String username, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', username);
    prefs.setString('password', password);
  }
}
