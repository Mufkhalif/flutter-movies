import 'package:flutter/material.dart';
import 'package:food_app/controllers/movieController.dart';
import 'package:food_app/pages/bottomtab/favorite.dart';
import 'package:food_app/pages/bottomtab/tickets.dart';
import 'package:food_app/widgets/card_movie.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
        padding: EdgeInsets.only(top: 12),
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
              )
            : AppBar(
                backgroundColor: Color(0xFF191926),
              ),
        body: _selectedIndex == 0
            ? TabBarView(
                children: [
                  ListMovie(),
                  ListMovie(),
                  ListMovie(),
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

class ListMovie extends StatelessWidget {
  final MovieController movieC = Get.find<MovieController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MovieController>(
      builder: (_) {
        return movieC.isLoading.value
            ? Container(
                child: Center(
                  child: Text(
                    'Memuat ...',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            : Container(
                margin: EdgeInsets.only(
                  left: 5,
                  right: 5,
                  top: 10,
                ),
                child: StaggeredGridView.countBuilder(
                  controller: movieC.scrollController,
                  crossAxisCount: 4,
                  itemCount: movieC.listMovie.length,
                  itemBuilder: (BuildContext context, int index) =>
                      index == movieC.listMovie.length - 1
                          ? AnimatedContainer(
                              duration: Duration(milliseconds: 400),
                              width: 80,
                              decoration: movieC.isLoadingMore.value
                                  ? BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(
                                        color: Colors.grey.withOpacity(0.1),
                                        width: 1,
                                      ),
                                      color: Color(0xFF191926),
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment(0, 1),
                                        colors: [
                                          Color(0xff404056),
                                          Color(0xff222232),
                                        ],
                                      ),
                                    )
                                  : null,
                            )
                          : CardMovie(
                              index: index,
                              item: movieC.listMovie[index],
                            ),
                  staggeredTileBuilder: (int index) => StaggeredTile.count(
                    2,
                    index.isEven ? 3.1 : 3.2,
                  ),
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                ),
              );
      },
    );
  }
}
