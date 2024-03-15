import 'dart:convert';

import 'package:cinemania_fan_app/constants.dart';

import 'package:cinemania_fan_app/models/movie.dart';
import 'package:http/http.dart' as http;

class Api{
  // movies
  static const _trendingUrl ='https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.apiKey}';
  static const _topRatedUrl ='https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apiKey}';
  static const _upcomingUrl ='https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apiKey}';
  static const _nowPlayingUrl ='https://api.themoviedb.org/3/movie/now_playing?api_key=${Constants.apiKey}';
  // tv series
  static const _trendingTvUrl ='https://api.themoviedb.org/3/trending/tv/day?api_key=${Constants.apiKey}';
  static const _onTvTodayUrl ='https://api.themoviedb.org/3/tv/airing_today?api_key=${Constants.apiKey}';
  static const _topRatedTvUrl ='https://api.themoviedb.org/3/tv/top_rated?api_key=${Constants.apiKey}';

  // kids
  static const _kidsmoviesUrl = 'https://api.themoviedb.org/3/discover/movie?api_key=${Constants.apiKey}&with_genres=10751';
  static const _kidsTvseriesUrl = 'https://api.themoviedb.org/3/discover/tv?api_key=${Constants.apiKey}&with_genres=10751';
  static const _kidsmediaUrl = 'https://api.themoviedb.org/3/search/multi?api_key=${Constants.apiKey}&with_genres=10751';
  
  
  //highest grosing movies
   static const _highestgrossMovieUrl ='https://api.themoviedb.org/3/discover/movie?api_key=${Constants.apiKey}&sort_by=revenue.desc';

   Future<List<Media>> getHighestGrossMovies() async{
    final response = await http.get(Uri.parse(_highestgrossMovieUrl));
    if (response.statusCode == 200){
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie)=> Media.fromJson(movie)).toList();
    }
    else
    {
      throw Exception('Something happened');
    }
  }

  

//trending movies
  Future<List<Media>> getTrendingMovies() async{
    final response = await http.get(Uri.parse(_trendingUrl));
    if (response.statusCode == 200){
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie)=> Media.fromJson(movie)).toList();
    }
    else
    {
      throw Exception('Something happened');
    }
  }

//top rated movies
  Future<List<Media>> getTopRatedMovies() async{
    final response = await http.get(Uri.parse(_topRatedUrl));
    if (response.statusCode == 200){
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie)=> Media.fromJson(movie)).toList();
    }
    else
    {
      throw Exception('Something happened');
    }
  }
//upcoming movies
  Future<List<Media>> getUpcomingMovies() async{
    final response = await http.get(Uri.parse(_upcomingUrl));
    if (response.statusCode == 200){
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie)=> Media.fromJson(movie)).toList();
    }
    else
    {
      throw Exception('Something happened');
    }
  }

  //now playing  movies
  Future<List<Media>> getNowPlayingMovies() async{
    final response = await http.get(Uri.parse(_nowPlayingUrl));
    if (response.statusCode == 200){
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie)=> Media.fromJson(movie)).toList();
    }
    else
    {
      throw Exception('Something happened');
    }
  }


  //trending tv series
  Future<List<Media>> getTrendingTv() async{
    final response = await http.get(Uri.parse(_trendingTvUrl));
    if (response.statusCode == 200){
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((tvSeries)=> Media.fromJson(tvSeries)).toList();
    }
    else
    {
      throw Exception('Something happened');
    }
  }

  //on tv today series
  Future<List<Media>> getOnTvToday() async{
    final response = await http.get(Uri.parse(_onTvTodayUrl));
    if (response.statusCode == 200){
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((tvSeries)=> Media.fromJson(tvSeries)).toList();
    }
    else
    {
      throw Exception('Something happened');
    }
  }

  

  //top rated tv series
  Future<List<Media>> getTopRatedTv() async{
    final response = await http.get(Uri.parse(_topRatedTvUrl));
    if (response.statusCode == 200){
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((tvSeries)=> Media.fromJson(tvSeries)).toList();
    }
    else
    {
      throw Exception('Something happened');
    }
  }


//kids movies
  Future<List<Media>> getKidsMovies(int genereId) async{
    final response = await http.get(Uri.parse(_kidsmoviesUrl));
    if (response.statusCode == 200){
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie)=> Media.fromJson(movie)).toList();
    }
    else
    {
      throw Exception('Something happened');
    }
  }
//kids tv series
  Future<List<Media>> getKidsTvSeries(int genereId) async{
    final response = await http.get(Uri.parse(_kidsTvseriesUrl));
    if (response.statusCode == 200){
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((tvSeries)=> Media.fromJson(tvSeries)).toList();
    }
    else
    {
      throw Exception('Something happened');
    }
  }
// kids tv series and movies
  Future<List<Media>> getKidsMedia(int genereId) async{
    final response = await http.get(Uri.parse(_kidsmediaUrl));
    if (response.statusCode == 200){
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie)=> Media.fromJson(movie)).toList();
    }
    else
    {
      throw Exception('Something happened');
    }
  }
}