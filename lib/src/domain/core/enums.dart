import 'package:hive/hive.dart';

part 'enums.g.dart';

@HiveType(typeId: 1)
enum Resolution {
  @HiveField(0)
  fhd,

  @HiveField(1)
  hd,

  @HiveField(2)
  vga,
}

@HiveType(typeId: 2)
enum ImageSize {
  @HiveField(0)
  small,

  @HiveField(1)
  large,
}

@HiveType(typeId: 3)
enum Language {
  @HiveField(0)
  geo,

  @HiveField(1)
  eng,

  @HiveField(2)
  rus,
}
enum Quality { medium, high }
enum MovieType { movie, series }
enum Period { day, week, month }
@HiveType(typeId: 7)
enum SearchType {

  @HiveField(0)
  movie,

  @HiveField(1)
  person
}
enum Genre {
  all,
  animated,
  biographical,
  detective,
  documentary,
  drama,
  erotic,
  western,
  historical,
  comedy,
  melodrama,
  musical,
  short,
  mysticism,
  theatreMusical,
  sharpStory,
  adventure,
  fantastic,
  military,
  family,
  horror,
  sports,
  thriller,
  fabulous,
  anime,
}
