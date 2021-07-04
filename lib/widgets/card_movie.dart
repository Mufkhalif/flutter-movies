import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_app/controllers/movieController.dart';
import 'package:food_app/models/movie_model.dart';
import 'package:food_app/pages/detail_movie_pages.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CardMovie extends StatelessWidget {
  final int index;
  final MovieModel item;
  final MovieController movieC = Get.find<MovieController>();

  CardMovie({
    required this.index,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        movieC.getDetailMovie(id: item.id, posterPath: item.backdropPath);
        Get.to(() => DetailMovie());
      },
      child: Container(
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
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: Hero(
                      tag: item.id,
                      child: Image.network(
                        item.backdropPath,
                        width: double.infinity,
                        height: Get.height * 0.26,
                        fit: BoxFit.cover,
                      )

                      // CachedNetworkImage(
                      //   imageUrl: item.backdropPath,
                      // width: double.infinity,
                      // height: Get.height * 0.26,
                      //   fit: BoxFit.cover,
                      //   placeholder: (BuildContext context, String url) =>
                      //       Container(
                      //     width: double.infinity,
                      //     height: Get.height * 0.26,
                      //     child: Image.asset(
                      //       'assets/images/placeholder.jpg',
                      //       fit: BoxFit.cover,
                      //     ),
                      //   ),
                      // ),
                      ),
                ),
                Container(
                  width: double.infinity,
                  height: Get.height * 0.26,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment(0, 1),
                      colors: [
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(0),
                        Colors.black.withOpacity(0.6),
                        Colors.black.withOpacity(1),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 10,
                    top: 10,
                    right: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: item.adult ? Colors.red : Color(0xFF191926),
                        ),
                        child: Text(
                          item.adult ? '18 +' : '13 +',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.favorite,
                        color: Colors.white.withOpacity(0.7),
                        size: 24,
                      )
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: Get.height * 0.26,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Action, Adventure',
                        style: GoogleFonts.poppins(
                          color: Color(0xFFFF3466),
                          fontSize: 12,
                        ),
                      ),
                      Row(
                        children: [
                          RatingBar.builder(
                            initialRating: 5,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(
                              horizontal: 1.0,
                            ),
                            itemSize: 12.0,
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Color(0xFFFF3365),
                              size: 10,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          SizedBox(width: 10),
                          Text(
                            item.rating + " Rating",
                            style: GoogleFonts.poppins(
                              color: Color(0xFF6D6D80),
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    maxLines: 1,
                    style: GoogleFonts.poppins(
                      color: Color(0xFFECECEC).withOpacity(0.9),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    item.voteCount.toString() + " Views",
                    style: GoogleFonts.poppins(
                      color: Color(0xFF6D6D80),
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
