// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_image.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveImageAdapter extends TypeAdapter<HiveImage> {
  @override
  final int typeId = 5;

  @override
  HiveImage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveImage(
      fields[0] as int,
      fields[1] as int,
      fields[2] as String,
      fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HiveImage obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.albumId)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveImageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
