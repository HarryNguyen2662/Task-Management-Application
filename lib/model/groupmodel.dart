// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:hive/hive.dart';
import 'package:todolist/model/taskmodel.dart';

part 'groupmodel.g.dart';

@HiveType(typeId: 1)
class GROUP_ToDo extends HiveObject {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? Group_Text;
  @HiveField(2)
  bool const_gr = false;
  @HiveField(3)
  List<ToDo> todoList;
  @HiveField(4)
  List<int> maunentaskpage = [255, 0, 0, 0];
  @HiveField(5)
  List<int> mauchutaskpage = [255, 255, 255, 255];
  @HiveField(6)
  List<int> mausettingtaskpage = [0, 0, 0, 0];
  @HiveField(7)
  String phottosettingtakspage = '';
  @HiveField(8)
  bool nightandday = true;
  @HiveField(9)
  bool mark_done;
  @HiveField(10)
  bool mark_doneimage;
  GROUP_ToDo({
    required this.id,
    required this.Group_Text,
    required this.const_gr,
    required this.todoList,
    required this.mauchutaskpage,
    required this.maunentaskpage,
    required this.mausettingtaskpage,
    required this.nightandday,
    required this.phottosettingtakspage,
    required this.mark_done,
    required this.mark_doneimage,
  });
}
