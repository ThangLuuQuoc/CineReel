import 'package:cine_reel/bloc/movie_details_bloc.dart';
import 'package:cine_reel/bloc_providers/movie_details_provider.dart';
import 'package:cine_reel/ui/details_screen/movie_details_widget.dart';
import 'package:flutter/widgets.dart';

class MovieDetailsScreen extends StatefulWidget {
  @override
  _MovieDetailsStatefulState createState() => _MovieDetailsStatefulState();

  MovieDetailsScreen({Key key}) : super(key: key);
}

class _MovieDetailsStatefulState extends State<MovieDetailsScreen> {
  MovieDetailsBloc movieDetailsBloc;

  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    movieDetailsBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    movieDetailsBloc = MovieDetailsProvider.of(context);
    return StreamBuilder(
      key: Key('streamBuilder'),
      stream: movieDetailsBloc.stream,
      initialData: movieDetailsBloc.initialData(),
      builder: (context, snapshot) {
        final data = snapshot.data;
        return Column(
          children: <Widget>[
            Expanded(
              child: Stack(
								key: Key('content'),
								children: <Widget>[
                  MovieDetailsWidget(
                      hasFailed: data.hasFailed,
                      movieDetailsBloc: movieDetailsBloc,
                      movieDetails: data.movieDetails)
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
