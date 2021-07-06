import 'package:flutter/material.dart';
import 'package:food_app/controllers/chooseSessionController.dart';
import 'package:food_app/models/cinema_model.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CardCinemaList extends StatelessWidget {
  final CinemaModel item;
  final ChooseController chooseC = Get.find<ChooseController>();

  CardCinemaList({required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        chooseC.updateSelected(item.id);
      },
      child: GetBuilder<ChooseController>(
        builder: (_) {
          var selected = chooseC.selected.value;

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
                    child: Stack(
                      children: [
                        Image.network(
                          item.imgUrl,
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                        selected == item.id
                            ? Container(
                                color: Colors.red.withOpacity(0.4),
                                width: 40,
                                height: 40,
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                ),
                              )
                            : Container()
                      ],
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
                        item.name,
                        style: GoogleFonts.poppins(
                          color: Color(0xFFECECEC).withOpacity(0.9),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        item.address,
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
                    Icons.star,
                    color: Color(0xFF6D6D80),
                    size: 16,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
