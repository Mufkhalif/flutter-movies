import 'package:flutter/material.dart';
import 'package:food_app/controllers/detailCastController.dart';
import 'package:food_app/widgets/card_movie_cast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailCast extends StatelessWidget {
  final DetailCastController castC = Get.find<DetailCastController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff191926),
      body: GetBuilder<DetailCastController>(
        builder: (_) {
          var cast = castC.cast.value;
          return Container(
            child: Stack(
              children: [
                Hero(
                  tag: cast.id,
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      Colors.grey,
                      BlendMode.saturation,
                    ),
                    child: Image.network(
                      cast.profilePath,
                    ),
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
                          Color(0xff191926).withOpacity(0.9),
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
                                style: GoogleFonts.poppins(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 49,
                        ),
                        Text(
                          cast.name,
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: Image.network(
                                cast.profilePath,
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cast.birthday,
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  cast.placeBirth,
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  cast.type,
                                  style: GoogleFonts.poppins(
                                    color: Color(0xFFFF3466),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Row(
                          children: [
                            Text(
                              'Filmography',
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
                          height: 10,
                        ),
                        Container(
                          height: 230,
                          child: ListView.builder(
                            itemCount: castC.listMovies.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) =>
                                CardFilm(item: castC.listMovies[index]),
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Text(
                          'Biography',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          cast.biography,
                          style: GoogleFonts.poppins(
                            color: Colors.white.withOpacity(0.6),
                          ),
                        ),
                        SizedBox(
                          height: 200,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
