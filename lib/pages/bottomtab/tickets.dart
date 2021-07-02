import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TicketView extends StatelessWidget {
  const TicketView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CardTicket(),
          CardTicket(),
          CardTicket(),
        ],
      ),
    );
  }
}

class CardTicket extends StatelessWidget {
  const CardTicket({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 14,
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
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
            child: Stack(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Spacer(),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFFF3365),
                        borderRadius: BorderRadius.circular(
                          4,
                        ),
                      ),
                      child: Text(
                        'TODAY',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 130,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Wonder Woman 1984',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              'DATE & TIME',
                              style: GoogleFonts.poppins(
                                color: Color(0xFF6D6D80),
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              '27 April  •  19:00',
                              style: GoogleFonts.poppins(
                                color: Color(0xFFECECEC).withOpacity(0.9),
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Container(
                        height: 80,
                        width: 2,
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
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                RowInfo(
                                  title: 'HALL',
                                  subTitle: 'H2',
                                ),
                                RowInfo(
                                  title: 'ROW',
                                  subTitle: 'J',
                                ),
                                RowInfo(
                                  title: 'SEATS',
                                  subTitle: 'J3, J4',
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              'CINEMA',
                              style: GoogleFonts.poppins(
                                color: Color(0xFF6D6D80),
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              'Multikino: Atrium Targówek',
                              style: GoogleFonts.poppins(
                                color: Color(0xFFECECEC).withOpacity(0.9),
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
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

class RowInfo extends StatelessWidget {
  RowInfo({
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              color: Color(0xFF6D6D80),
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            subTitle,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
