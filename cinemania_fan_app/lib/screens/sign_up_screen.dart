import 'package:cinemania_fan_app/reusable_widgets.dart';
import 'package:cinemania_fan_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget{
  const SignUpScreen ({Key? key}): super(key: key);

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
        title: Text('Sign Up'),
      ),
      body: 
      Container(
        child: SingleChildScrollView(
      child :Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            reusableTextfield("First Name", Icons.person_outline,false, _firstNameTextController),
            const SizedBox(
              height: 30,
            ),
            reusableTextfield("Last Name", Icons.person_outline,false, _lastNameTextController),
            const SizedBox(
              height: 30,
            ),
            reusableTextfield("Email", Icons.person_outline,false, _emailTextController),
            const SizedBox(
              height: 30,
            ),
            reusableTextfield("Password", Icons.person_outline,false, _passwordTextController),
            const SizedBox(
              height: 30,
            ),
            reusableTextfield("Confirm Password", Icons.person_outline,false, _confirmPasswordTextController),
         
            const SizedBox(
              height: 30,
            ),
            signIn_signUp_button(context, false, (){
              Navigator.push(context,
              MaterialPageRoute(builder: (context) => HomeScreen()));
            }),
          ],
        ),
      )
      )
      ),
    );
  }
}

