// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'season_files_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SeasonFilesAdapter extends TypeAdapter<SeasonFiles> {
  @override
  final int typeId = 8;

  @override
  SeasonFiles read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SeasonFiles(
      fields[0] as int,
      (fields[1] as List)?.cast<Episode>(),
    );
  }

  @override
  void write(BinaryWriter writer, SeasonFiles obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.season)
      ..writeByte(1)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SeasonFilesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class EpisodeAdapter extends TypeAdapter<Episode> {
  @override
  final int typeId = 9;

  @override
  Episode read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Episode(
      episode: fields[0] as int,
      title: fields[1] as String,
      description: fields[2] as String,
      rating: fields[3] as dynamic,
      poster: fields[4] as String,
      covers: (fields[5] as Map)?.cast<Resolution, String>(),
      episodes: (fields[6] as Map)?.map((dynamic k, dynamic v) =>
          MapEntry(k as Language, (v as List)?.cast<EpisodeFile>())),
    );
  }

  @override
  void write(BinaryWriter writer, Episode obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.episode)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.rating)
      ..writeByte(4)
      ..write(obj.poster)
      ..writeByte(5)
      ..write(obj.covers)
      ..writeByte(6)
      ..write(obj.episodes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EpisodeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class EpisodeFileAdapter extends TypeAdapter<EpisodeFile> {
  @override
  final int typeId = 10;

  @override
  EpisodeFile read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EpisodeFile(
      id: fields[0] as int,
      quality: fields[1] as Quality,
      src: fields[2] as String,
      duration: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, EpisodeFile obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.quality)
      ..writeByte(2)
      ..write(obj.src)
      ..writeByte(3)
      ..write(obj.duration);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EpisodeFileAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
