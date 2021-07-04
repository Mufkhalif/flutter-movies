import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:food_app/controllers/movieController.dart';
import 'package:food_app/widgets/card_movie.dart';
import 'package:get/get.dart';

class ListMovie extends StatelessWidget {
  final MovieController movieC = Get.find<MovieController>();
  final String type;

  ListMovie({required this.type});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MovieController>(
      builder: (_) {
        var cMovie =
            type == "upcomming" ? movieC.listMovieUpcomming : movieC.listMovie;

        var cLoading = type == "upcomming"
            ? movieC.isLoadingUpComming.value
            : movieC.isLoading.value;

        var cLoadingMore = type == "upcomming"
            ? movieC.isLoadingUpCommingMore.value
            : movieC.isLoadingMore.value;
        return cLoading
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
                  itemCount: cMovie.length,
                  itemBuilder: (BuildContext context, int index) =>
                      index == cMovie.length - 1
                          ? AnimatedContainer(
                              duration: Duration(milliseconds: 400),
                              width: 80,
                              decoration: cLoadingMore
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
                              item: cMovie[index],
                            ),
                  staggeredTileBuilder: (int index) => StaggeredTile.count(
                    2,
                    index.isEven ? 2.9 : 3.0,
                  ),
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                ),
              );
      },
    );
  }
}
