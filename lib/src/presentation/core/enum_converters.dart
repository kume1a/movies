
import 'package:movo/src/domain/core/enums.dart';

String getGenre(Genre genre) {
  switch (genre) {
    case Genre.all:
      return 'All';
    case Genre.animated:
      return 'Animated';
    case Genre.biographical:
      return 'Biographical';
    case Genre.detective:
      return 'Detective';
    case Genre.documentary:
      return 'Documentary';
    case Genre.drama:
      return 'Drama';
    case Genre.erotic:
      return 'Erotic';
    case Genre.western:
      return 'Western';
    case Genre.historical:
      return 'Historical';
    case Genre.comedy:
      return 'Comedy';
    case Genre.melodrama:
      return 'Melodrama';
    case Genre.musical:
      return 'Musical';
    case Genre.short:
      return 'Short';
    case Genre.mysticism:
      return 'Mysticism';
    case Genre.theatreMusical:
      return 'Theatre Musical';
    case Genre.sharpStory:
      return 'Sharp - story';
    case Genre.adventure:
      return 'Adventure';
    case Genre.fantastic:
      return 'fantastic';
    case Genre.military:
      return 'Military';
    case Genre.family:
      return 'Family';
    case Genre.horror:
      return 'Horror';
    case Genre.sports:
      return 'Sports';
    case Genre.thriller:
      return 'Thriller';
    case Genre.fabulous:
      return 'Fabulous';
    case Genre.anime:
      return 'Anime';
  }
  return '';
}
