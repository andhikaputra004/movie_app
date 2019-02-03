import 'package:flutter/material.dart';
import 'package:movie_app/src/data/bloc/moviebloc.dart';

class MovieProvider extends InheritedWidget {
  final MovieBloc movieBloc;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static MovieBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(MovieProvider) as MovieProvider)
          .movieBloc;

  MovieProvider({Key key, MovieBloc movieBloc, Widget child})
      : this.movieBloc = movieBloc ?? MovieBloc(),
        super(child: child, key: key);
}