// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'groupmodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GROUPToDoAdapter extends TypeAdapter<GROUP_ToDo> {
  @override
  final int typeId = 1;

  @override
  GROUP_ToDo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GROUP_ToDo(
      id: fields[0] as String?,
      Group_Text: fields[1] as String?,
      const_gr: fields[2] as bool,
      todoList: (fields[3] as List).cast<ToDo>(),
      mauchutaskpage: (fields[5] as List).cast<int>(),
      maunentaskpage: (fields[4] as List).cast<int>(),
      mausettingtaskpage: (fields[6] as List).cast<int>(),
      nightandday: fields[8] as bool,
      phottosettingtakspage: fields[7] as String,
      mark_done: fields[9] as bool,
      mark_doneimage: fields[10] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, GROUP_ToDo obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.Group_Text)
      ..writeByte(2)
      ..write(obj.const_gr)
      ..writeByte(3)
      ..write(obj.todoList)
      ..writeByte(4)
      ..write(obj.maunentaskpage)
      ..writeByte(5)
      ..write(obj.mauchutaskpage)
      ..writeByte(6)
      ..write(obj.mausettingtaskpage)
      ..writeByte(7)
      ..write(obj.phottosettingtakspage)
      ..writeByte(8)
      ..write(obj.nightandday)
      ..writeByte(9)
      ..write(obj.mark_done)
      ..writeByte(10)
      ..write(obj.mark_doneimage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GROUPToDoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
