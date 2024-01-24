import 'package:filmstv/constants.dart';
import 'package:flutter/material.dart';

class NowPlayingMoviesList extends StatelessWidget {
  const NowPlayingMoviesList({
    super.key,
    required this.snapshot,
  });

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10),
            child: SizedBox(
              width: 250,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          '${Constants.imagePath}${snapshot.data![index].backdropPath}',
                          fit: BoxFit.cover,
                          height: 150,
                          width: 250,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        // left: 0,
                        right: 0,
                        child: Container(
                          width: 100,
                          // padding: const EdgeInsets.all(10),
                          child: const Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.play_circle,
                                color: Colors.red,
                                size: 80,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
