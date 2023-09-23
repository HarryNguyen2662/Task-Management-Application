// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class hivedataAdapter extends TypeAdapter<hive_data> {
  @override
  final int typeId = 2;

  @override
  hive_data read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return hive_data(
      mylistdatabase: (fields[0] as List).cast<GROUP_ToDo>(),
    );
  }

  @override
  void write(BinaryWriter writer, hive_data obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.mylistdatabase);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is hivedataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
