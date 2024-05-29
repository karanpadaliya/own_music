import 'package:flutter/material.dart';
import 'package:own_music/view/HomePage.dart';
import 'package:own_music/view/IntroductionPages/SplashScreen.dart';
import 'package:own_music/view/LoginPages/LoginPage.dart';
import 'package:own_music/view/LoginPages/SignUpPage.dart';

void main() {
  runApp(const MainPage());
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => SplashScreen(),
        "HomePage": (context) => HomePage(),
        "LoginPage": (context) => LoginPage(),
        "SignUpPage": (context) => SignUpPage(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text(
                "onUnknownRoute",
                style: TextStyle(fontSize: 40, color: Colors.black),
              ),
            ),
          ),
        );
      },
    );
  }
}
