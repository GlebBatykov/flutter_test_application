// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_album.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveAlbumAdapter extends TypeAdapter<HiveAlbum> {
  @override
  final int typeId = 0;

  @override
  HiveAlbum read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveAlbum(
      fields[0] as int,
      fields[1] as int,
      fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HiveAlbum obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.title);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveAlbumAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
