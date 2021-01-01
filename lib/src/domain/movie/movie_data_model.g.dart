// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieDataAdapter extends TypeAdapter<MovieData> {
  @override
  final int typeId = 0;

  @override
  MovieData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieData(
      fields[0] as int,
      fields[1] as int,
      fields[2] as String,
      fields[3] as int,
      fields[4] as String,
      fields[5] as bool,
      fields[6] as int,
      fields[7] as bool,
      fields[8] as String,
      fields[9] as double,
      fields[10] as int,
      (fields[11] as Map)?.cast<ImageSize, String>(),
      (fields[12] as Map)?.cast<Resolution, String>(),
      fields[13] as String,
      (fields[14] as List)?.cast<String>(),
      (fields[15] as Map)?.cast<Language, String>(),
      (fields[16] as List)?.cast<Language>(),
      (fields[17] as List)?.cast<Season>(),
      fields[18] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, MovieData obj) {
    writer
      ..writeByte(19)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.movieId)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.year)
      ..writeByte(4)
      ..write(obj.imdbUrl)
      ..writeByte(5)
      ..write(obj.isTvShow)
      ..writeByte(6)
      ..write(obj.duration)
      ..writeByte(7)
      ..write(obj.canBePlayed)
      ..writeByte(8)
      ..write(obj.poster)
      ..writeByte(9)
      ..write(obj.imdbRating)
      ..writeByte(10)
      ..write(obj.voterCount)
      ..writeByte(11)
      ..write(obj.covers)
      ..writeByte(12)
      ..write(obj.secondaryCovers)
      ..writeByte(13)
      ..write(obj.plot)
      ..writeByte(14)
      ..write(obj.genres)
      ..writeByte(15)
      ..write(obj.trailers)
      ..writeByte(16)
      ..write(obj.languages)
      ..writeByte(17)
      ..write(obj.seasons)
      ..writeByte(18)
      ..write(obj.favorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SeasonAdapter extends TypeAdapter<Season> {
  @override
  final int typeId = 1;

  @override
  Season read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Season(
      fields[0] as int,
      fields[1] as int,
      fields[2] as String,
      fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Season obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.movieId)
      ..writeByte(1)
      ..write(obj.number)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.episodesCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SeasonAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
