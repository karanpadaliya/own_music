import 'package:flutter/material.dart';
import 'package:own_music/view/MainPage.dart';
import 'package:own_music/view/Pages/IntroductionPages/SplashScreen.dart';
import 'package:own_music/view/Pages/LoginPages/LoginPage.dart';
import 'package:own_music/view/Pages/LoginPages/SignUpPage.dart';
void main() {
  runApp(const InitialPage());
}

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => SplashScreen(),
        "MainPage": (context) => MainPage(),
        "LoginPage": (context) => LoginPage(),
        "SignUpPage": (context) => SignUpPage(),
        // "SongPage": (context) => SongPage(),
        // "AudioPage": (context) => AudioPage(),
        // "VideoPage": (context) => VideoPage(),
        // "ArtistsPage": (context) => ArtistsPage(),
        // "ArtistDetailPage": (context) => ArtistDetailPage(),
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
