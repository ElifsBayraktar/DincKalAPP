import 'package:flutter/material.dart';

import 'login.dart';

// ignore: camel_case_types
class splashscreen extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const splashscreen({Key? key});

  @override
  // ignore: library_private_types_in_public_api
  _splashscreenState createState() => _splashscreenState();
}

// ignore: camel_case_types
class _splashscreenState extends State<splashscreen> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    children: [
                      Image.asset(
                        contents[i].image,
                        height: 500,
                      ),
                      Text(
                        contents[i].title,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              contents.length,
              (index) => buildDot(index, context),
            ),
          ),
          const SizedBox(height: 10), // Butonlar arasında boşluk ekleyin
          Container(
            height: 85,
            margin: const EdgeInsets.all(50),
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                if (currentIndex == contents.length - 1) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const LoginScreen(),
                    ),
                  );
                } else {
                  _controller.animateToPage(
                    2, // 3. sayfa indeksi
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.easeInOut,
                  );
                }
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(null), // Boşaltıldı
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                overlayColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return const Color(
                        0xFF1E236B); // Butona tıklandığında rengi
                  }
                  return Colors.transparent; // Buton normalde şeffaf
                }),
              ),
              child: Ink(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 99, 108, 240),
                      Color.fromARGB(196, 93, 99, 187),
                      Color(0xFF1E236B),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  constraints:
                      const BoxConstraints(minWidth: 88, minHeight: 36),
                  alignment: Alignment.center,
                  child: Text(
                    currentIndex == contents.length - 1 ? "Continue" : "Next",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFF1E236B),
      ),
    );
  }
}

class UnbordingContent {
  String image;
  String title;

  UnbordingContent({
    required this.image,
    required this.title,
  });
}

List<UnbordingContent> contents = [
  UnbordingContent(
    title: 'stay healthy',
    image: 'assets/images/welcome.jpeg',
  ),
  UnbordingContent(
    title: 'looks fit',
    image: 'assets/images/welcome2.jpeg',
  ),
  UnbordingContent(
    title: 'be happy',
    image: 'assets/images/welcome3.jpeg',
  ),
];
