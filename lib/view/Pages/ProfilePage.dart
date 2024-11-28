import 'package:flutter/material.dart';
import 'package:own_music/view/Pages/LoginPages/LoginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Controllers for TextFormFields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController pinController = TextEditingController();

  // Variable to toggle pin visibility
  bool obscurePin = true;

  @override
  void initState() {
    super.initState();
    _loadProfileDetails();
  }

  Future<void> _loadProfileDetails() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      nameController.text = prefs.getString('name') ?? '';
      emailController.text = prefs.getString('email') ?? '';
      mobileController.text = prefs.getString('mobile') ?? '';
      pinController.text = prefs.getString('pin') ?? '';
    });
  }

  Future<void> _saveProfileDetails() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', nameController.text);
    await prefs.setString('email', emailController.text);
    await prefs.setString('mobile', mobileController.text);
    await prefs.setString('pin', pinController.text);
    // Clear SharedPreferences
    // SharedPreferences.getInstance().then((prefs) {
    //   prefs.clear();
    // Navigate back to the login screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  void _editProfile() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Profile'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                ),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                TextFormField(
                  controller: mobileController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Mobile'),
                ),
                TextFormField(
                  controller: pinController,
                  obscureText: obscurePin, // Use the variable to toggle
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Pin'),
                ),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                _saveProfileDetails();
              },
              child: const Text('Save'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color(0xff004aad),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.red,
              ),
            ),
          ],
        );
      },
    );
  }

  void _logout() {
    // Clear SharedPreferences
    SharedPreferences.getInstance().then((prefs) {
      prefs.clear();
      // Navigate back to the login screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff4aad),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 400,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(0.4),
                Colors.white.withOpacity(0.2),
              ],
              begin: Alignment.bottomLeft,
            ),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(color: Colors.white),
                ),
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 19,
                    fontWeight: FontWeight.w500),
                enabled: false,
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.white),
                ),
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 19,
                    fontWeight: FontWeight.w500),
                enabled: false,
              ),
              TextFormField(
                controller: mobileController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Mobile',
                  labelStyle: TextStyle(color: Colors.white),
                ),
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 19,
                    fontWeight: FontWeight.w500),
                enabled: false,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: pinController,
                      obscureText: obscurePin,
                      // Use the variable to toggle
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Pin',
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 19,
                          fontWeight: FontWeight.w500),
                      enabled: false,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        obscurePin = !obscurePin;
                      });
                    },
                    icon: Icon(
                        obscurePin ? Icons.visibility_off : Icons.visibility),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: _editProfile,
                    child: const Row(
                      children: [
                        Text('Edit'),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(Icons.edit_note)
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color(0xff004aad),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _logout,
                    child: const Row(
                      children: [
                        Text('Logout'),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(Icons.logout)
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
