import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Cinema extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.grey.withOpacity(0.1),
          width: 1.5,
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
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: Image.network(
                'https://images.unsplash.com/photo-1517604931442-7e0c8ed2963c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
                width: 64,
                height: 64,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Atlantica Cinema',
                      style: GoogleFonts.poppins(
                        color: Color(0xFFECECEC).withOpacity(0.9),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Icon(
                      Icons.star,
                      color: Color(0xFFF2A200),
                      size: 14,
                    )
                  ],
                ),
                SizedBox(height: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Chmielna 33, 00-021 ',
                      style: GoogleFonts.poppins(
                        color: Color(0xFF6D6D80),
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      '0.5 km',
                      style: GoogleFonts.poppins(
                        color: Color(0xFF6D6D80),
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Image.asset(
                      'assets/images/ic_cinema_active.png',
                      width: 16,
                      height: 16,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Show Sessions',
                      style: GoogleFonts.poppins(
                        color: Color(0xFFFF3365),
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
    );
  }
}
