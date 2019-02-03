import 'package:flutter/material.dart';
import 'package:movie_app/src/data/bloc/moviebloc.dart';
import 'package:movie_app/src/ui/home_page.dart';

import 'src/data/bloc/movie_provider.dart';

void main() => runApp(myApp());

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Movie",
      home: Scaffold(
        body: MovieProvider(movieBloc: MovieBloc(), child: HomePage()),
      ),
    );
  }
}
