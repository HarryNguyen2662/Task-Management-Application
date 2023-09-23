// ignore_for_file: file_names, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todolist/model/groupmodel.dart';
//import 'package:todolist/notification/notifi_service.dart';
import 'package:todolist/screens/task_page.dart';

class ToDoItem extends StatelessWidget {
  final GROUP_ToDo todo;
  final Color color_forlist;
  final Color color_fortext;
  final Icon icon_2;
  //final onToDoChanged;
  final onDeleteItem;
  final Function(GROUP_ToDo) update_for_slidedelete;
  const ToDoItem({
    Key? key,
    required this.todo,
    //required this.onToDoChanged,
    required this.onDeleteItem,
    required this.color_forlist,
    required this.color_fortext,
    required this.update_for_slidedelete,
    required this.icon_2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      enabled: !todo.const_gr,
      key: Key(todo.id.toString() +
          DateTime.now().millisecondsSinceEpoch.toString()),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(
            key: Key(todo.id.toString()),
            onDismissed: () {
              update_for_slidedelete(todo);
            }),
        children: [
          SlidableAction(
            onPressed: (BuildContext context) {
              onDeleteItem(todo.id);
            },
            //actionExtentRatio: 0.3,
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: ListTile(
        key: ValueKey(todo.id.toString() +
            DateTime.now().millisecondsSinceEpoch.toString()),
        onTap: () {
          //NotificationService()
          //    .showNotification(title: 'Sample title', body: 'It works!');
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => task_homepage(
                      todos: todo,
                    )),
          );
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        //contentPadding: EdgeInsets.symmetric(horizontal: 20),
        tileColor: color_forlist,
        leading: icon_2,
        title: Text(
          todo.Group_Text!,
          style: TextStyle(
            fontSize: 16,
            color: color_fortext,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
