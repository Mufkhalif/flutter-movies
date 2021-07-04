import 'package:flutter/material.dart';
import 'package:food_app/themes/themes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class ChoseSessionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkColor,
      appBar: AppBar(
        backgroundColor: darkColor,
        leading: GestureDetector(
          onTap: () {},
          child: Icon(Icons.keyboard_arrow_left_outlined,
              color: Colors.white.withOpacity(0.6)),
        ),
        title: Text(
          'Choose Session',
          style: GoogleFonts.poppins(
            color: Colors.white.withOpacity(0.6),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButton: Container(
        width: Get.width - 30,
        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff8036E7).withOpacity(0.4),
              Color(0xffFF3365),
            ],
          ),
        ),
        child: Text(
          'CHOOSE SESSION',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          // padding: EdgeInsets.symmetric(
          //   horizontal: 12,
          // ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 56,
              ),
              // Text(
              //   'Choose Session',
              //   style: GoogleFonts.poppins(
              //     color: Colors.white.withOpacity(0.6),
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              SizedBox(height: 10),
              CinemaContainer(),
              // SizedBox(height: 60),
              // OtherFilter()
            ],
          ),
        ),
      ),
    );
  }
}

class OtherFilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Choose Date',
          style: GoogleFonts.poppins(
            color: Colors.white.withOpacity(0.6),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              CardDate(),
              CardDate(),
              CardDate(),
              CardDate(),
            ],
          ),
        ),
        SizedBox(height: 60),
        Text(
          'Choose Time',
          style: GoogleFonts.poppins(
            color: Colors.white.withOpacity(0.6),
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'CLASSIC SESSION',
          style: GoogleFonts.poppins(
            color: Colors.white.withOpacity(0.4),
            fontWeight: FontWeight.bold,
            fontSize: 10,
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: 40,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              CardTime(),
              CardTime(),
              CardTime(),
              CardTime(),
            ],
          ),
        ),
        SizedBox(height: 20),
        Text(
          '3D SESSION',
          style: GoogleFonts.poppins(
            color: Colors.white.withOpacity(0.4),
            fontWeight: FontWeight.bold,
            fontSize: 10,
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: 40,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              CardTime(),
              CardTime(),
              CardTime(),
              CardTime(),
            ],
          ),
        ),
        SizedBox(height: 100),
      ]),
    );
  }
}

class CinemaContainer extends StatelessWidget {
  const CinemaContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isOpen = true;
    return isOpen
        ? Container(
            padding: EdgeInsets.only(
              top: 24,
              left: 10,
              right: 10,
            ),
            height: Get.height,
            decoration: BoxDecoration(
              color: Color(0xff212131),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Column(
                    children: [
                      Text(
                        'Cinemas at Warszawa,PL',
                        style: GoogleFonts.poppins(
                          color: Color(0xFFECECEC).withOpacity(0.9),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '16 cinemas found',
                        style: GoogleFonts.poppins(
                            color: Color(0xFFECECEC).withOpacity(0.4),
                            fontWeight: FontWeight.w700,
                            fontSize: 12),
                      ),
                    ],
                  ),
                ),
                CardCinemaList(),
                CardCinemaList(),
                CardCinemaList(),
                CardCinemaList(),
                CardCinemaList(),
                CardCinemaList(),
                CardCinemaList(),
              ],
            ),
          )
        : CardCinema();
  }
}

class CardCinemaList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color(0xFF191926).withOpacity(0.3),
        gradient: RadialGradient(
          radius: 10,
          center: const Alignment(-1, 1),
          stops: [0.1, 0.9],
          colors: [
            Color(0xff404056).withOpacity(0.54),
            Color(0xFF222232).withOpacity(0.54),
          ],
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: Image.network(
                'https://images.unsplash.com/photo-1517604931442-7e0c8ed2963c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 14),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Atlantica Cinema',
                  style: GoogleFonts.poppins(
                    color: Color(0xFFECECEC).withOpacity(0.9),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'Chmielna 33, 00-021 ',
                  style: GoogleFonts.poppins(
                    color: Color(0xFF6D6D80),
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.star,
              color: Color(0xFF6D6D80),
              size: 16,
            ),
          )
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
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Row(
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
          SizedBox(width: 14),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Atlantica Cinema',
                  style: GoogleFonts.poppins(
                    color: Color(0xFFECECEC).withOpacity(0.9),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Chmielna 33, 00-021 ',
                  style: GoogleFonts.poppins(
                    color: Color(0xFF6D6D80),
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.keyboard_arrow_down_outlined,
              color: Color(0xFF6D6D80),
            ),
          )
        ],
      ),
    );
  }
}

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

class CardDate extends StatelessWidget {
  const CardDate({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 71,
      height: 100,
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
              '26',
              style: GoogleFonts.poppins(
                color: Colors.white.withOpacity(0.6),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              'FRIDAY',
              style: GoogleFonts.poppins(
                color: Colors.white.withOpacity(0.6),
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            )
          ],
        ),
      ),
    );
  }
}
