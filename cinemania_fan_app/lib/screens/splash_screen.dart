import 'package:cinemania_fan_app/auth_gate.dart';
import 'package:cinemania_fan_app/screens/home_screen.dart';
import 'package:cinemania_fan_app/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget{
  const Splash({Key? key}) : super(key:key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState(){
    super.initState();
    _navigatehome();
  }

  _navigatehome()async{
    await Future.delayed(Duration(seconds: 3),() {});
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> AuthGate()));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SignInScreen()));
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                
                height: 100, width: 100,color: Colors.black,),
              Container(
                child: Text(
                  'splash scrren',style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold
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