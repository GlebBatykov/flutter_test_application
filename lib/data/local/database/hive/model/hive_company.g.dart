// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_company.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveCompanyAdapter extends TypeAdapter<HiveCompany> {
  @override
  final int typeId = 2;

  @override
  HiveCompany read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveCompany(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HiveCompany obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.address)
      ..writeByte(2)
      ..write(obj.catchPhrase);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveCompanyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
