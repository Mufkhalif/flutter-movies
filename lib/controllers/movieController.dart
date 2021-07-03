import 'package:flutter/material.dart';
import 'package:food_app/models/cast_model.dart';
import 'package:food_app/models/detail_movie_model.dart';
import 'package:food_app/models/movie_model.dart';
import 'package:food_app/services/get_movies.dart';
import 'package:get/get.dart';

class MovieController extends GetxController {
  var isLoading = false.obs;
  var isLoadingMore = false.obs;
  var page = 1;
  List<MovieModel> listMovie = [];
  ScrollController scrollController = ScrollController(
    initialScrollOffset: 0.0,
    keepScrollOffset: true,
  );

  List<MovieModel> listMovieUpcomming = [];
  var isLoadingUpComming = false.obs;
  var isLoadingUpCommingMore = false.obs;
  var pageUpComming = 1;

  final detailMovie = DetailMovie(
    adult: false,
    backdropPath: "",
    homePage: "",
    id: 0,
    originalTitle: "",
    overview: "",
    popularity: "",
    posterPath: "",
    voteCount: 0,
    relaseDate: "",
    genres: "",
  ).obs;
  var isLoadingDetail = false.obs;
  List<CastModel> casts = [];

  @override
  void onInit() async {
    loadFirst();

    scrollController.addListener(() {
      if (!isLoadingMore.value &&
          scrollController.position.pixels ==
              scrollController.position.maxScrollExtent) {
        isLoadingMore.value = true;
        page++;
        update();
        loadMore();
      }
    });

    super.onInit();
  }

  void goToDetail(int id) {
    getDetailMovie(id);
  }

  void loadFirst() async {
    isLoading.value = listMovie.length == 0 ? true : false;
    listMovie = await MoviesServices.getListMovies(page);
    update();
    isLoading.value = false;
  }

  void loadUpComming() async {
    isLoadingUpComming.value = listMovieUpcomming.length == 0 ? true : false;
    listMovieUpcomming =
        await MoviesServices.getListMoviesUpComming(pageUpComming);
    update();
    isLoadingUpComming.value = false;
  }

  void loadMore() async {
    var newData = await MoviesServices.getListMovies(page);
    listMovie = [...listMovie, ...newData];
    update();
    isLoadingMore.value = false;
  }

  void getDetailMovie(int id) async {
    detailMovie.value.id = id;
    isLoadingDetail.value = true;
    detailMovie.value = await MoviesServices.getDetailMovie(id);
    casts = await MoviesServices.getMovieCasts(id);
    update();
    isLoadingDetail.value = false;
  }
}
