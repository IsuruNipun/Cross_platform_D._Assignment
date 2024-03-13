// import 'package:cinemania_fan_app/api/api.dart';
// import 'package:cinemania_fan_app/models/movie.dart';
// import 'package:cinemania_fan_app/screens/kids_mode_screen.dart';
// import 'package:cinemania_fan_app/screens/search.dart';
// import 'package:cinemania_fan_app/screens/search_screen.dart';
// //import 'package:cinemania_fan_app/widgets/custom_tab_bar.dart';
// import 'package:cinemania_fan_app/widgets/movie_slider.dart';
// import 'package:cinemania_fan_app/widgets/side_menu.dart';
// import 'package:cinemania_fan_app/widgets/trending_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class HomeScreen extends StatefulWidget 
// {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }



// class _HomeScreenState extends State<HomeScreen> 
// {
//    bool _isKidsModeEnabled = false;

//   late Future<List<Movie>> trendingMovies;
//   late Future<List<Movie>> topRatedMovies;
//   late Future<List<Movie>> upcomingMovies;

  

//   @override
//   void initState(){
//     super.initState();
//     trendingMovies = Api().getTrendingMovies();
//     topRatedMovies = Api().getTopRatedMovies();
//     upcomingMovies = Api().getUpcomingMovies();
    
//   }

  

//   @override
//   Widget build(BuildContext context)
//   {
//     return Scaffold
//     (
//       drawer: SideMenu(
//         isKidsModeEnabled: _isKidsModeEnabled,
//         onKidsModeChanged: (value) {
//           setState(() {
//             _isKidsModeEnabled = value;
//             if (_isKidsModeEnabled) {
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(builder: (context) => KidsScreen()),
//               );
//             }
//           });
//         },
//       ),
//       appBar: AppBar
//       (
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: Image.asset
//         (
//        'assets/images/Cinemania.png',
//         fit: BoxFit.cover,
//         height: 40,
//         filterQuality: FilterQuality.high,
//         ), 
//         centerTitle: true,
//          actions: [
//           IconButton(
//             onPressed: () {
//               // Navigate to the search screen
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => SearchPage()),
//               );
//             },
//             icon: Icon(Icons.search),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView
//       (
//         physics: const BouncingScrollPhysics(),
//         child: Padding
//         (
//           padding: const EdgeInsets.all(8.0),
//           child: Column
//           (
//              crossAxisAlignment: CrossAxisAlignment.start,
//             children: 
//             [
//               Text
//               (
//                 'Trending Movies',
//                 style: GoogleFonts.aBeeZee(fontSize: 25),
//               ),
//               const SizedBox(height: 32),
//               SizedBox(
//                 child: FutureBuilder(
//                   future: trendingMovies,
//                   builder: (context,snapshot){
//                     if (snapshot.hasError){
//                       return Center(child: Text(snapshot.error.toString()),
//                       );
//                     }
//                     else if(snapshot.hasData)
//                     {
//                       // final data = snapshot.data;
//                       return  TrendingSlider(snapshot: snapshot,);
//                     }
//                     else{
//                       return const Center(child: CircularProgressIndicator());
//                     }
//                   },
//                 ),
//               ),
//               // const SizedBox(height: 32),
//               // Text
//               // (
//               //   'Top Rated Movies',
//               //   style: GoogleFonts.aBeeZee
//               //   (
//               //     fontSize: 25,
//               //   ),
//               // ),
//               // const SizedBox(height: 32),
//               // SizedBox(
//               //   child: FutureBuilder(
//               //     future: topRatedMovies,
//               //     builder: (context,snapshot){
//               //       if (snapshot.hasError){
//               //         return Center(child: Text(snapshot.error.toString()),
//               //         );
//               //       }
//               //       else if(snapshot.hasData)
//               //       {
//               //         // final data = snapshot.data;
//               //         return  MoviesSlider(snapshot: snapshot,);
//               //       }
//               //       else{
//               //         return const Center(child: CircularProgressIndicator());
//               //       }
//               //     },
//               //   ),
//               // ),

//               // const SizedBox(height: 32),
//               // Text
//               // (
//               //   'Upcoming Movies',
//               //   style: GoogleFonts.aBeeZee
//               //   (
//               //     fontSize: 25,
//               //   ),
//               // ),
//               // const SizedBox(height: 32),
//               // SizedBox(
//               //   child: FutureBuilder(
//               //     future: upcomingMovies,
//               //     builder: (context,snapshot){
//               //       if (snapshot.hasError){
//               //         return Center(child: Text(snapshot.error.toString()),
//               //         );
//               //       }
//               //       else if(snapshot.hasData)
//               //       {
//               //         // final data = snapshot.data;
//               //         return  MoviesSlider(snapshot: snapshot,);
//               //       }
//               //       else{
//               //         return const Center(child: CircularProgressIndicator());
//               //       }
//               //     },
//               //   ),
//               // ),
              
//              ],
//           ),
//         ),
//       ),
      
//     );
//   }
// }

//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cinemania_fan_app/api/api.dart';
import 'package:cinemania_fan_app/models/movie.dart';
import 'package:cinemania_fan_app/screens/kids_mode_screen.dart';
import 'package:cinemania_fan_app/screens/search.dart';
import 'package:cinemania_fan_app/widgets/media_slider.dart';
import 'package:cinemania_fan_app/widgets/side_menu.dart';
import 'package:cinemania_fan_app/widgets/trending_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  bool _isKidsModeEnabled = false;
  late Future<List<Media>> trendingMovies;
  late Future<List<Media>> topRatedMovies;
  late Future<List<Media>> upcomingMovies;
  late Future<List<Media>> nowPlayingMovies;

  late Future<List<Media>> trendingTv;
  late Future<List<Media>> topRatedTv;
  late Future<List<Media>> onTvToday;

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    trendingMovies = Api().getTrendingMovies();
    topRatedMovies = Api().getTopRatedMovies();
    upcomingMovies = Api().getUpcomingMovies();
    nowPlayingMovies = Api().getNowPlayingMovies();

    trendingTv = Api().getTrendingTv();
    topRatedTv = Api().getTopRatedTv();
    
    onTvToday = Api().getOnTvToday();

    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                MaterialPageRoute(builder: (context) => SearchPage()),
              );
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Trending Movies',
                style: GoogleFonts.aBeeZee(fontSize: 25),
              ),
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
            
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(25.0)),
                child: TabBar(
                  controller: _tabController,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.grey,
                  labelStyle: GoogleFonts.aBeeZee(fontSize: 16, ),
                  unselectedLabelStyle: GoogleFonts.aBeeZee(fontSize: 16),
                  
                  
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(Checkbox.width),
                    color: Colors.purple,
                  ),
                  tabs: const [
                    Tab(text: '           Movies              ',),
                    Tab(text: '          TV Series            '),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height, // Adjust height accordingly
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Movies Tab Content
                
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Now Playing', style: GoogleFonts.aBeeZee(fontSize: 22)),
                          ),
                           FutureBuilder<List<Media>>(
                            future: nowPlayingMovies,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return MediaSlider(snapshot: snapshot);
                              } else if (snapshot.hasError) {
                                return Text("${snapshot.error}");
                              }
                              return CircularProgressIndicator();
                            },
                          ),
                          
                         
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Top Rated Movies', style: GoogleFonts.aBeeZee(fontSize: 22)),
                          ),
                          FutureBuilder<List<Media>>(
                            future: topRatedMovies,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return MediaSlider(snapshot: snapshot);
                              } else if (snapshot.hasError) {
                                return Text("${snapshot.error}");
                              }
                              return CircularProgressIndicator();
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Up Coming Movies', style: GoogleFonts.aBeeZee(fontSize: 22)),
                          ),
                          FutureBuilder<List<Media>>(
                            future: upcomingMovies,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return MediaSlider(snapshot: snapshot);
                              } else if (snapshot.hasError) {
                                return Text("${snapshot.error}");
                              }
                              return CircularProgressIndicator();
                            },
                          ),
                        ],
                      ),
                    ),
                   SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('On TV Today', style: GoogleFonts.aBeeZee(fontSize: 22)),
                          ),
                          FutureBuilder<List<Media>>(
                            future: onTvToday,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return MediaSlider(snapshot: snapshot);
                              } else if (snapshot.hasError) {
                                return Text("${snapshot.error}");
                              }
                              return CircularProgressIndicator();
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Trending Tv Series', style: GoogleFonts.aBeeZee(fontSize: 22)),
                          ),
                          FutureBuilder<List<Media>>(
                            future: trendingTv,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return MediaSlider(snapshot: snapshot);
                              } else if (snapshot.hasError) {
                                return Text("${snapshot.error}");
                              }
                              return CircularProgressIndicator();
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Top Rated Tv Series', style: GoogleFonts.aBeeZee(fontSize: 22)),
                          ),
                          FutureBuilder<List<Media>>(
                            future: topRatedTv,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return MediaSlider(snapshot: snapshot);
                              } else if (snapshot.hasError) {
                                return Text("${snapshot.error}");
                              }
                              return CircularProgressIndicator();
                            },
                          ),
                          
                        ],
                      ),
                    ),
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
