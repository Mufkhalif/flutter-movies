import 'dart:convert';
import 'package:food_app/config/config.dart';
import 'package:food_app/models/cast_model.dart';
import 'package:food_app/models/detail_cast_model.dart';
import 'package:food_app/models/detail_movie_model.dart';
import 'package:food_app/models/movie_model.dart';
import 'package:http/http.dart' as http;

class MoviesServices {
  static Future getListMovies(int page) async {
    var url = Uri.parse(Config.baseUrl +
        '/3/movie/popular?api_key=' +
        Config.apiKey +
        '&page=' +
        page.toString());

    var apiResult = await http.get(url);
    var result = (json.decode(apiResult.body)
        as Map<String, dynamic>)['results'] as List;
    return result.map((item) => MovieModel.fromJson(item)).toList();
  }

  static Future getListMoviesUpComming(int page) async {
    var url = Uri.parse(Config.baseUrl +
        '/3/movie/upcoming?api_key=' +
        Config.apiKey +
        '&page=' +
        page.toString());

    var apiResult = await http.get(url);
    var result = (json.decode(apiResult.body)
        as Map<String, dynamic>)['results'] as List;
    return result.map((item) => MovieModel.fromJson(item)).toList();
  }

  static Future getDetailMovie(int id) async {
    var url =
        Uri.parse('${Config.baseUrl}/3/movie/$id?api_key=${Config.apiKey}');

    var apiResult = await http.get(url);
    var result = json.decode(apiResult.body);

    return DetailMovie.fromJson(result);
  }

  static Future getMovieCasts(int id) async {
    var url = Uri.parse(
        '${Config.baseUrl}/3/movie/$id/credits?api_key=${Config.apiKey}');

    var apiResult = await http.get(url);
    var result =
        (json.decode(apiResult.body) as Map<String, dynamic>)['cast'] as List;

    return result.map((item) => CastModel.fromJson(item)).toList();
  }

  static Future getDetailCast(int id) async {
    var url =
        Uri.parse('${Config.baseUrl}/3/person/$id?api_key=${Config.apiKey}');

    var apiResult = await http.get(url);
    var result = json.decode(apiResult.body);

    return DetailCastModel.fromJson(result);
  }
}
