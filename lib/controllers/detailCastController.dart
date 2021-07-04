import 'package:food_app/models/detail_cast_model.dart';
import 'package:food_app/models/movie_model.dart';
import 'package:food_app/services/get_movies.dart';
import 'package:get/get.dart';

class DetailCastController extends GetxController {
  var isLoading = false.obs;
  final cast = DetailCastModel(
    adult: false,
    biography: "",
    birthday: "",
    gender: 1,
    id: 1,
    name: "",
    placeBirth: "",
    popularity: "",
    profilePath: "",
    type: "",
  ).obs;

  List<MovieModel> listMovies = [];

  void goToDetail({required int id, required String posterPath}) {
    cast.value.id = id;
    cast.value.profilePath = posterPath;
    getDetailCast(id);
    update();
  }

  void getDetailCast(int id) async {
    isLoading.value = true;
    cast.value = await MoviesServices.getDetailCast(id);
    listMovies = await MoviesServices.getListMoviesByCastid(id);
    isLoading.value = false;
    update();
  }
}
