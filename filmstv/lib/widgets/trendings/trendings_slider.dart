import 'package:carousel_slider/carousel_slider.dart';
import 'package:filmstv/constants.dart';
import 'package:filmstv/screen/movie_details.dart';
import 'package:flutter/material.dart';

class TrendingSlider extends StatelessWidget {
  const TrendingSlider({
    super.key,
    required this.containerWidth,
    required this.snapshot,
  });

  final double containerWidth;

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      // width: MediaQuery.of(context).size.width,
      child: CarouselSlider.builder(
        itemCount: snapshot.data!.length,
        options: CarouselOptions(
            height: 200,
            autoPlay: true,
            viewportFraction: 0.9,
            pageSnapping: true,
            autoPlayCurve: Curves.fastOutSlowIn,
            autoPlayAnimationDuration: const Duration(seconds: 1)),
        itemBuilder: (context, itemIndex, pageViewIndex) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DetailMovieScreen(movie: snapshot.data[itemIndex])));
            },
            child: Container(
              width: containerWidth,
              height: 200,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Image.network(
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                  '${Constants.imagePath}${snapshot.data[itemIndex].backdropPath}'),
            ),
          );
        },
      ),
    );
  }
}
