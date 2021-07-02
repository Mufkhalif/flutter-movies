import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class Favorite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CardCinema(),
          CardCinema(),
          CardCinema(),
        ],
      ),
    );
  }
}

class CardCinema extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.grey.withOpacity(0.1),
          width: 1,
        ),
        color: Color(0xFF191926).withOpacity(0.3),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment(0, 1),
          colors: [
            Color(0xff404056),
            Color(0xff222232),
          ],
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
                child: Image.asset(
                  'assets/images/poster.jpg',
                  width: 190,
                  height: 270,
                  fit: BoxFit.cover,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
                child: Container(
                  width: 190,
                  height: 270,
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
              ),
              Container(
                width: 190,
                padding: EdgeInsets.only(
                  top: 10,
                  right: 10,
                  left: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xFF191926).withOpacity(0.6),
                      ),
                      child: Text(
                        '13 +',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 24,
                    )
                  ],
                ),
              ),
              Container(
                width: 190,
                height: 270,
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
                          '125 reviews',
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
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            height: double.infinity,
            width: 190,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Awake (2021)',
                  style: GoogleFonts.poppins(
                    color: Color(0xFFECECEC).withOpacity(0.9),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  '97 MIN',
                  style: GoogleFonts.poppins(
                    color: Color(0xFF6D6D80),
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 25),
                Container(
                  child: Text(
                    'The main character is a secret agent who passes a. The main character is a secret agent who passes a. ',
                    style: GoogleFonts.poppins(
                      color: Color(0xFF6D6D80),
                      fontSize: 12,
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.red,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF8036E7),
                        Color(0xFFFF3365),
                      ],
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'BOOK YOUR TICKET',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 10,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
