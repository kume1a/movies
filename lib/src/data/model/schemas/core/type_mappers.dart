import '../../../../core/enums/language.dart';
import '../../../../core/enums/quality.dart';
import '../../../../core/enums/search_type.dart';

const String medium = 'MEDIUM';
const String high = 'HIGH';

const String eng = 'ENG';
const String geo = 'GEO';
const String rus = 'RUS';
const String jpn = 'JPN';
const String fre = 'FRE';
const String ger = 'GER';
const String kor = 'KOR';
const String por = 'POR';
const String spa = 'SPA';

const String movie = 'movie';
const String person = 'person';

Quality getQuality(String? quality) {
  switch (quality) {
    case medium:
      return Quality.medium;
    case high:
      return Quality.high;
  }
  return Quality.high;
}

Language getLanguage(String? language) {
  switch (language) {
    case geo:
      return Language.geo;
    case eng:
      return Language.eng;
    case rus:
      return Language.rus;
    case jpn:
      return Language.jpn;
    case fre:
      return Language.fre;
    case ger:
      return Language.ger;
    case kor:
      return Language.kor;
    case por:
      return Language.por;
    case spa:
      return Language.spa;
  }
  return Language.eng;
}

SearchType getSearchType(String? type) {
  switch (type) {
    case movie:
      return SearchType.movie;
    case person:
      return SearchType.person;
  }
  return SearchType.movie;
}
