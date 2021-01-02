import 'package:hive/hive.dart';
import 'package:movo/src/infrastructure/hive_box_holder.dart';

part 'enums.g.dart';

@HiveType(typeId: HiveTypeIdHolder.resolutionId)
enum Resolution {
  @HiveField(0)
  fhd,

  @HiveField(1)
  hd,

  @HiveField(2)
  vga,
}

@HiveType(typeId: HiveTypeIdHolder.imageSizeId)
enum ImageSize {
  @HiveField(0)
  small,

  @HiveField(1)
  large,
}

@HiveType(typeId: HiveTypeIdHolder.languageId)
enum Language {
  @HiveField(0)
  geo,

  @HiveField(1)
  eng,

  @HiveField(2)
  rus,

  @HiveField(3)
  jpn,
}
@HiveType(typeId: HiveTypeIdHolder.qualityId)
enum Quality {
  @HiveField(0)
  medium,

  @HiveField(1)
  high
}
enum MovieType { movie, series }
enum Period { day, week, month }
@HiveType(typeId: HiveTypeIdHolder.searchTypeId)
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
