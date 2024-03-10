import 'package:cinemania_fan_app/api/api.dart';
import 'package:cinemania_fan_app/models/movie.dart';
import 'package:cinemania_fan_app/screens/kids_mode_screen.dart';
import 'package:cinemania_fan_app/screens/search_screen.dart';
//import 'package:cinemania_fan_app/widgets/custom_tab_bar.dart';
import 'package:cinemania_fan_app/widgets/movie_slider.dart';
import 'package:cinemania_fan_app/widgets/side_menu.dart';
import 'package:cinemania_fan_app/widgets/trending_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget 
{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> 
{
   bool _isKidsModeEnabled = false;

  late Future<List<Movie>> trendingMovies;
  late Future<List<Movie>> topRatedMovies;
  late Future<List<Movie>> upcomingMovies;

  

  @override
  void initState(){
    super.initState();
    trendingMovies = Api().getTrendingMovies();
    topRatedMovies = Api().getTopRatedMovies();
    upcomingMovies = Api().getUpcomingMovies();
    
  }

  

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      drawer: SideMenu(
        isKidsModeEnabled: _isKidsModeEnabled,
        onKidsModeChanged: (value) {
          setState(() {
            _isKidsModeEnabled = value;
            if (_isKidsModeEnabled) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => KidsScreen()),
              );
            }
          });
        },
      ),
      appBar: AppBar
      (
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset
        (
       'assets/images/Cinemania.png',
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
                MaterialPageRoute(builder: (context) => SearchScreen()),
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
              Text
              (
                'Trending Movies',
                style: GoogleFonts.aBeeZee(fontSize: 25),
              ),
              const SizedBox(height: 32),
              SizedBox(
                child: FutureBuilder(
                  future: trendingMovies,
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
                'Top Rated Movies',
                style: GoogleFonts.aBeeZee
                (
                  fontSize: 25,
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                child: FutureBuilder(
                  future: topRatedMovies,
                  builder: (context,snapshot){
                    if (snapshot.hasError){
                      return Center(child: Text(snapshot.error.toString()),
                      );
                    }
                    else if(snapshot.hasData)
                    {
                      // final data = snapshot.data;
                      return  MoviesSlider(snapshot: snapshot,);
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
                'Upcoming Movies',
                style: GoogleFonts.aBeeZee
                (
                  fontSize: 25,
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                child: FutureBuilder(
                  future: upcomingMovies,
                  builder: (context,snapshot){
                    if (snapshot.hasError){
                      return Center(child: Text(snapshot.error.toString()),
                      );
                    }
                    else if(snapshot.hasData)
                    {
                      // final data = snapshot.data;
                      return  MoviesSlider(snapshot: snapshot,);
                    }
                    else{
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
              
             ],
          ),
        ),
      ),
      
    );
  }
}