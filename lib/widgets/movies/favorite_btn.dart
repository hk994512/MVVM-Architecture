import 'package:flutter/material.dart';
import 'package:mvvm/models/movies_model.dart';

import '../../constants/my_app_icons.dart';

class FavoriteBtnWidget extends StatefulWidget {
  const FavoriteBtnWidget({super.key, required this.movieModel});
  final MovieModel movieModel;

  @override
  State<FavoriteBtnWidget> createState() => _FavoriteBtnWidgetState();
}

class _FavoriteBtnWidgetState extends State<FavoriteBtnWidget> {
  final favoriteMoviesIds = [];
  @override
  Widget build(BuildContext context) {
    bool isFav = favoriteMoviesIds.contains(widget.movieModel.id);
    return IconButton(
      onPressed: () {
        isFav
            ? favoriteMoviesIds.remove(widget.movieModel.id)
            : favoriteMoviesIds.add(widget.movieModel.id);
        setState(() {});
      },
      icon: Icon(
        isFav ? MyAppIcons.favorite : MyAppIcons.favoriteOutlineRounded,
        size: 20,
        color: isFav ? Colors.red : null,
      ),
    );
  }
}
