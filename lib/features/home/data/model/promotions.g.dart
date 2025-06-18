// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promotions.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PromotionsModelAdapter extends TypeAdapter<PromotionsModel> {
  @override
  final int typeId = 1;

  @override
  PromotionsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PromotionsModel(
      image: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PromotionsModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PromotionsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
