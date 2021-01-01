// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_position_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MoviePositionAdapter extends TypeAdapter<MoviePosition> {
  @override
  final int typeId = 5;

  @override
  MoviePosition read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MoviePosition(
      fields[0] as int,
      fields[1] as int,
      fields[2] as int,
      fields[3] as bool,
      fields[4] as int,
      fields[5] as int,
      fields[6] as int,
    );
  }

  @override
  void write(BinaryWriter writer, MoviePosition obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.movieId)
      ..writeByte(1)
      ..write(obj.durationInMillis)
      ..writeByte(2)
      ..write(obj.leftAt)
      ..writeByte(3)
      ..write(obj.isTvShow)
      ..writeByte(4)
      ..write(obj.season)
      ..writeByte(5)
      ..write(obj.episode)
      ..writeByte(6)
      ..write(obj.timestamp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MoviePositionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
