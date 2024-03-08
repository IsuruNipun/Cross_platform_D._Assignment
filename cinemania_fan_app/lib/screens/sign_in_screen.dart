import 'package:cinemania_fan_app/reusable_widgets.dart';
import 'package:cinemania_fan_app/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SignInScreen extends StatefulWidget{
  const SignInScreen ({Key? key}): super(key: key);

  @override 
  _SignInScreenState createState() => _SignInScreenState();

}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Padding(padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height *0.2,20,0),
      //if i want to ad the logo
        child: Column(children: <Widget>[
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
          signIn_signUp_button(context, true, (){}),
          signUpOption()
        ],
        ),
        ),
      ),
    ),
    );
  }

  Row signUpOption(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Dont't have an account?",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
            MaterialPageRoute(builder: (context)=> SignUpScreen()));
            
          },
          child: const Text(
            "Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
        )
      ],
      );
  }
}