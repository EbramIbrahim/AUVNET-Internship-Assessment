// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurants.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RestaurantsModelAdapter extends TypeAdapter<RestaurantsModel> {
  @override
  final int typeId = 3;

  @override
  RestaurantsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RestaurantsModel(
      name: fields[0] as String?,
      time: fields[1] as String?,
      restaurantsImage: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, RestaurantsModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.time)
      ..writeByte(2)
      ..write(obj.restaurantsImage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RestaurantsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
