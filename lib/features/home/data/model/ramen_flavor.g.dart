// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ramen_flavor.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RamenFlavorAdapter extends TypeAdapter<RamenFlavor> {
  @override
  final int typeId = 0;

  @override
  RamenFlavor read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RamenFlavor(
      salt: fields[0] as double?,
      broth: fields[3] as String?,
      fat: fields[1] as double?,
      noodleTenderness: fields[2] as double?,
      toppingList: (fields[4] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, RamenFlavor obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.salt)
      ..writeByte(1)
      ..write(obj.fat)
      ..writeByte(2)
      ..write(obj.noodleTenderness)
      ..writeByte(3)
      ..write(obj.broth)
      ..writeByte(4)
      ..write(obj.toppingList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RamenFlavorAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
