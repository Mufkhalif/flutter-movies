import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 71,
      height: 40,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
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
            Color(0xff404056),
            Color(0xff222232),
          ],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '17:15',
              style: GoogleFonts.poppins(
                color: Colors.white.withOpacity(0.6),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
