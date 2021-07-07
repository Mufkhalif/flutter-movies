import 'package:flutter/material.dart';
import 'package:food_app/controllers/chooseSessionController.dart';
import 'package:food_app/models/seat_model.dart';
import 'package:food_app/widgets/seat_item.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FullRow extends StatelessWidget {
  final ChooseController chooseC = Get.find<ChooseController>();
  final bool isFull;
  final SeatModel item;
  final int index;

  FullRow({
    required this.isFull,
    required this.item,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    var left = isFull
        ? item.count.where((e) => e.id < 5).toList()
        : item.count.where((e) => e.id < 4).toList();

    var right = isFull
        ? item.count.where((e) => e.id > 4).toList()
        : item.count.where((e) => e.id > 3).toList();

    return Container(
      margin: index == 2 ? EdgeInsets.only(bottom: 30) : null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  item.row,
                  style: GoogleFonts.poppins(
                    color: Color(0Xff6D6D80),
                    fontSize: 10,
                  ),
                ),
                SizedBox(width: 10),
                isFull ? Container() : Container(width: 36, height: 14),
                ...left.map(
                  (e) => SeatItem(
                    item: e,
                    onTap: () {
                      chooseC.updateSelectedSeat(index, left.indexOf(e));
                    },
                  ),
                )
              ],
            ),
          ),
          Row(
            children: [
              ...right.map(
                (e) => SeatItem(
                  item: e,
                  onTap: () {
                    chooseC.updateSelectedSeat(index,
                        isFull ? right.indexOf(e) + 4 : right.indexOf(e) + 3);
                  },
                ),
              ),
              isFull ? Container() : Container(width: 36, height: 14),
              SizedBox(width: 10),
              Text(
                item.row,
                style: GoogleFonts.poppins(
                  color: Color(0Xff6D6D80),
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
