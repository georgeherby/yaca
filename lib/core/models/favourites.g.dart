// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourites.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavouritesAdapter extends TypeAdapter<Favourites> {
  @override
  final int typeId = 0;

  @override
  Favourites read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Favourites(
      id: fields[0] as int?,
      name: fields[1] as String,
      symbol: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Favourites obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.symbol);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavouritesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
