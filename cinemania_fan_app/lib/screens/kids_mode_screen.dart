
import 'package:cinemania_fan_app/screens/home_screen.dart';
import 'package:cinemania_fan_app/screens/kids_search_screen.dart';

import 'package:cinemania_fan_app/widgets/media_slider.dart';
import 'package:cinemania_fan_app/widgets/side_menu.dart';
import 'package:cinemania_fan_app/widgets/trending_slider.dart';
import 'package:flutter/material.dart';
import 'package:cinemania_fan_app/models/movie.dart'; // Assuming you have a Movie model
import 'package:cinemania_fan_app/api/api.dart';
import 'package:google_fonts/google_fonts.dart'; // Assuming you have an API class to handle requests

class KidsScreen extends StatefulWidget {
  const KidsScreen({Key? key}) : super(key: key);

  @override
  State<KidsScreen> createState() => _KidsScreenState();
}

class _KidsScreenState extends State<KidsScreen> {
  late Future<List<Media>> kidsMedia;
  late Future<List<Media>> kidsMovies;
  late Future<List<Media>> kidsTv;
  bool _isKidsModeEnabled = false;

  @override
  void initState() {
    super.initState();
   // kidsMedia = Api().getKidsMedia(10751);
    kidsMovies = Api().getKidsMovies(10751);
    kidsTv = Api().getKidsTvSeries(10751); // Implement this method in your API class
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       drawer: SideMenu(
        isKidsModeEnabled: !_isKidsModeEnabled,
        onKidsModeChanged: (value) {
          setState(() {
            _isKidsModeEnabled = value;
            if (!_isKidsModeEnabled) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            }
          });
        },
      ),
     appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset(
          'assets/images/nameLogo.png',
          fit: BoxFit.cover,
          height: 40,
          filterQuality: FilterQuality.high,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              // Navigate to the search screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => KidsSearchScreen()),
              );
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      
      body: SingleChildScrollView
      (
        physics: const BouncingScrollPhysics(),
        child: Padding
        (
          padding: const EdgeInsets.all(8.0),
          child: Column
          (
             crossAxisAlignment: CrossAxisAlignment.start,
            children: 
            [
              
              const SizedBox(height: 32),
              SizedBox(
                child: FutureBuilder(
                  future: kidsMovies,
                  builder: (context,snapshot){
                    if (snapshot.hasError){
                      return Center(child: Text(snapshot.error.toString()),
                      );
                    }
                    else if(snapshot.hasData)
                    {
                      // final data = snapshot.data;
                      return  TrendingSlider(snapshot: snapshot,);
                    }
                    else{
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                  
                ),
              ),

              const SizedBox(height: 32),
              Text
              (
                'Kids Movies',
                style: GoogleFonts.aBeeZee
                (
                  fontSize: 25,
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                child: FutureBuilder(
                  future: kidsMovies,
                  builder: (context,snapshot){
                    if (snapshot.hasError){
                      return Center(child: Text(snapshot.error.toString()),
                      );
                    }
                    else if(snapshot.hasData)
                    {
                      // final data = snapshot.data;
                      return  MediaSlider(snapshot: snapshot,);
                    }
                    else{
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),

              const SizedBox(height: 32),
              Text
              (
                'Kids Tv Series',
                style: GoogleFonts.aBeeZee
                (
                  fontSize: 25,
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                child: FutureBuilder(
                  future: kidsTv,
                  builder: (context,snapshot){
                    if (snapshot.hasError){
                      return Center(child: Text(snapshot.error.toString()),
                      );
                    }
                    else if(snapshot.hasData)
                    {
                      // final data = snapshot.data;
                      return  MediaSlider(snapshot: snapshot,);
                    }
                    else{
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ]
         )
         )
         )
          );
  }
}