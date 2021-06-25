import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HomeMovie extends StatefulWidget {
  @override
  _HomeMovieState createState() => _HomeMovieState();
}

class _HomeMovieState extends State<HomeMovie> {
  int _selectedIndex = 0;
  int _selectedTabIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  BottomNavigationBarItem bottomNavigationBarItem({
    required String assets,
    required String title,
    bool isActive = false,
  }) {
    return BottomNavigationBarItem(
      icon: Container(
        child: Column(
          children: [
            isActive
                ? Image.asset(
                    'assets/images/ic_movies_active.png',
                    width: 20,
                    height: 20,
                  )
                : SvgPicture.asset(
                    assets,
                    width: 20,
                    height: 20,
                  ),
            SizedBox(
              height: 5,
            ),
            Text(
              title,
              style: GoogleFonts.poppins(
                color: isActive ? Color(0xFFFF3365) : Color(0xFF6D6D80),
                fontWeight: isActive ? FontWeight.w700 : FontWeight.w400,
                fontSize: 12,
              ),
            )
          ],
        ),
      ),
      label: '',
      backgroundColor: Color(0xFF191926),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Color(0xFF191926),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.red,
          items: [
            bottomNavigationBarItem(
              assets: 'assets/images/ic_tickets.svg',
              title: 'Movies',
              isActive: _selectedIndex == 0,
            ),
            bottomNavigationBarItem(
              assets: 'assets/images/ic_tickets.svg',
              title: 'Tickets',
              isActive: _selectedIndex == 1,
            ),
            bottomNavigationBarItem(
              assets: 'assets/images/ic_cinema.svg',
              title: 'Cinema',
              isActive: _selectedIndex == 2,
            ),
            bottomNavigationBarItem(
              assets: 'assets/images/ic_profile.svg',
              title: 'Profile',
              isActive: _selectedIndex == 3,
            ),
          ],
          selectedFontSize: 0,
          unselectedFontSize: 0,
          showSelectedLabels: false,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
        appBar: AppBar(
          backgroundColor: Color(0xFF191926),
          title: Container(
            margin: EdgeInsets.only(bottom: 5),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/ic_location.png',
                  width: 16,
                  height: 16,
                ),
                SizedBox(width: 10),
                Text(
                  'Warszawa,poland',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.search,
                  color: Color(0xFF6D6D80),
                )
              ],
            ),
          ),
          bottom: TabBar(
            onTap: (int e) {
              setState(() {
                _selectedTabIndex = e;
              });
            },
            isScrollable: true,
            indicator: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 3.0,
                  color: Color(0xFFFF3365),
                ),
              ),
            ),
            tabs: [
              Tab(
                child: TabbarItem(
                  title: 'Near You',
                  isActive: _selectedTabIndex == 0,
                ),
              ),
              Tab(
                child: TabbarItem(
                  title: 'Comming soon',
                  isActive: _selectedTabIndex == 1,
                ),
              ),
              Tab(
                child: TabbarItem(
                  title: 'Premiers',
                  isActive: _selectedTabIndex == 2,
                ),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              margin: EdgeInsets.only(
                left: 5,
                right: 5,
                top: 10,
              ),
              child: StaggeredGridView.countBuilder(
                crossAxisCount: 4,
                itemCount: 8,
                itemBuilder: (BuildContext context, int index) => CardMovie(),
                staggeredTileBuilder: (int index) => StaggeredTile.count(
                  2,
                  index.isEven ? 3 : 3.1,
                ),
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
              ),
            ),
            Column(
              children: [
                Text('hello'),
              ],
            ),
            Column(
              children: [
                Text('hello'),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class TabbarItem extends StatelessWidget {
  TabbarItem({
    required this.isActive,
    required this.title,
  });

  final String title;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.poppins(
        fontWeight: isActive ? FontWeight.bold : FontWeight.w600,
        fontSize: 16,
        color: isActive ? Colors.white : Colors.white.withOpacity(0.3),
      ),
    );
  }
}

class CardMovie extends StatelessWidget {
  const CardMovie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.grey.withOpacity(0.1),
          width: 1,
        ),
        color: Color(0xFF191926),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment(0, 1),
          colors: [Color(0xff404056), Color(0xff222232)],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: Image.asset(
                  'assets/images/poster.jpg',
                  width: 190,
                  height: 220,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: 190,
                height: 220,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment(0, 1),
                    colors: [
                      Colors.black.withOpacity(0),
                      Colors.black.withOpacity(0),
                      Colors.black.withOpacity(0.6),
                      Colors.black.withOpacity(1),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 10,
                  top: 10,
                  right: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xFF191926),
                      ),
                      child: Text(
                        '13 +',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.favorite,
                      color: Colors.white.withOpacity(0.7),
                      size: 24,
                    )
                  ],
                ),
              ),
              Container(
                width: 190,
                height: 220,
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Action, adventure',
                      style: GoogleFonts.poppins(
                        color: Color(0xFFFF3466),
                        fontSize: 12,
                      ),
                    ),
                    Row(
                      children: [
                        RatingBar.builder(
                          initialRating: 5,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(
                            horizontal: 1.0,
                          ),
                          itemSize: 12.0,
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Color(0xFFFF3365),
                            size: 10,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        SizedBox(width: 10),
                        Text(
                          '125 reviews',
                          style: GoogleFonts.poppins(
                            color: Color(0xFF6D6D80),
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Awake (2021)',
                  style: GoogleFonts.poppins(
                    color: Color(0xFFECECEC).withOpacity(0.9),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '125 reviews',
                  style: GoogleFonts.poppins(
                    color: Color(0xFF6D6D80),
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
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
