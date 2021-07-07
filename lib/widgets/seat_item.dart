import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/models/seat_model.dart';

class SeatItem extends StatelessWidget {
  final RowModel item;
  final VoidCallback onTap;

  SeatItem({required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(10),
        child: SvgPicture.asset(
          item.type == "booked"
              ? 'assets/images/cair_booked.svg'
              : item.type == "selected"
                  ? 'assets/images/cair_selected.svg'
                  : 'assets/images/cair_available.svg',
          height: 14,
          width: 12,
        ),
      ),
    );
  }
}
