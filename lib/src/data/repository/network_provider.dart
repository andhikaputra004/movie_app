import 'package:movie_app/src/data/model/model.dart';
import 'package:movie_app/src/util/const.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'dart:convert';
class NetworkProvider {
//  final _url = "$BASE_URL/now_playing";
//  final _dio = Dio();
//
//  Future<MovieResponse> getMovie() async{
//      Response response = await _dio.get(_url,queryParameters: {"api_key":"$API_KEY","language":"en-US","page":1});
//      return MovieResponse.fromJSON(response.data);
//  }

  Future<MovieResponse> getMovie() async {

    final url = '$BASE_URL/now_playing?api_key=$API_KEY&language=en-US&page=1';

    var response = await http
        .get(url)
        .then((response) => (response.body))
        .then(json.decode)
        .catchError((Exception e) => print('Error ${e.toString()}'));

    print(response.toString());

    MovieResponse movieResponse = MovieResponse.fromJSON(response);

    return movieResponse;
  }
}
