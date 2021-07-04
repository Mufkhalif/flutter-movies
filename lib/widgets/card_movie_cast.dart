import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_app/controllers/movieController.dart';
import 'package:food_app/models/movie_model.dart';
import 'package:food_app/pages/detail_movie_pages.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CardFilm extends StatelessWidget {
  final MovieModel item;
  final MovieController movieC = Get.find<MovieController>();

  CardFilm({required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        movieC.getDetailMovie(id: item.id, posterPath: item.backdropPath);
        Get.to(() => DetailMovie());
      },
      child: Container(
        height: 200,
        width: 143,
        margin: EdgeInsets.only(
          right: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.grey.withOpacity(0.1),
            width: 1,
          ),
          color: Color(0xFF191926),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment(0, 1),
            colors: [
              Color(0xff404056),
              Color(0xff222232),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: item.backdropPath.isNotEmpty
                  ? Hero(
                      tag: item.id,
                      child: CachedNetworkImage(
                        imageUrl: item.backdropPath,
                        width: double.infinity,
                        height: 160,
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        placeholder: (BuildContext context, String url) =>
                            Container(
                          width: double.infinity,
                          height: 160,
                          child: Image.asset(
                            'assets/images/placeholder.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                  : Container(
                      width: double.infinity,
                      height: 160,
                      child: Image.asset(
                        'assets/images/placeholder.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                item.title,
                maxLines: 2,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
