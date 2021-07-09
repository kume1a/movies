import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

  static String convertToString(AppLocalizations? appLocalizations, MovieGenre movieGenre) {
    switch (movieGenre) {
      case MovieGenre.sciFi:
        return appLocalizations?.genreSciFi ?? '';
      case MovieGenre.comedy:
        return appLocalizations?.genreComedy ?? '';
      case MovieGenre.family:
        return appLocalizations?.genreFamily ?? '';
      case MovieGenre.adventure:
        return appLocalizations?.genreAdventure ?? '';
      case MovieGenre.drama:
        return appLocalizations?.genreDrama ?? '';
      case MovieGenre.thriller:
        return appLocalizations?.genreThriller ?? '';
      case MovieGenre.mystery:
        return appLocalizations?.genreMystery ?? '';
      case MovieGenre.tvSeries:
        return appLocalizations?.genreTvSeries ?? '';
      case MovieGenre.animation:
        return appLocalizations?.genreAnimation ?? '';
      case MovieGenre.action:
        return appLocalizations?.genreAction ?? '';
      case MovieGenre.fantasy:
        return appLocalizations?.genreFantasy ?? '';
      case MovieGenre.romance:
        return appLocalizations?.genreRomance ?? '';
      case MovieGenre.horror:
        return appLocalizations?.genreHorror ?? '';
      case MovieGenre.crime:
        return appLocalizations?.genreCrime ?? '';
      case MovieGenre.realityTV:
        return appLocalizations?.genreRealityTV ?? '';
      case MovieGenre.documentary:
        return appLocalizations?.genreDocumentary ?? '';
      case MovieGenre.sport:
        return appLocalizations?.genreSport ?? '';
      case MovieGenre.short:
        return appLocalizations?.genreShort ?? '';
      case MovieGenre.anime:
        return appLocalizations?.genreAnime ?? '';
      case MovieGenre.history:
        return appLocalizations?.genreHistory ?? '';
      case MovieGenre.musical:
        return appLocalizations?.genreMusical ?? '';
      case MovieGenre.western:
        return appLocalizations?.genreWestern ?? '';
      case MovieGenre.biography:
        return appLocalizations?.genreBiography ?? '';
      case MovieGenre.music:
        return appLocalizations?.genreMusic ?? '';
      case MovieGenre.war:
        return appLocalizations?.genreWar ?? '';
      case MovieGenre.adult:
        return appLocalizations?.genreAdult ?? '';
      case MovieGenre.auto:
        return appLocalizations?.genreAuto ?? '';
    }
  }
}
