import 'package:dinckallapp/view/home/home.dart';
import 'package:flutter/material.dart';

import 'pages/welcome.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: Splashscreen());
  }
}
