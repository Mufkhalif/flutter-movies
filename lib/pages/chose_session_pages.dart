import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/controllers/chooseSessionController.dart';
import 'package:food_app/pages/select_seat_pages.dart';
import 'package:food_app/themes/themes.dart';
import 'package:food_app/widgets/button_day.dart';
import 'package:food_app/widgets/button_time.dart';
import 'package:food_app/widgets/content_modal.dart';
import 'package:food_app/widgets/gradient_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ChoseSessionPage extends StatelessWidget {
  final ChooseController chooseC = Get.put(ChooseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkColor,
      appBar: AppBar(
        backgroundColor: darkColor,
        leading: GetBuilder<ChooseController>(
          builder: (_) => GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.keyboard_arrow_left_outlined,
              color: Colors.white.withOpacity(0.6),
            ),
          ),
        ),
        title: Text(
          'Choose Session',
          style: GoogleFonts.poppins(
            color: Colors.white.withOpacity(0.6),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButton: GradientButton(
        title: 'SELECT SEATS',
        onTap: () {
          Get.to(() => SelectSeatPages());
        },
      ),
      body: SingleChildScrollView(
        child: GetBuilder<ChooseController>(
          builder: (_) {
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 56,
                  ),
                  Text(
                    'Choose Session',
                    style: GoogleFonts.poppins(
                      color: Colors.white.withOpacity(0.6),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      showMaterialModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (context) => NestedScrollModal(),
                      );
                    },
                    child: GetBuilder<ChooseController>(
                      builder: (_) {
                        var selectedCinema = chooseC.listCinema
                            .where((e) => e.id == chooseC.selected.value)
                            .toList()[0];

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
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          child: Row(
                            children: [
                              Container(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(6.0),
                                  child: Image.network(
                                    selectedCinema.imgUrl,
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
                                      selectedCinema.name,
                                      style: GoogleFonts.poppins(
                                        color:
                                            Color(0xFFECECEC).withOpacity(0.9),
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(height: 2),
                                    Text(
                                      selectedCinema.address,
                                      maxLines: 1,
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
                      },
                    ),
                  ),
                  SizedBox(height: 60),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
