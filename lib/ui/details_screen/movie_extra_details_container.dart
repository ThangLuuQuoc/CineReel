import 'package:cine_reel/bloc/movie_details_bloc.dart';
import 'package:cine_reel/models/tmdb_movie_details.dart';
import 'package:cine_reel/ui/common_widgets/common_widgets.dart';
import 'package:cine_reel/ui/common_widgets/movies_loading_widget.dart';
import 'package:cine_reel/ui/details_screen/cast_widget.dart';
import 'package:cine_reel/ui/details_screen/movie_details_ratings_widget.dart';
import 'package:flutter/widgets.dart';

class MovieExtraDetailsContainer extends StatelessWidget {
  final TMDBMovieDetails movieDetails;
  final MovieDetailsBloc movieDetailsBloc;

  MovieExtraDetailsContainer({this.movieDetails, this.movieDetailsBloc});

  @override
  Widget build(BuildContext context) {
    return AnimateChildren(
        childOne: Column(
					crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
						MovieDetailsRatingsWidget(
                movieDetails: movieDetails, movieDetailsBloc: movieDetailsBloc),
						buildHorizontalDivider(),
						CastWidget(movieDetails: movieDetails),
						buildHorizontalDivider(),
//						CrewWidget(movieDetails: movieDetails),
//            buildHorizontalDivider(),
          ],
        ),
        childTwo: Padding(
          padding: const EdgeInsets.all(8.0),
          child: MoviesLoadingWidget(visible: true),
        ),
        showHappyPath: movieDetails.hasData);
  }
}
