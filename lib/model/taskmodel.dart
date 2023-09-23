// ignore_for_file: non_constant_identifier_names
import 'package:hive/hive.dart';

part 'taskmodel.g.dart';

@HiveType(typeId: 0)
class ToDo extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  bool isDone;
  @HiveField(2)
  bool isfavorite;
  @HiveField(3)
  String? TitleTask;
  @HiveField(4)
  String? Description;
  @HiveField(5)
  int? Category;
  @HiveField(6)
  DateTime? Datetask;
  @HiveField(7)
  DateTime? startTimetask;
  @HiveField(8)
  DateTime? endTimetask;
  @HiveField(9)
  String? repeat;
  @HiveField(10)
  int? remind;

  ToDo({
    required this.id,
    required this.TitleTask,
    required this.startTimetask,
    required this.endTimetask,
    required this.Datetask,
    required this.Category,
    required this.Description,
    required this.remind,
    required this.repeat,
    this.isDone = false,
    this.isfavorite = false,
  });
}
