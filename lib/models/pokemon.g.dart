// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PokemonAdapter extends TypeAdapter<Pokemon> {
  @override
  final int typeId = 0;

  @override
  Pokemon read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Pokemon(
      pokemonName: fields[0] as String,
      sprite: fields[1] as String,
      types: (fields[2] as List).cast<dynamic>(),
      ability: (fields[3] as List).cast<dynamic>(),
      height: fields[4] as int,
      weight: fields[5] as int,
      baseStat: (fields[6] as List).cast<dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, Pokemon obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.pokemonName)
      ..writeByte(1)
      ..write(obj.sprite)
      ..writeByte(2)
      ..write(obj.types)
      ..writeByte(3)
      ..write(obj.ability)
      ..writeByte(4)
      ..write(obj.height)
      ..writeByte(5)
      ..write(obj.weight)
      ..writeByte(6)
      ..write(obj.baseStat);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PokemonAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
