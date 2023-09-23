// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'taskmodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ToDoAdapter extends TypeAdapter<ToDo> {
  @override
  final int typeId = 0;

  @override
  ToDo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ToDo(
      id: fields[0] as int?,
      TitleTask: fields[3] as String?,
      startTimetask: fields[7] as DateTime?,
      endTimetask: fields[8] as DateTime?,
      Datetask: fields[6] as DateTime?,
      Category: fields[5] as int?,
      Description: fields[4] as String?,
      remind: fields[10] as int?,
      repeat: fields[9] as String?,
      isDone: fields[1] as bool,
      isfavorite: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ToDo obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.isDone)
      ..writeByte(2)
      ..write(obj.isfavorite)
      ..writeByte(3)
      ..write(obj.TitleTask)
      ..writeByte(4)
      ..write(obj.Description)
      ..writeByte(5)
      ..write(obj.Category)
      ..writeByte(6)
      ..write(obj.Datetask)
      ..writeByte(7)
      ..write(obj.startTimetask)
      ..writeByte(8)
      ..write(obj.endTimetask)
      ..writeByte(9)
      ..write(obj.repeat)
      ..writeByte(10)
      ..write(obj.remind);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ToDoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
