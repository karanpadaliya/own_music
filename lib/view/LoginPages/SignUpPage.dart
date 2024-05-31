import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/services.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  //For Password Visible
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> fKey = GlobalKey<FormState>();
    TextEditingController NameController = TextEditingController();
    TextEditingController MobileController = TextEditingController();
    TextEditingController PinController = TextEditingController();

    bool isInvalidCredentials = false;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xff004aad),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
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
                  height: 450,
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
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.edit_note_outlined,
                                size: 35,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "SignUp",
                                style: TextStyle(
                                  fontSize: 25,
                                  // fontFamily: "TAS",
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: NameController,
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            maxLength: 20,
                            // maxLengthEnforcement: MaxLengthEnforcement.none,
                            decoration: InputDecoration(
                              label: Text(
                                "Name",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              counterText: '',
                              // use is not visible maxLength in UI
                              border: UnderlineInputBorder(),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xff004aad),
                                ),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: isInvalidCredentials
                                        ? Colors.red
                                        : CupertinoColors.black),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          TextFormField(
                            controller: NameController,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            maxLength: 50,
                            // maxLengthEnforcement: MaxLengthEnforcement.none,
                            decoration: InputDecoration(
                              label: Text(
                                "Email",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              counterText: '',
                              // use is not visible maxLength in UI
                              border: UnderlineInputBorder(),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xff004aad),
                                ),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: isInvalidCredentials
                                        ? Colors.red
                                        : CupertinoColors.black),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8,
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
                              border: UnderlineInputBorder(),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xff004aad),
                                ),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
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
                              border: UnderlineInputBorder(),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xff004aad),
                                ),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
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
                              Navigator.pushReplacementNamed(
                                  context, "LoginPage");
                            },
                            child: Text("SignUp"),
                            style: FilledButton.styleFrom(
                              backgroundColor: Color(0xff004aad),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
