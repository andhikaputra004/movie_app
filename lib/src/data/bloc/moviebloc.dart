import 'package:movie_app/src/data/model/model.dart';
import 'package:movie_app/src/data/repository/movie_repository.dart';
import 'package:rxdart/rxdart.dart';

class MovieBloc {
  final _movieRepo = MovieRepository();
  final BehaviorSubject<MovieResponse> _subject =
      BehaviorSubject<MovieResponse>();

  MovieBloc(){
    getMovie();
  }

  getMovie() async{
    MovieResponse response = await _movieRepo.movie();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<MovieResponse> get subject => _subject.stream;
}
