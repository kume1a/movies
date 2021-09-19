import 'package:get/get.dart';

import '../../l10n/translation_keys.dart';
import '../enums/genre.dart';

class GenreHelper {
  GenreHelper._();

  static String convertToString(Genre genre) {
    switch (genre) {
      case Genre.all:
        return trGenreAll.tr;
      case Genre.sciFi:
        return trGenreSciFi.tr;
      case Genre.comedy:
        return trGenreComedy.tr;
      case Genre.family:
        return trGenreFamily.tr;
      case Genre.adventure:
        return trGenreAdventure.tr;
      case Genre.drama:
        return trGenreDrama.tr;
      case Genre.thriller:
        return trGenreThriller.tr;
      case Genre.mystery:
        return trGenreMystery.tr;
      case Genre.animation:
        return trGenreAnimation.tr;
      case Genre.action:
        return trGenreAction.tr;
      case Genre.fantasy:
        return trGenreFantasy.tr;
      case Genre.romance:
        return trGenreRomance.tr;
      case Genre.horror:
        return trGenreHorror.tr;
      case Genre.crime:
        return trGenreCrime.tr;
      case Genre.documentary:
        return trGenreDocumentary.tr;
      case Genre.sport:
        return trGenreSport.tr;
      case Genre.short:
        return trGenreShort.tr;
      case Genre.anime:
        return trGenreAnime.tr;
      case Genre.history:
        return trGenreHistory.tr;
      case Genre.theatreMusical:
        return trGenreMusical.tr;
      case Genre.western:
        return trGenreWestern.tr;
      case Genre.biography:
        return trGenreBiography.tr;
      case Genre.musical:
        return trGenreMusic.tr;
      case Genre.war:
        return trGenreWar.tr;
      case Genre.adult:
        return trGenreAdult.tr;
    }
  }
}
