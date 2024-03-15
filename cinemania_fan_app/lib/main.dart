import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cinemania_fan_app/colors.dart';
import 'package:cinemania_fan_app/firebase_options.dart';
import 'package:cinemania_fan_app/screens/sign_in_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
    runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
     title: 'Cinemania',
     theme: ThemeData.dark().copyWith(
      scaffoldBackgroundColor: Colours.scaffoldBgColor,
      useMaterial3: true,
     ),
    //  home:const HomeScreen(),
     home:AnimatedSplashScreen(
      splash:
       Image.asset('assets/images/Cinemania.png'),
       duration: 3000,
       splashTransition: SplashTransition.fadeTransition,
       backgroundColor: Colors.black,
    
    nextScreen: SignInScreen()),
    );
  }
}