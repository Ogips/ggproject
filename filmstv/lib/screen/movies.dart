import 'package:filmstv/api/data_source_api.dart';
import 'package:filmstv/model/movie_model.dart';
import 'package:filmstv/model/people_model.dart';
import 'package:filmstv/model/tvs_model.dart';
import 'package:filmstv/widgets/movies/movies_now_playing.dart';
import 'package:filmstv/widgets/movies/movies_popular.dart';
import 'package:filmstv/widgets/movies/movies_trending_slider.dart';
import 'package:filmstv/widgets/movies/movies_upcoming.dart';
import 'package:filmstv/widgets/trendings/movies_slider.dart';
import 'package:flutter/material.dart';

class HomeScreenMovies extends StatefulWidget {
  const HomeScreenMovies({super.key});

  @override
  State<HomeScreenMovies> createState() => _HomeScreenMoviesState();
}

class _HomeScreenMoviesState extends State<HomeScreenMovies> {
  late Future<List<Movie>> trendingAll;
  late Future<List<Movie>> trendingMovies;
  late Future<List<Person>> trendingPeople;
  late Future<List<Tvs>> trendingTv;

  late Future<List<Movie>> popularMovies;
  late Future<List<Movie>> upcomingMovies;
  late Future<List<Movie>> nowPlayingMovies;
  late Future<List<Movie>> topRatedMovies;


  @override
  void initState() {
    super.initState();
    trendingAll = DataSource().fetchTrendingAll();
    trendingMovies = DataSource().fetchTrendingMovies();
    trendingPeople = DataSource().fetchTrendingPeople();
    trendingTv = DataSource().fetchTrendingTv();

    popularMovies = DataSource().fetchpopularMovies();
    upcomingMovies = DataSource().fetchUpComingMovies();
    nowPlayingMovies = DataSource().fetchNowPlayingMovies();
    topRatedMovies = DataSource().fetchTopRatedMovies();
  }

  @override
  Widget build(BuildContext context) {
    double containerWidth = MediaQuery.of(context).size.width - 40;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),

            SizedBox(
              child: FutureBuilder(
                future: trendingMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (snapshot.hasData) {
                    return MoviesTrendingSlider(
                      containerWidth: containerWidth,
                      snapshot: snapshot,
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),

            // =========
            const Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Watch Again ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 30,
                  )
                ],
              ),
            ),

            SizedBox(
              child: FutureBuilder(
                future: nowPlayingMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (snapshot.hasData) {
                    return NowPlayingMoviesList(snapshot: snapshot);
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),


            // ========
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Top Rate Movies ",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white),
              ),
            ),

            SizedBox(
              child: FutureBuilder(
                future: topRatedMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (snapshot.hasData) {
                    return MoviesList(snapshot: snapshot);
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),

            // =============
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Text(
                "Popular Movies",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              child: FutureBuilder(
                future: popularMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (snapshot.hasData) {
                    return PopularMoviesList(snapshot: snapshot);
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),

            // =============
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Text(
                "Up Coming Movies",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              child: FutureBuilder(
                future: upcomingMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (snapshot.hasData) {
                    return UpcomingMovieList(snapshot: snapshot);
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
