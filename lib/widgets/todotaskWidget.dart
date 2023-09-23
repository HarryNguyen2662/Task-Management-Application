// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names, file_names, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../model/taskmodel.dart';
import '../constants/colors.dart';
import 'package:animated_icon_button/animated_icon_button.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;
  final Function(ToDo) onlikechanged;
  final Function(ToDo) update_for_slidedelete;
  final Function(ToDo) addfavoriteToDoChange;
  final List<int> maunen;
  final List<int> mauchu;
  final List<int> maufromsetting;
  final isFavorite;
  const ToDoItem({
    Key? key,
    required this.todo,
    required this.onToDoChanged,
    required this.onDeleteItem,
    required this.update_for_slidedelete,
    required this.onlikechanged,
    required this.maunen,
    required this.mauchu,
    required this.maufromsetting,
    required this.isFavorite,
    required this.addfavoriteToDoChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color listcolor = const Color.fromARGB(0, 0, 0, 0);
    if (todo.Category == 1) {
      listcolor = Colors.red;
    }
    if (todo.Category == 2) {
      listcolor = Colors.orange;
    }
    if (todo.Category == 3) {
      listcolor = const Color.fromARGB(255, 136, 136, 31);
    }
    if (todo.Category == 4) {
      listcolor = Colors.green;
    }
    if (todo.Category == 5) {
      listcolor = Colors.blue;
    }
    if (todo.Category == 7) {
      if (maunen == [255, 255, 255, 255]) {
        listcolor = Colors.black;
      } else {
        listcolor = Colors.white;
      }
    }
    return Container(
      //width: 200, // Độ rộng của ListTile
      //height: 100,
      /*decoration: BoxDecoration(
        //color: Colors.blue,
        borderRadius: BorderRadius.circular(0.0),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 39, 116, 157)
                .withOpacity(0.1), // Màu và độ mờ của hiệu ứng
            spreadRadius: 0, // Khoảng cách mờ
            blurRadius: 5, // Độ mờ
            offset: Offset(
                0, 3), // Vị trí đổ bóng (dịch chuyển đổ bóng theo trục x và y)
          ),
        ],
      ),*/
      margin: const EdgeInsets.only(bottom: 10),
      child: Slidable(
        key: Key(todo.id.toString() +
            DateTime.now().millisecondsSinceEpoch.toString()),
        //movementDuration: Duration(milliseconds: 500),
        closeOnScroll: false,
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          dismissible: DismissiblePane(
              key: Key(todo.id.toString()),
              onDismissed: () {
                update_for_slidedelete(todo);
              }),
          children: [
            SlidableAction(
              autoClose: false,
              onPressed: (BuildContext context) {
                addfavoriteToDoChange(todo);
              },
              backgroundColor: const Color(0xFF0392CF),
              foregroundColor: Colors.white,
              icon: (isFavorite == true)
                  ? Icons.favorite
                  : Icons.favorite_border_outlined,
            ),
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
              onToDoChanged(todo);
            },
            shape: RoundedRectangleBorder(
              borderRadius: (isFavorite == true)
                  ? BorderRadius.circular(10)
                  : BorderRadius.circular(20),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            tileColor: listcolor,
            leading: Icon(
              todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
              color: tdBlue,
            ),
            title: Text(
              todo.TitleTask!,
              style: TextStyle(
                fontSize: 16,
                color: (todo.Category != 7)
                    ? Color.fromARGB(mauchu[0], mauchu[1], mauchu[2], mauchu[3])
                    : (listcolor == Colors.black)
                        ? Colors.white
                        : Colors.black,
                decoration: todo.isDone ? TextDecoration.lineThrough : null,
              ),
            ),
            subtitle: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '${todo.Description}\n',
                    style: TextStyle(
                      color: (todo.Category != 7)
                          ? Color.fromARGB(
                              mauchu[0], mauchu[1], mauchu[2], mauchu[3])
                          : (listcolor == Colors.black)
                              ? Colors.white
                              : Colors.black,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  TextSpan(
                      text: DateFormat('EEE, MMM d')
                          .format(todo.Datetask as DateTime),
                      style: TextStyle(
                          color: (todo.Category != 7)
                              ? Color.fromARGB(
                                  mauchu[0], mauchu[1], mauchu[2], mauchu[3])
                              : (listcolor == Colors.black)
                                  ? Colors.white
                                  : Colors.black)),
                  WidgetSpan(
                    child: Icon(
                      Icons.calendar_month_outlined,
                      color: (todo.Category != 7)
                          ? Color.fromARGB(
                              mauchu[0], mauchu[1], mauchu[2], mauchu[3])
                          : (listcolor == Colors.black)
                              ? Colors.white
                              : Colors.black,
                      size: 20,
                    ),
                  ),
                  TextSpan(
                      text: ' - ',
                      style: TextStyle(
                          color: (todo.Category != 7)
                              ? Color.fromARGB(
                                  mauchu[0], mauchu[1], mauchu[2], mauchu[3])
                              : (listcolor == Colors.black)
                                  ? Colors.white
                                  : Colors.black)),
                  TextSpan(
                      text: 'Repeat ${todo.repeat}',
                      style: TextStyle(
                          color: (todo.Category != 7)
                              ? Color.fromARGB(
                                  mauchu[0], mauchu[1], mauchu[2], mauchu[3])
                              : (listcolor == Colors.black)
                                  ? Colors.white
                                  : Colors.black)),
                  WidgetSpan(
                    child: Icon(
                      Icons.timer_outlined,
                      color: (todo.Category != 7)
                          ? Color.fromARGB(
                              mauchu[0], mauchu[1], mauchu[2], mauchu[3])
                          : (listcolor == Colors.black)
                              ? Colors.white
                              : Colors.black,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
            trailing: SingleChildScrollView(
                child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  //todo.startTimetask!.format(context),
                  DateFormat('hh:mm a').format(todo.startTimetask as DateTime),
                  style: TextStyle(
                      color: (todo.Category != 7)
                          ? Color.fromARGB(
                              mauchu[0], mauchu[1], mauchu[2], mauchu[3])
                          : (listcolor == Colors.black)
                              ? Colors.white
                              : Colors.black),
                ),
                const Text('-'),
                Text(
                  //todo.endTimetask!.format(context),
                  DateFormat('hh:mm a').format(todo.endTimetask as DateTime),
                  style: TextStyle(
                      color: (todo.Category != 7)
                          ? Color.fromARGB(
                              mauchu[0], mauchu[1], mauchu[2], mauchu[3])
                          : (listcolor == Colors.black)
                              ? Colors.white
                              : Colors.black),
                ),
                AnimatedIconButton(
                  size: 25,
                  onPressed: () {
                    onlikechanged(todo);
                  },
                  duration: const Duration(milliseconds: 500),
                  splashColor: const Color.fromARGB(0, 0, 0, 0),
                  icons: <AnimatedIconItem>[
                    AnimatedIconItem(
                      icon: Icon(Icons.favorite,
                          color: (isFavorite == false)
                              ? const Color.fromARGB(255, 186, 176, 188)
                              : Colors.red),
                    ),
                  ],
                ),
              ],
            ))),
      ),
    );
  }
}
