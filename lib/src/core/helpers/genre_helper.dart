import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../enums/genre.dart';

class GenreHelper {
  GenreHelper._();

  static String convertToString(AppLocalizations? appLocalizations, Genre genre) {
    switch (genre) {
      case Genre.all:
        return appLocalizations?.genreAll ?? '';
      case Genre.sciFi:
        return appLocalizations?.genreSciFi ?? '';
      case Genre.comedy:
        return appLocalizations?.genreComedy ?? '';
      case Genre.family:
        return appLocalizations?.genreFamily ?? '';
      case Genre.adventure:
        return appLocalizations?.genreAdventure ?? '';
      case Genre.drama:
        return appLocalizations?.genreDrama ?? '';
      case Genre.thriller:
        return appLocalizations?.genreThriller ?? '';
      case Genre.mystery:
        return appLocalizations?.genreMystery ?? '';
      case Genre.animation:
        return appLocalizations?.genreAnimation ?? '';
      case Genre.action:
        return appLocalizations?.genreAction ?? '';
      case Genre.fantasy:
        return appLocalizations?.genreFantasy ?? '';
      case Genre.romance:
        return appLocalizations?.genreRomance ?? '';
      case Genre.horror:
        return appLocalizations?.genreHorror ?? '';
      case Genre.crime:
        return appLocalizations?.genreCrime ?? '';
      case Genre.documentary:
        return appLocalizations?.genreDocumentary ?? '';
      case Genre.sport:
        return appLocalizations?.genreSport ?? '';
      case Genre.short:
        return appLocalizations?.genreShort ?? '';
      case Genre.anime:
        return appLocalizations?.genreAnime ?? '';
      case Genre.history:
        return appLocalizations?.genreHistory ?? '';
      case Genre.theatreMusical:
        return appLocalizations?.genreMusical ?? '';
      case Genre.western:
        return appLocalizations?.genreWestern ?? '';
      case Genre.biography:
        return appLocalizations?.genreBiography ?? '';
      case Genre.musical:
        return appLocalizations?.genreMusic ?? '';
      case Genre.war:
        return appLocalizations?.genreWar ?? '';
      case Genre.adult:
        return appLocalizations?.genreAdult ?? '';
    }
  }
}
