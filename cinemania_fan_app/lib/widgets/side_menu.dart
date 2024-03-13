import 'package:cinemania_fan_app/screens/sign_in_screen.dart';
import 'package:cinemania_fan_app/screens/watched_list.dart';
import 'package:cinemania_fan_app/screens/wish_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  final bool isKidsModeEnabled;
  final ValueChanged<bool> onKidsModeChanged;

  const SideMenu({
    Key? key,
    required this.isKidsModeEnabled,
    required this.onKidsModeChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
           UserAccountsDrawerHeader(
            accountName: Text('isuru nipun',
            style: TextStyle(color: Colors.black)
            ),
            accountEmail: Text('isuru@gmail.com',style: TextStyle(color: Colors.black)),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.black,
              child: ClipOval(
                child: Icon(Icons.home),
                ),
              ),
              decoration: BoxDecoration(color: Colors.white),
            ),
           ListTile(
            leading: Icon(Icons.play_arrow),
            title: Text('Watched list'),
            onTap: () {Navigator.push(context,
            MaterialPageRoute(builder: (context)=> WatchedList())); }
           ),
           ListTile(
            leading: Icon(Icons.play_arrow),
            title: Text('Wish List'),
            onTap: () {Navigator.push(context,
            MaterialPageRoute(builder: (context)=> WishList())); }
           ),
           Divider(),
           ListTile(
            title: Text('Kids Mode'),
            trailing: Switch(
              value: isKidsModeEnabled,
              onChanged: onKidsModeChanged,
            ),
          ),
           Divider(),
           ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Log Out'),
            onTap: () {
              FirebaseAuth.instance.signOut().then((value) {
                print("sign out");
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) => SignInScreen()));
              });
            },
           ),
          
          ],
        ),
    );
  }
}