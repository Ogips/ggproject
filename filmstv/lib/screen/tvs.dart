import 'package:filmstv/api/data_source_api.dart';
import 'package:filmstv/model/movie_model.dart';
import 'package:filmstv/model/people_model.dart';
import 'package:filmstv/model/tvs_model.dart';
import 'package:filmstv/widgets/movies/movies_trending_slider.dart';
import 'package:filmstv/widgets/tvs/tvs_airing_today.dart';
import 'package:filmstv/widgets/tvs/tvs_onthe_air.dart';
import 'package:filmstv/widgets/tvs/tvs_popular.dart';
import 'package:filmstv/widgets/tvs/tvs_top_rated.dart';
import 'package:flutter/material.dart';

class HomeScreenTvs extends StatefulWidget {
  const HomeScreenTvs({super.key});

  @override
  State<HomeScreenTvs> createState() => _HomeScreenTvsState();
}

class _HomeScreenTvsState extends State<HomeScreenTvs> {
  late Future<List<Movie>> trendingAll;
  late Future<List<Movie>> trendingMovies;
  late Future<List<Person>> trendingPeople;
  late Future<List<Tvs>> trendingTv;

  late Future<List<Tvs>> airingTodayTv;
  late Future<List<Tvs>> onTheAirTv;
  late Future<List<Tvs>> popularTv;
  late Future<List<Tvs>> topRatedTv;

  @override
  void initState() {
    super.initState();
    trendingAll = DataSource().fetchTrendingAll();
    trendingMovies = DataSource().fetchTrendingMovies();
    trendingPeople = DataSource().fetchTrendingPeople();
    trendingTv = DataSource().fetchTrendingTv();

    airingTodayTv = DataSource().fetchAiringTodayTv();
    onTheAirTv = DataSource().fetchOnTheAirTv();
    popularTv = DataSource().fetchPopularTv();
    topRatedTv = DataSource().fetchTopRatedTv();

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
                future: trendingTv,
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
                    "Watch Now ",
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
                future: onTheAirTv,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (snapshot.hasData) {
                    return OnTheAirTvsList(snapshot: snapshot);
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
                "Top Rate Tvs ",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white),
              ),
            ),

            SizedBox(
              child: FutureBuilder(
                future: topRatedTv,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (snapshot.hasData) {
                    return TopRatedTvsList(snapshot: snapshot);
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
                "Popular Tvs",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              child: FutureBuilder(
                future: popularTv,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (snapshot.hasData) {
                    return PopularTvsList(snapshot: snapshot);
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
                "TVs - Airing Today",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              child: FutureBuilder(
                future: airingTodayTv,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (snapshot.hasData) {
                    return AiringTodayTvsList(snapshot: snapshot);
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
