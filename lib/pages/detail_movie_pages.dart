import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_app/controllers/movieController.dart';
import 'package:food_app/widgets/card_video.dart';
import 'package:food_app/widgets/footer_detail.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailMovie extends StatelessWidget {
  final MovieController movieC = Get.find<MovieController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff191926),
      body: GetBuilder<MovieController>(
        builder: (_) {
          var detailMovie = movieC.detailMovie.value;
          return movieC.isLoadingDetail.value
              ? Container(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Color(0xFFFF3466),
                    ),
                  ),
                )
              : Container(
                  child: Stack(
                    children: [
                      Hero(
                        tag: detailMovie.id,
                        child: Image.network(
                          detailMovie.posterPath,
                        ),
                      ),
                      SingleChildScrollView(
                        physics: ClampingScrollPhysics(),
                        child: Container(
                          padding: EdgeInsets.only(
                            top: GetPlatform.isAndroid ? 50 : 70,
                            left: 20,
                            right: 20,
                          ),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xff191926).withOpacity(0.4),
                                Color(0xff191926).withOpacity(0.8),
                                Color(0xff191926),
                                Color(0xff191926),
                                Color(0xff191926),
                              ],
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: Icon(
                                        Icons.keyboard_arrow_left_outlined,
                                        color: Colors.white.withOpacity(0.75),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Back',
                                      style: GoogleFonts.poppins(
                                          color: Colors.white),
                                    ),
                                    Spacer(),
                                    Icon(Icons.favorite,
                                        size: 24, color: Color(0xffFF3365)),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Center(
                                child: Icon(
                                  Icons.play_circle_filled,
                                  size: 72,
                                  color: Colors.white.withOpacity(0.75),
                                ),
                              ),
                              SizedBox(
                                height: 69,
                              ),
                              Text(
                                '13 +',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                detailMovie.originalTitle,
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                detailMovie.genres,
                                style: GoogleFonts.poppins(
                                  color: Color(0xFFFF3466),
                                  fontSize: 16,
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
                                      color: Color(0xFFFF3466),
                                      size: 10,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    detailMovie.voteCount.toString() +
                                        " REVIEWS",
                                    style: GoogleFonts.poppins(
                                      color: Color(0xFF6D6D80),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 28,
                              ),
                              Text(
                                "Storyline",
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                detailMovie.overview,
                                style: GoogleFonts.poppins(
                                  color: Colors.white.withOpacity(0.6),
                                ),
                              ),
                              SizedBox(
                                height: 28,
                              ),
                              Text(
                                "Home Page",
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                detailMovie.homePage,
                                style: GoogleFonts.poppins(
                                  color: Colors.white.withOpacity(0.6),
                                ),
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Cast',
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Spacer(),
                                  Text(
                                    'See All',
                                    style: GoogleFonts.poppins(
                                        color: Colors.white.withOpacity(
                                      0.7,
                                    )),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 13,
                              ),
                              Container(
                                height: 140,
                                child: ListView.builder(
                                  itemCount: movieC.casts.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return CardVideo(
                                      item: movieC.casts[index],
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 70,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Footer()
                    ],
                  ),
                );
        },
      ),
    );
  }
}
