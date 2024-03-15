import 'package:cinemania_fan_app/constants.dart';
import 'package:cinemania_fan_app/models/movie.dart';
import 'package:cinemania_fan_app/screens/details_screen.dart';
import 'package:cinemania_fan_app/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class KidsSearchScreen extends StatefulWidget {
  @override
  _KidsSearchScreenState createState() => _KidsSearchScreenState();
}

class _KidsSearchScreenState extends State<KidsSearchScreen> {
  late TextEditingController _searchController;
  late Future<List<Media>> _searchResults;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchResults = Future.value([]);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<List<Media>> _searchMovies(String query) async {
  final List<Media> searchResults = [];

  final response = await http.get(
    Uri.parse(
      'https://api.themoviedb.org/3/search/multi?query=$query&api_key=${Constants.apiKey}',
    ),
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = jsonDecode(response.body);
    final List<dynamic> results = data['results'] ?? [];

    // Filter results for kid-friendly genres
    final kidGenres = {10751}; // Family genre ID
    searchResults.addAll(
      results.where((result) {
        // Check if the media item's genre IDs match kid-friendly genres
        List<dynamic> genreIds = result['genre_ids'] ?? [];
        return genreIds.any(kidGenres.contains);
      }).map((json) => Media.fromJson(json)).toList(),
    );
  } else {
    throw Exception('Failed to search movies, TV shows, and actors');
  }

  return searchResults;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent, // Set the background color to yellow
        elevation: 0, // Removes the shadow from the AppBar
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white, // The search bar is white
            borderRadius: BorderRadius.circular(30), // Rounded corners
          ),
          child: TextField(
            controller: _searchController,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              hintText: 'Search movies, TV shows, or actors...',
              prefixIcon: Icon(Icons.search, color: Colors.grey), // Grey search icon
              border: InputBorder.none, // Removes the underline
              contentPadding: EdgeInsets.symmetric(vertical: 15), // Centers the text vertically
            ),
            onChanged: (query) {
              setState(() {
                _searchResults = _searchMovies(query);
              });
            },
          ),
        ),
      ),
      body: Stack(
        children: [
           FutureBuilder<List<Media>>(
          future: _searchResults,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              return ListView.separated(
                itemCount: snapshot.data!.length,
                separatorBuilder: (context, index) => SizedBox(height: 10), // Add separation between items
                itemBuilder: (context, index) {
                  final movie = snapshot.data![index];
                  return Card( // Wrap each ListTile in a Card for customization
                    elevation: 5, //  add shadow
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), // Rounded corners
                    child: ListTile(
                      contentPadding: EdgeInsets.all(8), // Increase padding inside ListTile
                      leading: movie.posterPath.isNotEmpty
                          ? Image.network(
                              'https://image.tmdb.org/t/p/w200${movie.posterPath}',
                              width: 100, // Increase the width
                              height: 400, // Increase the height
                              fit: BoxFit.contain, // Adjust the fit
                            )
                          : Container(
                              width: 100,
                              height: 400,
                              color: Colors.grey,
                              child: Icon(Icons.movie, size: 50), // Increase icon size
                            ),
                      title: Text(
                        movie.title ?? 'Unknown Title',
                        style: TextStyle(fontSize: 20), // Increase font size
                      ),
                      subtitle: Text(
                        'Rating: ${movie.voteAverage.toString()}',
                        style: TextStyle(fontSize: 16), // Increase font size
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(movie: movie),
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            } else {
              return Center(child: Text('No results found'));
            }
          },
        ),
           Positioned(
            left: 0,
            bottom: 10,
            child: BackBtn(),
          ),
        ],
      ),
    );
  }
}