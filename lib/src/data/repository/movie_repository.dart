import 'package:movie_app/src/data/repository/network_provider.dart';
import 'package:movie_app/src/data/model/model.dart';

class MovieRepository{
  NetworkProvider _networkProvider =NetworkProvider();

  Future<MovieResponse> movie(){
    return _networkProvider.getMovie();
  }
}