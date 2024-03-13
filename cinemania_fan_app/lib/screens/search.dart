
import 'package:cinemania_fan_app/constants.dart';
import 'package:cinemania_fan_app/models/movie.dart';
import 'package:cinemania_fan_app/screens/details_screen.dart';
import 'package:cinemania_fan_app/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SearchPage extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchPage> {
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
      searchResults.addAll(results.map((json) => Media.fromJson(json)).toList());
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
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final movie = snapshot.data![index];
                    return ListTile(
                      leading: movie.posterPath.isNotEmpty
                          ? Image.network(
                              'https://image.tmdb.org/t/p/w200${movie.posterPath}',
                              width: 50,
                            )
                          : Container(
                              width: 50,
                              height: 75,
                              color: Colors.white,
                              child: Icon(Icons.movie),
                            ),
                      title: Text(movie.title ?? 'Unknown Title'),
                      subtitle: Text('Rating: ${movie.voteAverage.toString()}'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(movie: movie),
                          ),
                        );
                      },
                    );
                  },
                );
              } else {
                return Center(
                  child: Text('No results found'),
                );
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
