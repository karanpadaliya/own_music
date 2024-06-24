import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:local_auth/local_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // For Password Visibility
  bool isPassword = true;

  // GlobalKey for Form
  final GlobalKey<FormState> fKey = GlobalKey<FormState>();

  // Controllers for TextFormFields
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController pinController = TextEditingController();

  // For Invalid Credentials
  bool isInvalidCredentials = false;

  // Biometric Authentication
  final LocalAuthentication auth = LocalAuthentication();

  // Retrieve Sign-Up Details from SharedPreferences
  Future<Map<String, String?>> getSignUpDetails() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString('name');
    final email = prefs.getString('email');
    final mobile = prefs.getString('mobile');
    final pin = prefs.getString('pin');
    return {'name': name, 'email': email, 'mobile': mobile, 'pin': pin};
  }

  // Validate Login Credentials
  Future<void> validateAndLogin() async {
    final signUpDetails = await getSignUpDetails();
    final mobile = signUpDetails['mobile'];
    final pin = signUpDetails['pin'];

    if (mobileController.text == mobile && pinController.text == pin) {
      Navigator.pushReplacementNamed(context, "MainPage");
    } else {
      setState(() {
        isInvalidCredentials = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Invalid credentials, please try again.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  // Authenticate with Biometric
  Future<void> authenticateWithBiometrics() async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(
        localizedReason: 'Scan your fingerprint to authenticate',
        options: const AuthenticationOptions(
          biometricOnly: true,
        ),
      );
    } catch (e) {
      print(e);
    }

    if (authenticated) {
      final signUpDetails = await getSignUpDetails();
      final mobile = signUpDetails['mobile'];
      final pin = signUpDetails['pin'];
      if (mobile != null && pin != null) {
        setState(() {
          mobileController.text = mobile;
          pinController.text = pin;
        });
        validateAndLogin();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
              SizedBox(height: 50),
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
                            style: TextStyle(fontSize: 30),
                          ),
                          SizedBox(width: 15),
                          SizedBox(
                            height: 40,
                            width: 35,
                            child: Image.asset(
                                "assets/images/SplashScreenIcon/LoginIcon.png"),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: mobileController,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        maxLength: 10,
                        decoration: InputDecoration(
                          label: Text(
                            "Mobile No",
                            style: TextStyle(color: Colors.black),
                          ),
                          counterText: '',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff004aad)),
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
                        controller: pinController,
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
                            style: TextStyle(color: Colors.black),
                          ),
                          counterText: '',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff004aad)),
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
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          if (fKey.currentState!.validate()) {
                            validateAndLogin();
                          }
                        },
                        child: Text(
                          "LogIn",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff004aad),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          authenticateWithBiometrics();
                        },
                        icon: Icon(Icons.fingerprint, size: 40),
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
                              style: TextStyle(color: Color(0xff004aad)),
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
