import 'package:dinckallapp/pages/welcome.dart';
import 'package:flutter/material.dart';
import 'common/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routes.generateRoute,
      initialRoute: '/',
      home: Splashscreen(),
    );
  }
}
