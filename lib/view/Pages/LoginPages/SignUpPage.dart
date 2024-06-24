import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // For Password Visibility
  bool isPassword = true;

  // Controllers for TextFormFields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController pinController = TextEditingController();

  // GlobalKey for Form
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // For Invalid Credentials
  bool isInvalidCredentials = false;

  // Save Details to SharedPreferences
  Future<void> saveDetails() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', nameController.text);
    await prefs.setString('email', emailController.text);
    await prefs.setString('mobile', mobileController.text);
    await prefs.setString('pin', pinController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xff004aad),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/Logo_png.png",
                      color: Colors.white,
                      height: 150,
                    ),
                    SizedBox(height: 50),
                    Container(
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
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.edit_note_outlined, size: 35),
                                SizedBox(width: 5),
                                Text(
                                  "SignUp",
                                  style: TextStyle(fontSize: 25),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              controller: nameController,
                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.next,
                              maxLength: 20,
                              textCapitalization: TextCapitalization.words,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your name';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                label: Text(
                                  "Name",
                                  style: TextStyle(color: Colors.black),
                                ),
                                counterText: '',
                                border: UnderlineInputBorder(),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xff004aad)),
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            TextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              maxLength: 50,
                              textCapitalization: TextCapitalization.words,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                    .hasMatch(value)) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                label: Text(
                                  "Email",
                                  style: TextStyle(color: Colors.black),
                                ),
                                counterText: '',
                                border: UnderlineInputBorder(),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xff004aad)),
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            TextFormField(
                              controller: mobileController,
                              keyboardType: TextInputType.phone,
                              textInputAction: TextInputAction.next,
                              maxLength: 10,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your mobile number';
                                } else if (value.length != 10) {
                                  return 'Mobile number must be 10 digits';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                label: Text(
                                  "Mobile No",
                                  style: TextStyle(color: Colors.black),
                                ),
                                counterText: '',
                                border: UnderlineInputBorder(),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xff004aad)),
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            TextFormField(
                              controller: pinController,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.done,
                              maxLength: 4,
                              obscureText: isPassword,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a PIN';
                                } else if (value.length != 4) {
                                  return 'PIN must be 4 digits';
                                }
                                return null;
                              },
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
                                  style: TextStyle(color: Colors.black),
                                ),
                                counterText: '',
                                border: UnderlineInputBorder(),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xff004aad)),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  saveDetails();
                                  Navigator.pushReplacementNamed(
                                      context, "LoginPage");
                                } else {
                                  setState(() {
                                    isInvalidCredentials = true;
                                  });
                                }
                              },
                              child: Text(
                                "SignUp",
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xff004aad),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
