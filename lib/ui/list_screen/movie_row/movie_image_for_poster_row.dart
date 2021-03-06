import 'package:cine_reel/constants/api_constants.dart';
import 'package:cine_reel/utils/image_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:transparent_image/transparent_image.dart';

class MovieImageForRow extends StatelessWidget {
  final IMAGE_TYPE imageType;
  final String size;
  final String imagePath;
  final int movieId;

  MovieImageForRow({this.movieId, this.imagePath, this.imageType, this.size});

  @override
  Widget build(BuildContext context) {
		return Hero(child: getFadeInImage(context), tag: "$movieId-imagePath");
  }

  Widget getFadeInImage(BuildContext context) {
    return SizedBox(
			width: MediaQuery.of(context).size.width * 0.45,
      child: FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: ImageHelper.getImagePath(imagePath, size),
          fit: BoxFit.fitWidth),
    );
  }
}
