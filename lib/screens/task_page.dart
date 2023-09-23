// ignore_for_file: curly_braces_in_flow_control_structures, non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todolist/main.dart';
import 'package:todolist/model/groupmodel.dart';
import 'package:todolist/notification/notifi_servicecopy.dart';
import 'package:todolist/screens/addnewtask_page.dart';
import 'package:todolist/screens/setting_fortaskpage.dart';
import '../model/taskmodel.dart';
import '../widgets/todotaskWidget.dart';
//import 'package:flutter_slidable/flutter_slidable.dart';

String titletask = '';
String destask = '';
DateTime datetask = DateTime.now();
DateTime starttimetask = DateTime.now();
DateTime endtimetask = DateTime.now();
int phanloai = -1;
int remind = 0;
String repeat = 'None';

//bool mark_done = false;
//bool widget.todos.mark_doneimage = false;

class task_homepage extends StatefulWidget {
  task_homepage({Key? key, required this.todos}) : super(key: key);
  final GROUP_ToDo todos;

  @override
  State<task_homepage> createState() => task_homepageState();
}

class task_homepageState extends State<task_homepage> {
  //final todosList = ToDo.todoList();
  List<ToDo> _foundToDo = [];
  //final _todoController = TextEditingController();

  @override
  void initState() {
    _foundToDo = widget.todos.todoList;
    widget.todos.mauchutaskpage = (widget.todos.nightandday == true)
        ? [255, 0, 0, 0]
        : [255, 255, 249, 249];

    widget.todos.maunentaskpage = (widget.todos.nightandday == false)
        ? [255, 0, 0, 0]
        : [255, 255, 249, 249];
    super.initState();
  }

  void updateMyTiles(int oldIndex, int newIndex) {
    setState(() {
      if (oldIndex < newIndex) {
        newIndex -= 1;
      }
      final ToDo tile = widget.todos.todoList.removeAt(oldIndex);
      widget.todos.todoList.insert(newIndex, tile);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.todos.phottosettingtakspage != '') {
      return Scaffold(
        appBar: _buildAppBar(((widget.todos.mausettingtaskpage == [0, 0, 0, 0])
            ? Color.fromARGB(
                widget.todos.maunentaskpage[0],
                widget.todos.maunentaskpage[1],
                widget.todos.maunentaskpage[2],
                widget.todos.maunentaskpage[3])
            : Color.fromARGB(
                widget.todos.mausettingtaskpage[0],
                widget.todos.mausettingtaskpage[1],
                widget.todos.mausettingtaskpage[2],
                widget.todos.mausettingtaskpage[3]))),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:
                      AssetImage(widget.todos.phottosettingtakspage.toString()),
                  fit: BoxFit.cover,
                ),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 5,
              ),
              child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        color:
                            Color.fromARGB(255, 186, 26, 26).withOpacity(0.5),
                      ),
                    ),
                    searchBox(),
                    Container(
                      margin: EdgeInsets.only(
                        top: 20,
                        bottom: 20,
                      ),
                    ),
                    Expanded(
                      child: ReorderableListView(
                        onReorder: (oldIndex, newIndex) {
                          updateMyTiles(oldIndex, newIndex);
                        },
                        padding: const EdgeInsets.all(0),
                        children: <Widget>[
                          for (ToDo todoo in _foundToDo)
                            if (todoo.isDone == false)
                              ToDoItem(
                                addfavoriteToDoChange: addfavoriteToDoChange,
                                isFavorite: todoo.isfavorite,
                                key: ValueKey(todoo.id.toString() +
                                    DateTime.now()
                                        .millisecondsSinceEpoch
                                        .toString()),
                                todo: todoo,
                                onToDoChanged: handleToDoChange,
                                onDeleteItem: deleteToDoItem,
                                onlikechanged: addfavoriteToDoChange,
                                maufromsetting: widget.todos.mausettingtaskpage,
                                maunen: widget.todos.maunentaskpage,
                                mauchu: widget.todos.mauchutaskpage,
                                update_for_slidedelete: (ToDo tasktitle) {
                                  setState(() {
                                    widget.todos.todoList.removeWhere(
                                        (item) => item.id == tasktitle.id);
                                  });
                                },
                              )
                            else if (widget.todos.mark_doneimage = true)
                              Container(key: GlobalKey(debugLabel: 'nothing')),
                          if (widget.todos.mark_doneimage == true)
                            ExpansionTile(
                              /*onExpansionChanged: (value) {
                                setState(() {
                                  mark_done = !mark_done;
                                });
                              },*/
                              initiallyExpanded: widget.todos.mark_doneimage,
                              key: ValueKey(('danh sachh expand') +
                                  DateTime.now()
                                      .millisecondsSinceEpoch
                                      .toString()),
                              title: Text('Đã hoàn thành'),
                              children: [
                                for (ToDo todoo in _foundToDo)
                                  if (todoo.isDone == true)
                                    ToDoItem(
                                      addfavoriteToDoChange:
                                          addfavoriteToDoChange,
                                      isFavorite: todoo.isfavorite,
                                      key: ValueKey(todoo.id.toString() +
                                          DateTime.now()
                                              .millisecondsSinceEpoch
                                              .toString()),
                                      todo: todoo,
                                      onToDoChanged: handleToDoChange,
                                      onDeleteItem: deleteToDoItem,
                                      onlikechanged: addfavoriteToDoChange,
                                      maufromsetting:
                                          widget.todos.mausettingtaskpage,
                                      maunen: widget.todos.maunentaskpage,
                                      mauchu: widget.todos.mauchutaskpage,
                                      update_for_slidedelete: (ToDo tasktitle) {
                                        setState(() {
                                          widget.todos.todoList.removeWhere(
                                              (item) =>
                                                  item.id == tasktitle.id);
                                        });
                                      },
                                    ),
                              ],
                            ),
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 0,
                        child: Container(
                            //padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Row(children: <Widget>[
                          ElevatedButton(
                            style: ButtonStyle(
                              //backgroundColor: Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                              backgroundColor: MaterialStateProperty.all(
                                  ((widget.todos.mausettingtaskpage ==
                                          [0, 0, 0, 0])
                                      ? Color.fromARGB(
                                          widget.todos.maunentaskpage[0],
                                          widget.todos.maunentaskpage[1],
                                          widget.todos.maunentaskpage[2],
                                          widget.todos.maunentaskpage[3])
                                      : Color.fromARGB(
                                          widget.todos.mausettingtaskpage[0],
                                          widget.todos.mausettingtaskpage[1],
                                          widget.todos.mausettingtaskpage[2],
                                          widget.todos.mausettingtaskpage[3]))),
                              //minimumSize:
                              //    MaterialStateProperty.all(Size(350, 40)),
                              fixedSize: MaterialStateProperty.all(
                                Size(
                                    MediaQuery.of(context).size.width - 30, 40),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                showModalBottomSheet(
                                    isScrollControlled: true,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    context: context,
                                    builder: (BuildContext context) {
                                      return addnewtask_page(
                                        maunen: widget.todos.maunentaskpage,
                                        mauchu: widget.todos.mauchutaskpage,
                                      );
                                      //addToDoItem();
                                    }).then((value) {
                                  updatenhenhangtinhcam();
                                });
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(right: 30.0),
                                  child: Icon(
                                    Icons.add,
                                    color: Color.fromARGB(
                                        widget.todos.mauchutaskpage[0],
                                        widget.todos.mauchutaskpage[1],
                                        widget.todos.mauchutaskpage[2],
                                        widget.todos.mauchutaskpage[3]),
                                  ),
                                ),
                                Text(
                                  'Thêm tác vụ',
                                  //textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(
                                        widget.todos.mauchutaskpage[0],
                                        widget.todos.mauchutaskpage[1],
                                        widget.todos.mauchutaskpage[2],
                                        widget.todos.mauchutaskpage[3]),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ])))
                  ]),
            ),
          ],
        ),
      );
    } else {
      return Scaffold(
        appBar: _buildAppBar((widget.todos.mausettingtaskpage == [0, 0, 0, 0])
            ? Color.fromARGB(
                widget.todos.maunentaskpage[0],
                widget.todos.maunentaskpage[1],
                widget.todos.maunentaskpage[2],
                widget.todos.maunentaskpage[3])
            : Color.fromARGB(
                widget.todos.mausettingtaskpage[0],
                widget.todos.mausettingtaskpage[1],
                widget.todos.mausettingtaskpage[2],
                widget.todos.mausettingtaskpage[3])),
        backgroundColor: Color.fromARGB(
            widget.todos.maunentaskpage[0],
            widget.todos.maunentaskpage[1],
            widget.todos.maunentaskpage[2],
            widget.todos.maunentaskpage[3]),
        body: Stack(
          children: [
            Container(
              //decoration: BoxDecoration(
              //  image: DecorationImage(
              //    image: AssetImage(widget.todos.phottosettingtakspage),
              //    fit: BoxFit.cover,
              //  ),
              //),
              padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 5,
              ),
              child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /*BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        color: Color.fromARGB(255, 68, 66, 66).withOpacity(0.5),
                      ),
                    ),*/
                    searchBox(),
                    Container(
                      margin: EdgeInsets.only(
                        top: 20,
                        bottom: 20,
                      ),
                    ),
                    Expanded(
                      child: ReorderableListView(
                        key: ValueKey('sdhfudhfuhduhfudhfudhufhduhfduhfudhfu'),
                        onReorder: (oldIndex, newIndex) {
                          updateMyTiles(oldIndex, newIndex);
                        },
                        padding: const EdgeInsets.all(0),
                        children: <Widget>[
                          for (ToDo todoo in _foundToDo)
                            if (todoo.isDone == false)
                              ToDoItem(
                                key: ValueKey(todoo.id.toString() +
                                    DateTime.now()
                                        .millisecondsSinceEpoch
                                        .toString()),
                                todo: todoo,
                                onToDoChanged: handleToDoChange,
                                onDeleteItem: deleteToDoItem,
                                onlikechanged: addfavoriteToDoChange,
                                mauchu: widget.todos.mauchutaskpage,
                                maunen: widget.todos.maunentaskpage,
                                maufromsetting: widget.todos.mausettingtaskpage,
                                update_for_slidedelete: (ToDo tasktitle) {
                                  setState(() {
                                    widget.todos.todoList.removeWhere(
                                        (item) => item.id == tasktitle.id);
                                  });
                                },
                                addfavoriteToDoChange: addfavoriteToDoChange,
                                isFavorite: todoo.isfavorite,
                              )
                            else if (widget.todos.mark_done = true)
                              Container(key: GlobalKey(debugLabel: 'nothing')),
                          if (widget.todos.mark_done == true)
                            ExpansionTile(
                              /*onExpansionChanged: (value) {
                                setState(() {
                                  mark_done = !mark_done;
                                });
                              },*/
                              initiallyExpanded: widget.todos.mark_done,
                              key: ValueKey(('danh sachh expand') +
                                  DateTime.now()
                                      .millisecondsSinceEpoch
                                      .toString()),
                              title: Text('Đã hoàn thành'),
                              children: [
                                for (ToDo todoo in _foundToDo)
                                  if (todoo.isDone == true)
                                    ToDoItem(
                                      addfavoriteToDoChange:
                                          addfavoriteToDoChange,
                                      isFavorite: todoo.isfavorite,
                                      key: ValueKey(todoo.id.toString() +
                                          DateTime.now()
                                              .millisecondsSinceEpoch
                                              .toString()),
                                      todo: todoo,
                                      onToDoChanged: handleToDoChange,
                                      onDeleteItem: deleteToDoItem,
                                      onlikechanged: addfavoriteToDoChange,
                                      mauchu: widget.todos.mauchutaskpage,
                                      maunen: widget.todos.maunentaskpage,
                                      maufromsetting:
                                          widget.todos.mausettingtaskpage,
                                      update_for_slidedelete: (ToDo tasktitle) {
                                        setState(() {
                                          widget.todos.todoList.removeWhere(
                                              (item) =>
                                                  item.id == tasktitle.id);
                                        });
                                      },
                                    ),
                              ],
                            ),
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 0,
                        child: Container(
                            //padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Row(children: <Widget>[
                          ElevatedButton(
                            style: ButtonStyle(
                              //backgroundColor: Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                              backgroundColor: MaterialStateProperty.all(
                                  ((widget.todos.mausettingtaskpage ==
                                          [0, 0, 0, 0])
                                      ? Color.fromARGB(
                                          widget.todos.maunentaskpage[0],
                                          widget.todos.maunentaskpage[1],
                                          widget.todos.maunentaskpage[2],
                                          widget.todos.maunentaskpage[3])
                                      : Color.fromARGB(
                                          widget.todos.mausettingtaskpage[0],
                                          widget.todos.mausettingtaskpage[1],
                                          widget.todos.mausettingtaskpage[2],
                                          widget.todos.mausettingtaskpage[3]))),
                              //minimumSize:
                              //    MaterialStateProperty.all(Size(350, 40)),
                              fixedSize: MaterialStateProperty.all(
                                Size(
                                    MediaQuery.of(context).size.width - 30, 40),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                showModalBottomSheet(
                                    isScrollControlled: true,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    context: context,
                                    builder: (BuildContext context) {
                                      return addnewtask_page(
                                        maunen: widget.todos.maunentaskpage,
                                        mauchu: widget.todos.mauchutaskpage,
                                      );
                                      //addToDoItem();
                                    }).then((value) {
                                  updatenhenhangtinhcam();
                                });
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(right: 30.0),
                                  child: Icon(
                                    Icons.add,
                                    color: Color.fromARGB(
                                        widget.todos.mauchutaskpage[0],
                                        widget.todos.mauchutaskpage[1],
                                        widget.todos.mauchutaskpage[2],
                                        widget.todos.mauchutaskpage[3]),
                                  ),
                                ),
                                Text(
                                  'Thêm tác vụ',
                                  //textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(
                                        widget.todos.mauchutaskpage[0],
                                        widget.todos.mauchutaskpage[1],
                                        widget.todos.mauchutaskpage[2],
                                        widget.todos.mauchutaskpage[3]),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ])))
                  ]),
            ),
          ],
        ),
      );
    }
  }

  void updatenhenhangtinhcam() {
    int id123 = DateTime.now().millisecond.toInt();
    if (phanloai != -1)
      addToDoItem(titletask, destask, starttimetask, endtimetask, datetask,
          phanloai, remind, repeat, id123);

    if (widget.todos.const_gr == false) {
      if (DateFormat('EEE, MMM d').format(datetask as DateTime) ==
          DateFormat('EEE, MMM d').format(DateTime.now() as DateTime)) {
        //print('iuhuifhiu324234324');
        setState(() {
          savedGROUP_todo[0].todoList.add(ToDo(
                id: id123,
                startTimetask: starttimetask,
                endTimetask: endtimetask,
                Datetask: datetask,
                Category: phanloai,
                Description: destask,
                TitleTask: titletask,
                remind: remind,
                repeat: repeat,
              ));
        });
      }
    }
    titletask = '';
    destask = '';
    datetask = DateTime.now();
    starttimetask = DateTime.now();
    endtimetask = DateTime.now();
    phanloai = -1;
    remind = 0;
    repeat = 'None';
  }

  void handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
      if (widget.todos.phottosettingtakspage != '')
        widget.todos.mark_doneimage = false;
      if (widget.todos.phottosettingtakspage == '')
        widget.todos.mark_done = false;
    });
  }

  void addfavoriteToDoChange(ToDo todo) {
    setState(() {
      todo.isfavorite = !todo.isfavorite;
    });
  }

  void deleteToDoItem(int id) {
    setState(() {
      widget.todos.todoList.removeWhere((item) => item.id == id);
      savedGROUP_todo[0].todoList.removeWhere((item) => item.id == id);
      //widget.todos.todoList.removeWhere((item) => item.id == id);
      if (widget.todos.phottosettingtakspage != '')
        widget.todos.mark_doneimage = false;
      if (widget.todos.phottosettingtakspage == '')
        widget.todos.mark_done = false;
    });
    NotificationService().cancel_notification(id);
    NotificationService().cancel_notification(id + 100);
  }

  void pre_addToDoItem(
      String toDo,
      String Des,
      DateTime starttime,
      DateTime endtime,
      DateTime date,
      int category,
      int REMIND,
      String REPEAT) {
    titletask = toDo;
    destask = Des;
    datetask = date;
    starttimetask = starttime;
    endtimetask = endtime;
    phanloai = category;
    remind = REMIND;
    repeat = REPEAT;
    //print(titletask);
  }

  void addToDoItem(
      String toDo,
      String Des,
      DateTime starttime,
      DateTime endtime,
      DateTime date,
      int category,
      int REMIND,
      String REPEAT,
      int id12312345) {
    setState(() {
      //print('[$category] hello111');
      widget.todos.todoList.add(ToDo(
        id: id12312345,
        startTimetask: starttime,
        endTimetask: endtime,
        Datetask: date,
        Category: category,
        Description: Des,
        TitleTask: toDo,
        remind: REMIND,
        repeat: repeat,
      ));
    });

    NotificationService().scheduleNotification(
        id: id12312345,
        title: 'New task: ' + toDo + ' - ' + Des,
        body: 'From ' +
            DateFormat('hh:mm a').format(starttime as DateTime) +
            ' To ' +
            DateFormat('hh:mm a').format(endtime as DateTime) +
            '\nToday - ' +
            DateFormat('EEE, MMM d').format(date as DateTime),
        scheduledNotificationDateTime: DateTime(
            date.year, date.month, date.day, starttime.hour, starttime.minute));

    NotificationService().scheduleNotification(
        id: id12312345 + 100,
        title: 'End task: ' + toDo,
        body: 'From ' +
            DateFormat('hh:mm a').format(starttime as DateTime) +
            ' To ' +
            DateFormat('hh:mm a').format(endtime as DateTime) +
            '\nToday - ' +
            DateFormat('EEE, MMM d').format(date as DateTime),
        scheduledNotificationDateTime: DateTime(
            date.year, date.month, date.day, endtime.hour, endtime.minute));
  }

  void _runFilter(String enteredKeyword) {
    List<ToDo> results = [];
    if (enteredKeyword.isEmpty) {
      results = widget.todos.todoList;
    } else {
      results = widget.todos.todoList
          .where((item) => item.TitleTask!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundToDo = results;
    });
  }

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: ((widget.todos.mausettingtaskpage == [0, 0, 0, 0])
            ? Color.fromARGB(
                widget.todos.maunentaskpage[0],
                widget.todos.maunentaskpage[1],
                widget.todos.maunentaskpage[2],
                widget.todos.maunentaskpage[3])
            : Color.fromARGB(
                widget.todos.mausettingtaskpage[0],
                widget.todos.mausettingtaskpage[1],
                widget.todos.mausettingtaskpage[2],
                widget.todos.mausettingtaskpage[3])),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 243, 240, 240),
            //offset: Offset(2.0, 2.0),
            //blurRadius: 5.0,
            //spreadRadius: 1.0,
          ),
        ],
      ),
      child: TextField(
        onChanged: (value) => _runFilter(value),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: (widget.todos.nightandday == true)
                ? Color.fromARGB(
                    widget.todos.mauchutaskpage[0],
                    widget.todos.mauchutaskpage[1],
                    widget.todos.mauchutaskpage[2],
                    widget.todos.mauchutaskpage[3])
                : Colors.black,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 25,
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(
            color: (widget.todos.nightandday == true)
                ? Color.fromARGB(
                    widget.todos.mauchutaskpage[0],
                    widget.todos.mauchutaskpage[1],
                    widget.todos.mauchutaskpage[2],
                    widget.todos.mauchutaskpage[3])
                : Colors.black,
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(Color color_for_appbar) {
    return AppBar(
      leading: Padding(
        padding: EdgeInsets.only(left: 0),
        child: Container(
            child: ElevatedButton(
          child: Icon(
            Icons.arrow_back_ios_new,
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                ((widget.todos.mausettingtaskpage == Color.fromARGB(0, 0, 0, 0))
                    ? Color.fromARGB(
                        widget.todos.maunentaskpage[0],
                        widget.todos.maunentaskpage[1],
                        widget.todos.maunentaskpage[2],
                        widget.todos.maunentaskpage[3])
                    : Color.fromARGB(
                        widget.todos.mausettingtaskpage[0],
                        widget.todos.mausettingtaskpage[1],
                        widget.todos.mausettingtaskpage[2],
                        widget.todos.mausettingtaskpage[3]))),
            foregroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(
                widget.todos.mauchutaskpage[0],
                widget.todos.mauchutaskpage[1],
                widget.todos.mauchutaskpage[2],
                widget.todos.mauchutaskpage[3])),
            overlayColor: MaterialStateProperty.all<Color>(Color.fromARGB(
                widget.todos.maunentaskpage[0],
                widget.todos.maunentaskpage[1],
                widget.todos.maunentaskpage[2],
                widget.todos.maunentaskpage[3])),
            minimumSize: MaterialStateProperty.all(Size(100, 100)),
            fixedSize: MaterialStateProperty.all(Size(100, 100)),
            elevation: MaterialStateProperty.all<double>(20.0),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        )),
      ),
      iconTheme: IconThemeData(
        color: Color.fromARGB(
            widget.todos.mauchutaskpage[0],
            widget.todos.mauchutaskpage[1],
            widget.todos.mauchutaskpage[2],
            widget.todos.mauchutaskpage[3]),
        size: 24.0,
      ),

      backgroundColor: (color_for_appbar == Color.fromARGB(0, 0, 0, 0)
          ? Color.fromARGB(
              widget.todos.maunentaskpage[0],
              widget.todos.maunentaskpage[1],
              widget.todos.maunentaskpage[2],
              widget.todos.maunentaskpage[3])
          : Color.fromARGB(
              widget.todos.mausettingtaskpage[0],
              widget.todos.mausettingtaskpage[1],
              widget.todos.mausettingtaskpage[2],
              widget.todos.mausettingtaskpage[3])),
      //elevation: 20,
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          'Danh sách',
          style: TextStyle(
              color: Color.fromARGB(
                  widget.todos.mauchutaskpage[0],
                  widget.todos.mauchutaskpage[1],
                  widget.todos.mauchutaskpage[2],
                  widget.todos.mauchutaskpage[3])),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          IconButton(
            icon: (widget.todos.nightandday == true)
                ? Icon(
                    Icons.brightness_4_outlined,
                    color: Color.fromARGB(
                        widget.todos.mauchutaskpage[0],
                        widget.todos.mauchutaskpage[1],
                        widget.todos.mauchutaskpage[2],
                        widget.todos.mauchutaskpage[3]),
                  )
                : Icon(
                    Icons.brightness_5_outlined,
                    color: Color.fromARGB(
                        widget.todos.mauchutaskpage[0],
                        widget.todos.mauchutaskpage[1],
                        widget.todos.mauchutaskpage[2],
                        widget.todos.mauchutaskpage[3]),
                  ),
            onPressed: () {
              setState(() {
                widget.todos.nightandday = !widget.todos.nightandday;
                widget.todos.mauchutaskpage = (widget.todos.nightandday == true)
                    ? [255, 0, 0, 0]
                    : [255, 255, 249, 249];

                widget.todos.maunentaskpage =
                    (widget.todos.nightandday == false)
                        ? [255, 0, 0, 0]
                        : [255, 255, 249, 249];
              });
            },
          ),
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    context: context,
                    builder: (context) {
                      return setting_todotaskpage(
                        updatecolor_taskpage: (List<int> colorList) {
                          setState(() {
                            widget.todos.mausettingtaskpage = colorList;
                          });
                        },
                        updatephoto_taskpage: (String) {
                          setState(() {
                            widget.todos.phottosettingtakspage = String;
                          });
                        },
                      );
                    });
              },
              icon: Icon(
                Icons.settings,
                color: Color.fromARGB(
                    widget.todos.mauchutaskpage[0],
                    widget.todos.mauchutaskpage[1],
                    widget.todos.mauchutaskpage[2],
                    widget.todos.mauchutaskpage[3]),
              )),
          Container(
            height: 60,
            width: 60,
            child: ClipRRect(
              //borderRadius: BorderRadius.circular(100),
              child: Image.asset('assets/images/tea.jpeg'),
            ),
          ),
        ])
      ]),
    );
  }
}
