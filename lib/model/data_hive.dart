import 'package:hive/hive.dart';
import 'package:todolist/model/groupmodel.dart';

part 'data_hive.g.dart';

@HiveType(typeId: 2)
class hive_data extends HiveObject {
  @HiveField(0)
  List<GROUP_ToDo> mylistdatabase;
  hive_data({
    required this.mylistdatabase,
  });
}
