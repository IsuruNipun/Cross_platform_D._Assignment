import 'package:cinemania_fan_app/screens/home_screen.dart';
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
    await Future.delayed(Duration(microseconds: 3000),() {});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(height: 100, width: 100,color: Colors.blue,),
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