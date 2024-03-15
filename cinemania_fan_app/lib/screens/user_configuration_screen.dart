import 'package:cinemania_fan_app/screens/kids_mode_screen.dart';
import 'package:cinemania_fan_app/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:cinemania_fan_app/screens/home_screen.dart';


class ConfigurationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Set the background color to transparent
        elevation: 0,
        leading: BackBtn(), // Add the back button widget to the leading property of the app bar
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20), //  adjust the size to create space above the image
            Image.asset('assets/images/Cinemania.png', 
              width: 200, //  adjust the size 
              height: 100, //  adjust the size 
              fit: BoxFit.cover, 
            ),
            SizedBox(height: 20),
            Text(
              'Who is using us now?',
              style: TextStyle(fontSize: 30),
            ),
            Padding(padding: const EdgeInsets.all(16.0),),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => KidsScreen()),
                    );
                  },
                  child: Text('Kids and Family',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black, 
                  ),
                  ),
                 style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black, 
                    backgroundColor: Colors.white, 
                    padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 20.0), // Custom padding
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), 
                    ),
                  ),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  child: Text('Me and Friends',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black, // Set your desired font size here
                  ),
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black, 
                    backgroundColor: Colors.white, 
                    padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 20.0), // Custom padding
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), 
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}