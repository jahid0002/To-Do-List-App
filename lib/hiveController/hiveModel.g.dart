// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hiveModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveNoteModelAdapter extends TypeAdapter<HiveNoteModel> {
  @override
  final int typeId = 0;

  @override
  HiveNoteModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveNoteModel(
      name: fields[0] as String,
      number: fields[1] as String,
      img: fields[2] as File?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveNoteModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.number)
      ..writeByte(2)
      ..write(obj.img);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveNoteModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
