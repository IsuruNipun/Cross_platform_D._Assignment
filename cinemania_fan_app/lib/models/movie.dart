import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Media
{
  String title;
  String backDropPath;
  String originalTitle;
  String overView;
  String posterPath;
  String releaseDate;
  double voteAverage;
  double id;

  Media({
    required this.title,
    required this.backDropPath,
    required this.originalTitle,
    required this.overView,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.id, 
  });

  

  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(
      title: json["title"] ?? json["original_name"] ?? 'Unknown Title',
      backDropPath: json["backdrop_path"] ?? '',
      originalTitle: json["original_title"] ?? json["name"] ?? '',
      overView: json["overview"] ?? '',
      posterPath: json["poster_path"] ?? '',
      releaseDate: json["release_date"] ?? json["first_air_date"] ?? '',
      voteAverage: json["vote_average"]?.toDouble() ?? 0.0,
      id: json["id"]?.toDouble() ?? 0.0,
    );
  }


  factory Media.fromMap(Map<String, dynamic> map) {
  return Media(
    // Add all fields that are stored in Firestore and you want to display
    title: map['title'] as String,
    overView: map['overview'] as String,
    backDropPath:map['backDrop_Path'] as String,
    originalTitle:map['original_title'] as String,
    id:map['id'] as double,
    voteAverage:map['vote_average'] as double,
    posterPath: map['poster_path'] as String,
    releaseDate: map['release_date'] as String,
    
  );
}


  factory Media.fromDocument(DocumentSnapshot doc) {
    Map<String, dynamic> json = doc.data() as Map<String, dynamic>;
    return Media.fromJson(json);
  }
}