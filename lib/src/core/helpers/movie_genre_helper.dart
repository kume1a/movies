import 'package:get/get.dart';

import '../../l10n/translation_keys.dart';
import '../enums/movie_genre.dart';

class MovieGenreHelper {
  MovieGenreHelper._();

  static MovieGenre? fromSchema(String genre) {
    return <String, MovieGenre>{
      'Sci-Fi': MovieGenre.sciFi,
      'Comedy': MovieGenre.comedy,
      'Family': MovieGenre.family,
      'Adventure': MovieGenre.adventure,
      'Drama': MovieGenre.drama,
      'Thriller': MovieGenre.thriller,
      'Mystery': MovieGenre.mystery,
      'TV Series': MovieGenre.tvSeries,
      'Animation': MovieGenre.animation,
      'Action': MovieGenre.action,
      'Fantasy': MovieGenre.fantasy,
      'Romance': MovieGenre.romance,
      'Horror': MovieGenre.horror,
      'Crime': MovieGenre.crime,
      'Reality-TV': MovieGenre.realityTV,
      'Documentary': MovieGenre.documentary,
      'Sport': MovieGenre.sport,
      'Short': MovieGenre.short,
      'Anime': MovieGenre.anime,
      'History': MovieGenre.history,
      'Musical': MovieGenre.musical,
      'Western': MovieGenre.western,
      'Biography': MovieGenre.biography,
      'Music': MovieGenre.music,
      'War': MovieGenre.war,
      'Adult': MovieGenre.adult,
      'Auto': MovieGenre.auto,
    }[genre];
  }

  static String convertToString(MovieGenre movieGenre) {
    switch (movieGenre) {
      case MovieGenre.sciFi:
        return trGenreSciFi.tr;
      case MovieGenre.comedy:
        return trGenreComedy.tr;
      case MovieGenre.family:
        return trGenreFamily.tr;
      case MovieGenre.adventure:
        return trGenreAdventure.tr;
      case MovieGenre.drama:
        return trGenreDrama.tr;
      case MovieGenre.thriller:
        return trGenreThriller.tr;
      case MovieGenre.mystery:
        return trGenreMystery.tr;
      case MovieGenre.tvSeries:
        return trGenreTvSeries.tr;
      case MovieGenre.animation:
        return trGenreAnimation.tr;
      case MovieGenre.action:
        return trGenreAction.tr;
      case MovieGenre.fantasy:
        return trGenreFantasy.tr;
      case MovieGenre.romance:
        return trGenreRomance.tr;
      case MovieGenre.horror:
        return trGenreHorror.tr;
      case MovieGenre.crime:
        return trGenreCrime.tr;
      case MovieGenre.realityTV:
        return trGenreRealityTV.tr;
      case MovieGenre.documentary:
        return trGenreDocumentary.tr;
      case MovieGenre.sport:
        return trGenreSport.tr;
      case MovieGenre.short:
        return trGenreShort.tr;
      case MovieGenre.anime:
        return trGenreAnime.tr;
      case MovieGenre.history:
        return trGenreHistory.tr;
      case MovieGenre.musical:
        return trGenreMusical.tr;
      case MovieGenre.western:
        return trGenreWestern.tr;
      case MovieGenre.biography:
        return trGenreBiography.tr;
      case MovieGenre.music:
        return trGenreMusic.tr;
      case MovieGenre.war:
        return trGenreWar.tr;
      case MovieGenre.adult:
        return trGenreAdult.tr;
      case MovieGenre.auto:
        return trGenreAuto.tr;
    }
  }
}
