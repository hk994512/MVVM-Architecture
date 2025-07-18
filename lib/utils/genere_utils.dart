import 'package:mvvm/models/movies_genre.dart';

import 'package:mvvm/repository/movies_repo.dart';
import 'package:mvvm/service/init_getit.dart';

class GenreUtils {
  static List<MoviesGenre> movieGenreNames(List<int> genreIds) {
    final movieRepo = getIt<MoviesRepository>();
    final cacheGenre = movieRepo.cachedGeneres;
    List<MoviesGenre> genreNames = [];
    for (var genreId in genreIds) {
      var genre = cacheGenre.firstWhere(
        (g) => g.id == genreId,
        orElse: () => MoviesGenre(id: 5448484, name: 'Unknown'),
      );
      genreNames.add(genre);
    }
    return genreNames;
  }
}
