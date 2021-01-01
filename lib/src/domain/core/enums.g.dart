// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enums.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ResolutionAdapter extends TypeAdapter<Resolution> {
  @override
  final int typeId = 2;

  @override
  Resolution read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Resolution.fhd;
      case 1:
        return Resolution.hd;
      case 2:
        return Resolution.vga;
      default:
        return null;
    }
  }

  @override
  void write(BinaryWriter writer, Resolution obj) {
    switch (obj) {
      case Resolution.fhd:
        writer.writeByte(0);
        break;
      case Resolution.hd:
        writer.writeByte(1);
        break;
      case Resolution.vga:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResolutionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ImageSizeAdapter extends TypeAdapter<ImageSize> {
  @override
  final int typeId = 3;

  @override
  ImageSize read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ImageSize.small;
      case 1:
        return ImageSize.large;
      default:
        return null;
    }
  }

  @override
  void write(BinaryWriter writer, ImageSize obj) {
    switch (obj) {
      case ImageSize.small:
        writer.writeByte(0);
        break;
      case ImageSize.large:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImageSizeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LanguageAdapter extends TypeAdapter<Language> {
  @override
  final int typeId = 4;

  @override
  Language read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Language.geo;
      case 1:
        return Language.eng;
      case 2:
        return Language.rus;
      default:
        return null;
    }
  }

  @override
  void write(BinaryWriter writer, Language obj) {
    switch (obj) {
      case Language.geo:
        writer.writeByte(0);
        break;
      case Language.eng:
        writer.writeByte(1);
        break;
      case Language.rus:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LanguageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class QualityAdapter extends TypeAdapter<Quality> {
  @override
  final int typeId = 11;

  @override
  Quality read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Quality.medium;
      case 1:
        return Quality.high;
      default:
        return null;
    }
  }

  @override
  void write(BinaryWriter writer, Quality obj) {
    switch (obj) {
      case Quality.medium:
        writer.writeByte(0);
        break;
      case Quality.high:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QualityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SearchTypeAdapter extends TypeAdapter<SearchType> {
  @override
  final int typeId = 7;

  @override
  SearchType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return SearchType.movie;
      case 1:
        return SearchType.person;
      default:
        return null;
    }
  }

  @override
  void write(BinaryWriter writer, SearchType obj) {
    switch (obj) {
      case SearchType.movie:
        writer.writeByte(0);
        break;
      case SearchType.person:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
