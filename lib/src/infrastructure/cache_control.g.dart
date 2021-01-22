// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cache_control.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LaunchTimestampAdapter extends TypeAdapter<LaunchTimestamp> {
  @override
  final int typeId = 12;

  @override
  LaunchTimestamp read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LaunchTimestamp(
      fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LaunchTimestamp obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj._dateString);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LaunchTimestampAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
