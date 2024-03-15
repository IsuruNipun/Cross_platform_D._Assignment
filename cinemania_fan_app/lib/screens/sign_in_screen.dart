
import 'package:cinemania_fan_app/reusable_widgets.dart';
import 'package:cinemania_fan_app/screens/sign_up_screen.dart';
import 'package:cinemania_fan_app/screens/user_configuration_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget('assets/images/Cinemania.png'),
                SizedBox(
                  height: 30,
                ),
                reusableTextfield("Enter Email", Icons.person_outline,false, _emailTextController),
                SizedBox(
                  height: 30,
                ),
                reusableTextfield("Enter Password", Icons.lock_outline,false, _passwordTextController),
                SizedBox(
                  height: 30,
                ),
                
                signIn_signUp_button(context, true, () async {
                  var connectivityResult = await (Connectivity().checkConnectivity());
                  if (connectivityResult == ConnectivityResult.none) {
                    // No internet connection
                    showSnackBar("No internet connection. Please connect and try again.", Colors.red);
                  } else {
                    // There is an internet connection
                    try {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: _emailTextController.text,
                        password: _passwordTextController.text,
                      );
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ConfigurationScreen()));
                      showSnackBar("Successfully signed in", Colors.green);
                    } on FirebaseAuthException catch (e) {
                      showSnackBar(e.message ?? "Failed to sign in", Colors.red);
                    } catch (e) {
                      showSnackBar("An error occurred", Colors.red);
                    }
                  }
                }),
                signUpOption(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account?", style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: const Text(
            "Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  void showSnackBar(String message, Color color) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: color,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
