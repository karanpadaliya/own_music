import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Color(0xff004aad),
        systemNavigationBarColor: Color(0xff004aad),
        systemNavigationBarDividerColor: Color(0xff004aad),
      ),
    );
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: double.infinity,
          color: Color(0xff004aad),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 200),
                child: Image.asset(
                  "assets/images/Logo_png.png",
                  height: 170,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: Container(
                        // color: Colors.white,
                        width: double.infinity,
                        height: 300,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 55,
                            ),
                            Text(
                              "Jab Life me chhiye Relaxment\n to OWN MUSIC hai na!!!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 25,
                                fontFamily: "TAS",
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            Spacer(),
                            Divider(indent: 20, endIndent: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 30,
                                ),
                                Icon(
                                  Icons.edit_note_outlined,
                                  size: 35,
                                  color: Colors.white,
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  height: 30,
                                  width: 1,
                                  color: Colors.white,
                                ),
                                Spacer(),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, "LoginPage");
                                  },
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                  width: 30,
                                  child: Image.asset(
                                    "assets/images/SplashScreenIcon/login.png",
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40, left: 20),
                      child: Container(
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                        ),
                        child:
                            Image.asset("assets/images/SplashScreenIcon/1.png"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 120),
                      child: Container(
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                        ),
                        child:
                            Image.asset("assets/images/SplashScreenIcon/2.png"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40, left: 220),
                      child: Container(
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                        ),
                        child:
                            Image.asset("assets/images/SplashScreenIcon/3.png"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 320),
                      child: Container(
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                        ),
                        child:
                            Image.asset("assets/images/SplashScreenIcon/4.png"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
