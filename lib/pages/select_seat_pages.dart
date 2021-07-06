import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/controllers/chooseSessionController.dart';
import 'package:food_app/themes/themes.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

var listSears = [
  {
    "row": "A",
    "count": [
      {"id": 1, "type": "booked"},
      {"id": 1, "type": "booked"},
      {"id": 1, "type": "booked"},
      {"id": 1, "type": "booked"},
    ]
  },
  {"row": "B", "count": 8},
];

class SelectSeatPages extends StatelessWidget {
  final ChooseController chooseC = Get.put(ChooseController());

  @override
  Widget build(BuildContext context) {
    print("hello");
    return Scaffold(
      backgroundColor: darkColor,
      appBar: AppBar(
        backgroundColor: darkColor,
        leading: GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.keyboard_arrow_left_outlined,
            color: Colors.white.withOpacity(0.6),
          ),
        ),
        title: Text(
          'Select Seats',
          style: GoogleFonts.poppins(
            color: Colors.white.withOpacity(0.6),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 24, top: 30, right: 24),
            child: Row(
              children: [
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xff8036E7),
                        Color(0xffFF3365),
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '27',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Friday',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Avengers: End Game',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Multikino: Atrium Targówek',
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF212131),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment(0, 1),
                            colors: [
                              Color(0xff404056),
                              Color(0xff222232),
                            ],
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '19:00',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      Row(
                        children: [
                          Row(children: [
                            SvgPicture.asset(
                              'assets/images/cair_booked.svg',
                            ),
                            SizedBox(width: 10),
                            Text(
                              'BOOKED',
                              style: GoogleFonts.poppins(
                                color: Color(0Xff6D6D80),
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                              ),
                            ),
                          ]),
                          SizedBox(width: 15),
                          Row(children: [
                            SvgPicture.asset(
                              'assets/images/cair_available.svg',
                            ),
                            SizedBox(width: 10),
                            Text(
                              'AVAILABLE',
                              style: GoogleFonts.poppins(
                                color: Color(0Xff6D6D80),
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                              ),
                            ),
                          ]),
                          SizedBox(width: 15),
                          Row(children: [
                            SvgPicture.asset(
                              'assets/images/cair_selected.svg',
                            ),
                            SizedBox(width: 10),
                            Text(
                              'SELECTED',
                              style: GoogleFonts.poppins(
                                color: Color(0Xff6D6D80),
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                              ),
                            ),
                          ]),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Stack(
                  children: [
                    Image.asset(
                      'assets/images/screen_monitor.png',
                      width: double.infinity,
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 60, right: 24, left: 24),
                      child: GetBuilder<ChooseController>(
                        builder: (_) {
                          return Column(
                            children: [
                              ...chooseC.listSeats.map(
                                (e) => FullRow(
                                  index: chooseC.listSeats.indexOf(e),
                                  isFull: e.count.length > 6,
                                  item: e,
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class FullRow extends StatelessWidget {
  final ChooseController chooseC = Get.find<ChooseController>();
  final bool isFull;
  final SeatModel item;
  final int index;

  FullRow({required this.isFull, required this.item, required this.index});

  @override
  Widget build(BuildContext context) {
    print("re render full row");

    var left = isFull
        ? item.count.where((e) => e.id < 5).toList()
        : item.count.where((e) => e.id < 4).toList();

    var right = isFull
        ? item.count.where((e) => e.id > 4).toList()
        : item.count.where((e) => e.id > 3).toList();

    return Row(
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
    );
  }
}

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
        ),
      ),
    );
  }
}
