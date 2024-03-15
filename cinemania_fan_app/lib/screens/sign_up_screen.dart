import 'package:cinemania_fan_app/reusable_widgets.dart'; 
import 'package:cinemania_fan_app/screens/sign_in_screen.dart';
import 'package:cinemania_fan_app/screens/user_configuration_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _firstNameTextController = TextEditingController();
  TextEditingController _lastNameTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _confirmPasswordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Image.asset(
          'assets/images/nameLogo.png',
          fit: BoxFit.cover,
          height: 40,
          filterQuality: FilterQuality.high,
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 30),
                reusableTextfield("First Name", Icons.person_outline, false, _firstNameTextController),
                const SizedBox(height: 30),
                reusableTextfield("Last Name", Icons.person_outline, false, _lastNameTextController),
                const SizedBox(height: 30),
                reusableTextfield("Email", Icons.person_outline, false, _emailTextController),
                const SizedBox(height: 30),
                reusableTextfield("Password", Icons.lock_outline, false, _passwordTextController),
                const SizedBox(height: 30),
                reusableTextfield("Confirm Password", Icons.lock_outline, false, _confirmPasswordTextController),
                const SizedBox(height: 30),
                signIn_signUp_button(context, false, () async {
                  if (_passwordTextController.text == _confirmPasswordTextController.text) {
                    try {
                      await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: _emailTextController.text.trim(),
                        password: _passwordTextController.text.trim(),
                      );
                      showSnackBar("Account created successfully", Colors.green);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ConfigurationScreen()));
                    } on FirebaseAuthException catch (e) {
                      showSnackBar(e.message ?? "Failed to create account", Colors.red);
                    }
                  } else {
                    showSnackBar("Passwords do not match", Colors.red);
                  }
                }),
                signInOption(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showSnackBar(String message, Color color) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: color,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Row signInOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("I am a user. ", style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen()));
          },
          child: const Text(
            " Log In",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
