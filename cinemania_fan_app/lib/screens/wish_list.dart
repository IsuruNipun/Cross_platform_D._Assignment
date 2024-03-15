import 'package:cinemania_fan_app/screens/stored_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cinemania_fan_app/models/movie.dart';

class WishListScreen extends StatelessWidget {
  WishListScreen({Key? key}) : super(key: key);

  final String userId = FirebaseAuth.instance.currentUser?.uid ?? '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wish List'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: getWishListStream(userId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No movies in your wish list.'));
          }

          List<DocumentSnapshot> docs = snapshot.data!.docs;

          return ListView.separated(
            itemCount: docs.length,
            separatorBuilder: (context, index) => SizedBox(height: 10),
            itemBuilder: (context, index) {
              DocumentSnapshot doc = docs[index];
              Media movie = Media.fromMap(doc.data() as Map<String, dynamic>);

              return Card(
                elevation: 5,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  contentPadding: EdgeInsets.all(8),
                  leading: movie.posterPath.isNotEmpty
                      ? Image.network(
                          'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                          width: 100,
                          height: 150,
                          fit: BoxFit.contain,
                        )
                      : Container(
                          width: 100,
                          height: 150,
                          color: Colors.grey,
                          child: Icon(Icons.movie, size: 50),
                        ),
                  title: Text(
                    movie.title ?? 'Unknown Title',
                    style: TextStyle(fontSize: 20),
                  ),
                  subtitle: Text(
                    'Release Date: ${movie.releaseDate}',
                    style: TextStyle(fontSize: 16),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => StoredDetailsScreen(movie: movie),
                      ),
                    );
                  },
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      // Call the method to delete the movie from the wish list
                      deleteFromWishList(doc.id);
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Stream<QuerySnapshot> getWishListStream(String userId) {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('wish list')
        .snapshots();
  }

  Future<void> deleteFromWishList(String docId) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('wish list')
          .doc(docId)
          .delete();
      
    } catch (e) {
      print("Error deleting document: $e");
      
    }
  }
}
