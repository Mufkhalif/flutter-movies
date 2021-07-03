import 'package:flutter/material.dart';
import 'package:food_app/controllers/movieController.dart';
import 'package:food_app/pages/bottomtab/favorite.dart';
import 'package:food_app/pages/bottomtab/tickets.dart';
import 'package:food_app/pages/home/list_popular_movie.dart';
import 'package:food_app/themes/themes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'bottomtab/cinema.dart';

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

class HomeMovie extends StatefulWidget {
  @override
  _HomeMovieState createState() => _HomeMovieState();
}

class _HomeMovieState extends State<HomeMovie> {
  int _selectedIndex = 0;
  int _selectedTabIndex = 0;

  final MovieController movieC = Get.put(MovieController());

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
        padding: EdgeInsets.only(top: 12, bottom: 10),
        child: Column(
          children: [
            Image.asset(
              assets,
              width: 20,
              height: 20,
            ),
            SizedBox(height: 5),
            Text(
              title,
              style: GoogleFonts.poppins(
                color: isActive ? primaryColor : Color(0xFF6D6D80),
                fontWeight: isActive ? FontWeight.w700 : FontWeight.w400,
                fontSize: 12,
              ),
            )
          ],
        ),
      ),
      label: '',
      backgroundColor: darkColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: darkColor,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.red,
          items: [
            bottomNavigationBarItem(
              assets: _selectedIndex == 0
                  ? 'assets/images/ic_movies_active.png'
                  : 'assets/images/ic_movies.png',
              title: 'Movies',
              isActive: _selectedIndex == 0,
            ),
            bottomNavigationBarItem(
              assets: _selectedIndex == 1
                  ? 'assets/images/ic_tickets_active.png'
                  : 'assets/images/ic_tickets.png',
              title: 'Tickets',
              isActive: _selectedIndex == 1,
            ),
            bottomNavigationBarItem(
              assets: _selectedIndex == 2
                  ? 'assets/images/ic_cinema_active.png'
                  : 'assets/images/ic_cinema.png',
              title: 'Cinema',
              isActive: _selectedIndex == 2,
            ),
            bottomNavigationBarItem(
              assets: _selectedIndex == 3
                  ? 'assets/images/ic_favorite_active.png'
                  : 'assets/images/ic_favourite.png',
              title: 'Favorite',
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
        appBar: _selectedIndex == 0
            ? AppBar(
                backgroundColor: darkColor,
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
                    if (e == 1) {
                      movieC.loadUpComming();
                    } else {
                      movieC.loadFirst();
                    }

                    setState(() {
                      _selectedTabIndex = e;
                    });
                  },
                  isScrollable: true,
                  indicator: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 3.0,
                        color: primaryColor,
                      ),
                    ),
                  ),
                  tabs: [
                    Tab(
                      child: TabbarItem(
                        title: 'Popular',
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
              )
            : AppBar(
                backgroundColor: darkColor,
              ),
        body: _selectedIndex == 0
            ? TabBarView(
                children: [
                  ListMovie(type: "popular"),
                  ListMovie(type: "upcomming"),
                  ListMovie(type: "popular"),
                ],
              )
            : _selectedIndex == 1
                ? TicketView()
                : _selectedIndex == 2
                    ? Cinema()
                    : Favorite(),
      ),
    );
  }
}
