import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cinemania_fan_app/models/movie.dart';
 // Assuming saveMovieDetailsToFirestore function is here

class AddButtonWidget extends StatelessWidget {
  final Media movie; // Add a Media object to the constructor

  const AddButtonWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);

  void _showAddOptionsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ButtonBar(
                alignment: MainAxisAlignment.center, // Adjust the alignment as needed
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () async {
                      await addToWishlist(movie);
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('${movie.title} added to Wish List'),
                              backgroundColor: Colors.green,
                            ),
                          );
                     } ,// Closes the dialog
                      
                    child: const Text("Add to Wish List"),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(180, 40),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(8)),
                  ElevatedButton(
                    onPressed: () async {
                      await addToWatchedlist(movie);
                      Navigator.of(context).pop(); // Closes the dialog
                     ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('${movie.title} added to Watched List'),
                              backgroundColor: Colors.green,
                            ),
                          );
                        } ,
                    
                    child: const Text("Add to Watched List"),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(130, 40),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

 

  Future<void> addToWatchedlist(Media movie) async {
  String userId = FirebaseAuth.instance.currentUser?.uid ?? '';
  if (userId.isEmpty) {
    // Handle the case where there is no user logged in
    print('No user is logged in.');
    return;
  }

  try {
    CollectionReference watchlistCollection = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('watchlist');
    
    await watchlistCollection.doc(movie.title).set({
      'title': movie.title ?? '',
      'backDrop_Path': movie.backDropPath ?? '',
      'original_title': movie.originalTitle ?? '',
      'overview': movie.overView ?? '',
      'poster_path': movie.posterPath ?? '',
      'release_date': movie.releaseDate ?? '',
      'vote_average': movie.voteAverage ?? 0.0,
      'id': movie.id ?? 0.0,
    });
    // Successfully added to watched list
    print('${movie.title} added to watched list.');
  } catch (e) {
    // Handle errors from Firestore
    print('Error adding movie to watched list: $e');
  }
}

Future<void> addToWishlist(Media movie) async {
  String userId = FirebaseAuth.instance.currentUser?.uid ?? '';
  if (userId.isEmpty) {
    // Handle the case where there is no user logged in
    print('No user is logged in.');
    return;
  }

  try {
    CollectionReference watchlistCollection = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('wish list');
    
    await watchlistCollection.doc(movie.title).set({
      'title': movie.title ?? '',
      'backDrop_Path': movie.backDropPath ?? '',
      'original_title': movie.originalTitle ?? '',
      'overview': movie.overView ?? '',
      'poster_path': movie.posterPath ?? '',
      'release_date': movie.releaseDate ?? '',
      'vote_average': movie.voteAverage ?? 0.0,
      'id': movie.id ?? 0.0,
    });
    // Successfully added to watched list
    print('${movie.title} added to wish list.');
  } catch (e) {
    // Handle errors from Firestore
    print('Error adding movie to wish list: $e');
  }
}


  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => _showAddOptionsDialog(context),
      child: const Icon(Icons.add),
      backgroundColor: Colors.black,
      shape: CircleBorder(),
      tooltip: 'Add',
    );
  }
}
