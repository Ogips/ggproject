import 'package:filmstv/api/data_source_api.dart';
import 'package:filmstv/model/movie_model.dart';
import 'package:filmstv/model/people_model.dart';
import 'package:filmstv/model/tvs_model.dart';
import 'package:filmstv/widgets/trendings/movies_slider.dart';
import 'package:filmstv/widgets/trendings/person_slider.dart';
import 'package:filmstv/widgets/trendings/trendings_slider.dart';
import 'package:filmstv/widgets/trendings/tv_slider.dart';
import 'package:flutter/material.dart';

class HomeScreenHome extends StatefulWidget {
  const HomeScreenHome({super.key});

  @override
  State<HomeScreenHome> createState() => _HomeScreenHomeState();
}

class _HomeScreenHomeState extends State<HomeScreenHome> {
  late Future<List<Movie>> trendingAll;
  late Future<List<Movie>> trendingMovies;
  late Future<List<Person>> trendingPeople;
  late Future<List<Tvs>> trendingTv;

  @override
  void initState() {
    super.initState();
    trendingAll = DataSource().fetchTrendingAll();
    trendingMovies = DataSource().fetchTrendingMovies();
    trendingPeople = DataSource().fetchTrendingPeople();
    trendingTv = DataSource().fetchTrendingTv();
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
                    return TrendingSlider(
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

            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Trending Movies ",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white),
              ),
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
                "Trendings TV Show & Series",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white),
              ),
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
                    return TvList(snapshot: snapshot);
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
                "Trendings Actor",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              child: FutureBuilder(
                future: trendingPeople,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (snapshot.hasData) {
                    return PersonList(snapshot: snapshot);
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
