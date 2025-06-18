// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shortcuts.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShortcutsModelAdapter extends TypeAdapter<ShortcutsModel> {
  @override
  final int typeId = 2;

  @override
  ShortcutsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ShortcutsModel(
      name: fields[0] as String?,
      shortcutImage: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ShortcutsModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.shortcutImage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShortcutsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
