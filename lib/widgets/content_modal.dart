import 'package:flutter/material.dart';
import 'package:food_app/controllers/chooseSessionController.dart';
import 'package:food_app/themes/themes.dart';
import 'package:food_app/widgets/card_cinema.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'gradient_button.dart';

class NestedScrollModal extends StatelessWidget {
  final ChooseController chooseC = Get.find<ChooseController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GradientButton(
        title: 'CHOOSE CINEMA',
        onTap: () {
          Navigator.of(context).pop(null);
        },
      ),
      body: Container(
        color: darkColor,
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: GetBuilder<ChooseController>(
          builder: (_) {
            return ListView(
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
                ...chooseC.listCinema.map(
                  (e) => CardCinemaList(item: e),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
