import 'package:filmstv/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PopularMoviesList extends StatelessWidget {
  const PopularMoviesList({
    super.key,
    required this.snapshot,
  });

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: snapshot.data!.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10),
            child: SizedBox(
              width: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          '${Constants.imagePath}${snapshot.data![index].posterPath}',
                          fit: BoxFit.cover,
                          height: 150,
                          width: 100,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        // left: 0,
                        right: 0,
                        child: Container(
                          width: 100,
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(255, 0, 0,
                                0.6), // Red background with 50% opacity
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                DateFormat('yyyy').format(snapshot.data![index].releaseDate,),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),

                              Row(
                                children: [
                                  Text(
                                    snapshot.data![index].voteAverage.toStringAsFixed(1), // Your rating text
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.star,
                                    color: Colors.white,
                                    size: 14,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    snapshot.data![index].title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.white),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
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

