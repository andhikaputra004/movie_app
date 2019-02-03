import 'package:flutter/material.dart';
import 'package:movie_app/src/data/bloc/moviebloc.dart';
import 'package:movie_app/src/data/model/model.dart';
import 'package:movie_app/src/util/const.dart';
import 'package:movie_app/src/data/bloc/movie_provider.dart';
class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final movieBloc = MovieProvider.of(context);
    _createTile(Movie movie) => Material(
      shadowColor: Colors.grey[500],
      elevation: 15.0,
      child: InkWell(
        onTap: () {

        },
        child: Card(
          elevation: 0.0,
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Image.network('$POSTER_PATH_URL${movie.posterPath}',
                  fit: BoxFit.cover),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(
                    left: 4.0,
                    right: 4.0,
                  ),
                  child: Center(
                    child: Text(
                      movie.title,
                      softWrap: true,
                      style: TextStyle(
                          fontSize: 10.0, fontFamily: 'Merriweather'),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );

    return StreamBuilder(
        stream: movieBloc.subject,
        builder: (context, AsyncSnapshot<MovieResponse> snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());

          final movies = snapshot.data.movies;

          return GridView.count(
            padding: const EdgeInsets.all(16.0),
            crossAxisCount: 3,
            childAspectRatio: 2 / 3.5,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            children: movies.map((movie) => _createTile(movie)).toList(),
          );
        });
  }
}
