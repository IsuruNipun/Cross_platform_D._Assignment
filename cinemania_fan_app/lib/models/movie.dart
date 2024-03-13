
class Media
{
  String title;
  String backDropPath;
  String originalTiltle;
  String overView;
  String posterPath;
  String releaseDate;
  double voteAverage;
  double id;

  Media({
    required this.title,
    required this.backDropPath,
    required this.originalTiltle,
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
      originalTiltle: json["original_title"] ?? json["name"] ?? '',
      overView: json["overview"] ?? '',
      posterPath: json["poster_path"] ?? '',
      releaseDate: json["release_date"] ?? json["first_air_date"] ?? '',
      voteAverage: json["vote_average"]?.toDouble() ?? 0.0,
      id: json["id"]?.toDouble() ?? 0.0,
    );
  }

}
