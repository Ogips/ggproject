import 'dart:convert';

import 'package:filmstv/constants.dart';
import 'package:filmstv/model/movie_model.dart';
import 'package:filmstv/model/people_model.dart';
import 'package:filmstv/model/tvs_model.dart';
import 'package:http/http.dart' as http;

class DataSource {

  // ======Trending======
  static const _trendingAllUrl =
      'https://api.themoviedb.org/3/trending/all/day?api_key=${Constants.apiKey}';

  static const _trendingMovieUrl =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.apiKey}';
  
  static const _trendingPeopleUrl =
      'https://api.themoviedb.org/3/trending/person/day?api_key=${Constants.apiKey}';
  
  static const _trendingTvUrl =
      'https://api.themoviedb.org/3/trending/tv/day?api_key=${Constants.apiKey}';
  

  // ======Movies======
  static const _topRatedMovieUrl =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apiKey}';

  static const _upComingMovieUrl =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apiKey}';

  static const _nowPlayingMovieUrl =
      'https://api.themoviedb.org/3/movie/now_playing?api_key=${Constants.apiKey}';

  static const _popularMovieUrl =
      'https://api.themoviedb.org/3/movie/popular?api_key=${Constants.apiKey}';


  // ======TV Series======
  static const _airingTodayTvs =
      'https://api.themoviedb.org/3/tv/airing_today?api_key=${Constants.apiKey}';
  
  static const _onTheAirTvs =
      'https://api.themoviedb.org/3/tv/on_the_air?api_key=${Constants.apiKey}';
  
  static const _popularTvs =
      'https://api.themoviedb.org/3/tv/popular?api_key=${Constants.apiKey}';
  
  static const _topRatedTvs =
      'https://api.themoviedb.org/3/tv/top_rated?api_key=${Constants.apiKey}';


  // ======Fetch Trending======
  Future<List<Movie>> fetchTrendingMovies() async {
    final response = await http.get(Uri.parse(_trendingMovieUrl));
    if (response.statusCode == 200) {
      final finalData = json.decode(response.body)['results'] as List;
      return finalData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("No Data Found");
    }
  }

  Future<List<Movie>> fetchTrendingAll() async {
    final response = await http.get(Uri.parse(_trendingAllUrl));
    if (response.statusCode == 200) {
      final finalData = json.decode(response.body)['results'] as List;
      return finalData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("No Data Found");
    }
  }

  Future<List<Person>> fetchTrendingPeople() async {
    final response = await http.get(Uri.parse(_trendingPeopleUrl));
    if (response.statusCode == 200) {
      final finalData = json.decode(response.body)['results'] as List;
      return finalData.map((person) => Person.fromJson(person)).toList();
    } else {
      throw Exception("No Data Found");
    }
  }

  Future<List<Tvs>> fetchTrendingTv() async {
    final response = await http.get(Uri.parse(_trendingTvUrl));
    if (response.statusCode == 200) {
      final finalData = json.decode(response.body)['results'] as List;
      return finalData.map((tvs) => Tvs.fromJson(tvs)).toList();
    } else {
      throw Exception("No Data Found");
    }
  }



  // ======Fetch Movie======
  Future<List<Movie>> fetchTopRatedMovies() async {
    final response = await http.get(Uri.parse(_topRatedMovieUrl));
    if (response.statusCode == 200) {
      final finalData = json.decode(response.body)['results'] as List;
      return finalData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("No Data Found");
    }
  }

  Future<List<Movie>> fetchUpComingMovies() async {
    final response = await http.get(Uri.parse(_upComingMovieUrl));
    if (response.statusCode == 200) {
      final finalData = json.decode(response.body)['results'] as List;
      return finalData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("No Data Found");
    }
  }

  Future<List<Movie>> fetchNowPlayingMovies() async {
    final response = await http.get(Uri.parse(_nowPlayingMovieUrl));
    if (response.statusCode == 200) {
      final finalData = json.decode(response.body)['results'] as List;
      return finalData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("No Data Found");
    }
  }

  Future<List<Movie>> fetchpopularMovies() async {
    final response = await http.get(Uri.parse(_popularMovieUrl));
    if (response.statusCode == 200) {
      final finalData = json.decode(response.body)['results'] as List;
      return finalData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("No Data Found");
    }
  }


  // ======Fetch TV======
  Future<List<Tvs>> fetchAiringTodayTv() async {
    final response = await http.get(Uri.parse(_airingTodayTvs));
    if (response.statusCode == 200) {
      final finalData = json.decode(response.body)['results'] as List;
      return finalData.map((tvs) => Tvs.fromJson(tvs)).toList();
    } else {
      throw Exception("No Data Found");
    }
  }

  Future<List<Tvs>> fetchOnTheAirTv() async {
    final response = await http.get(Uri.parse(_onTheAirTvs));
    if (response.statusCode == 200) {
      final finalData = json.decode(response.body)['results'] as List;
      return finalData.map((tvs) => Tvs.fromJson(tvs)).toList();
    } else {
      throw Exception("No Data Found");
    }
  }

  Future<List<Tvs>> fetchPopularTv() async {
    final response = await http.get(Uri.parse(_popularTvs));
    if (response.statusCode == 200) {
      final finalData = json.decode(response.body)['results'] as List;
      return finalData.map((tvs) => Tvs.fromJson(tvs)).toList();
    } else {
      throw Exception("No Data Found");
    }
  }

  Future<List<Tvs>> fetchTopRatedTv() async {
    final response = await http.get(Uri.parse(_topRatedTvs));
    if (response.statusCode == 200) {
      final finalData = json.decode(response.body)['results'] as List;
      return finalData.map((tvs) => Tvs.fromJson(tvs)).toList();
    } else {
      throw Exception("No Data Found");
    }
  }
}
