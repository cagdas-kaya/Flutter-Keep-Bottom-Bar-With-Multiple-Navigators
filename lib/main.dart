import 'package:flutter/material.dart';
import 'package:keepbottombar/app_pages/pushed_page.dart';
import 'home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom NavBar Demo',
      routes: {
        '/': (context) => HomeScreen(),
        '/pushedPage': (context) =>
            PushedPage(), //this route without bottom bar
      },
      initialRoute: '/',
    );
  }
}
