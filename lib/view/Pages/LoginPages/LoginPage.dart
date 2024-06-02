import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //For Password Visible
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> fKey = GlobalKey<FormState>();
    TextEditingController MobileController = TextEditingController();
    TextEditingController PinController = TextEditingController();

    bool isInvalidCredentials = false;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xff004aad),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/Logo_png.png",
                color: Colors.white,
                height: 150,
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                height: 430,
                width: 330,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xfff4f4f4).withOpacity(0.9),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 50,
                      color: CupertinoColors.systemGrey,
                      blurStyle: BlurStyle.outer,
                    ),
                  ],
                ),
                child: Form(
                  key: fKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Text(
                            "LogIn",
                            style: TextStyle(
                              fontSize: 30,
                              // fontFamily: "TAS",
                            ),
                          ),
                          SizedBox(width: 15,),
                          SizedBox(
                            height: 40,width: 35,
                            child: Image.asset(
                                "assets/images/SplashScreenIcon/LoginIcon.png"),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: MobileController,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        maxLength: 10,
                        // maxLengthEnforcement: MaxLengthEnforcement.none,
                        decoration: InputDecoration(
                          label: Text(
                            "Mobile No",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          counterText: '',
                          // use is not visible maxLength in UI
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff004aad),
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: isInvalidCredentials
                                    ? Colors.red
                                    : CupertinoColors.black),
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      TextFormField(
                        controller: PinController,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        maxLength: 4,
                        obscureText: isPassword,
                        decoration: InputDecoration(
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                isPassword = !isPassword;
                              });
                            },
                            child: Icon(isPassword
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                          label: Text(
                            "Pin",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          counterText: '',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff004aad),
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: isInvalidCredentials
                                    ? Colors.red
                                    : CupertinoColors.black),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      FilledButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "MainPage");
                        },
                        child: Text("LogIn"),
                        style: FilledButton.styleFrom(
                          backgroundColor: Color(0xff004aad),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.fingerprint,
                          size: 40,
                        ),
                      ),
                      Divider(),
                      Row(
                        children: [
                          Text("Create Account"),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "SignUpPage");
                            },
                            child: Text(
                              "SignUp",
                              style: TextStyle(
                                color: Color(0xff004aad),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 1, right: 10),
                            child: Container(
                              height: 30,
                              width: 1,
                              color: Colors.grey,
                            ),
                          ),
                          Text("Need Help"),
                          Icon(Icons.info_outline),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
