// ignore_for_file: non_constant_identifier_names, prefer_const_constructors_in_immutables, camel_case_types, avoid_types_as_parameter_names, unrelated_type_equality_checks

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:todolist/main.dart';
import 'package:todolist/model/taskmodel.dart';
import 'package:todolist/screens/setting_fortaskpage.dart';
import 'package:todolist/screens/task_page.dart';
import 'package:todolist/model/groupmodel.dart';
import 'package:todolist/widgets/todogroupWidget.dart';
//import 'package:tinycolor/tinycolor.dart';

class listview_grouptask extends StatefulWidget {
  listview_grouptask({super.key});

  @override
  State<listview_grouptask> createState() => listview_grouptaskstate();
}

Map<String, Icon> listfor_consticon = {
  '01': const Icon(Icons.sunny, color: Color.fromARGB(255, 45, 214, 205)),
  '02': const Icon(Icons.star_outline_rounded,
      color: Color.fromARGB(255, 157, 78, 154)),
  '03': const Icon(Icons.content_paste_outlined,
      color: Color.fromARGB(255, 87, 186, 156)),
  '04': const Icon(Icons.person_2_outlined,
      color: Color.fromARGB(255, 154, 168, 53)),
  '05':
      const Icon(Icons.flag_outlined, color: Color.fromARGB(255, 132, 22, 22)),
  '06':
      const Icon(Icons.done_outline, color: Color.fromARGB(255, 12, 113, 201)),
};

class listview_grouptaskstate extends State<listview_grouptask> {
  final todosList = savedGROUP_todo;
  List<GROUP_ToDo> _foundToDo = [];
  final _todoController = TextEditingController();
  Color color_fromsettingpage = const Color.fromARGB(0, 0, 0, 0);
  String photto_fromsettingpage = '';

  bool nightandday = true;
  Color mauchu = const Color.fromARGB(255, 255, 255, 255);
  Color maunen = const Color.fromARGB(255, 0, 0, 0);

  void updateMyTiles(int oldIndex, int newIndex) {
    setState(() {
      if (oldIndex < newIndex) {
        newIndex -= 1;
      }
      final GROUP_ToDo tile = todosList.removeAt(oldIndex);
      todosList.insert(newIndex, tile);
      //savedGROUP_todo.insert(newIndex, tile2);
    });
  }

  @override
  void initState() {
    _foundToDo = todosList;
    mauchu = (nightandday == true)
        ? const Color.fromARGB(255, 0, 0, 0)
        : const Color.fromARGB(255, 255, 249, 249);

    maunen = (nightandday == false)
        ? const Color.fromARGB(255, 0, 0, 0)
        : const Color.fromARGB(255, 255, 249, 249);
    super.initState();
  }

  void _deleteToDoItem(String id) {
    setState(() {
      int len = todosList[0].todoList.length;
      for (int i = 0; i < len; i++) {
        ToDo tam = todosList[0].todoList[i];
        if ((tam.Datetask!.day == DateTime.now().day) &&
            (tam.Datetask!.month == DateTime.now().month)) {
          todosList[0].todoList.removeWhere((item) => item.id == tam.id);
        }
      }
      todosList.removeWhere((item) => item.id == id);
      //savedGROUP_todo.removeWhere((item) => item.id == id);
    });
  }

  void _addToDoItem(String toDo) {
    /*setState(() {
      todosList.add(GROUP_ToDo(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        Group_Text: toDo,
        icon: Icon(
          Icons.format_list_bulleted,
          color: Color.fromARGB(255, 12, 113, 201),
        ),
        const_gr: false,
        color_id: Color.fromARGB(255, 12, 113, 201),
        todoList: [],
      ));
    });*/
    //print(todosList.length);
    setState(() {
      todosList.add(GROUP_ToDo(
        mark_done: false,
        mark_doneimage: false,
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        Group_Text: toDo,
        /*icon: Icon(
          Icons.format_list_bulleted,
          color: Color.fromARGB(255, 12, 113, 201),
        ),*/
        const_gr: false,
        todoList: [],
        mauchutaskpage: [255, 255, 255, 255],
        maunentaskpage: [255, 0, 0, 0],
        mausettingtaskpage: [0, 0, 0, 0],
        nightandday: true,
        phottosettingtakspage: '',
      ));
      // _todoController.clear();
    });
    //savedGROUP_todo = todosList;
    //print(todosList.length);
    _todoController.clear();
  }

  @override
  Widget build(BuildContext context) {
    FocusNode _focusNode = FocusNode();
    if (photto_fromsettingpage != '')
      // ignore: curly_braces_in_flow_control_structures
      return Scaffold(
          //backgroundColor: bglight,
          appBar: _buildAppBar(
              ((color_fromsettingpage == const Color.fromARGB(0, 0, 0, 0))
                  ? maunen
                  : color_fromsettingpage)),
          body: Stack(children: [
            Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(photto_fromsettingpage),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      //User profile
                      BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: Container(
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ),
                      const Divider(color: Colors.grey),

                      Expanded(
                          flex: 25,
                          child: ReorderableListView(
                              onReorder: (oldIndex, newIndex) {
                                updateMyTiles(oldIndex, newIndex);
                              },
                              padding: const EdgeInsets.all(0),
                              children: <Widget>[
                                for (int i = 0; i < 6; i++)
                                  ToDoItem(
                                      icon_2: listfor_consticon[
                                          _foundToDo[i].id.toString()] as Icon,
                                      key: ValueKey(
                                          _foundToDo[i].id.toString() +
                                              DateTime.now()
                                                  .millisecondsSinceEpoch
                                                  .toString()),
                                      todo: _foundToDo[i],
                                      //onToDoChanged: _handleToDoChange,
                                      onDeleteItem: _deleteToDoItem,
                                      color_forlist: maunen,
                                      color_fortext: ((color_fromsettingpage ==
                                              const Color.fromARGB(0, 0, 0, 0))
                                          ? mauchu
                                          : color_fromsettingpage),
                                      update_for_slidedelete:
                                          (GROUP_ToDo grouptam) {
                                        setState(() {
                                          todosList.removeWhere(
                                              (item) => item.id == grouptam.id);
                                          //savedGROUP_todo.removeWhere(
                                          //    (item) => item.id == grouptam.id);
                                        });
                                      })
                              ])),

                      const Divider(
                        color: Color.fromARGB(255, 130, 130, 130),
                        thickness: 1.0,
                        height: 35.0,
                        indent: 20.0,
                        endIndent: 20.0,
                        //axis: Axis.vertical,
                      ),

                      Expanded(
                        flex: 25,
                        child: ReorderableListView(
                          onReorder: (oldIndex, newIndex) {
                            updateMyTiles(oldIndex + 6, newIndex + 6);
                          },
                          padding: const EdgeInsets.all(0),
                          children: <Widget>[
                            for (int i = 6; i < _foundToDo.length; i++)
                              ToDoItem(
                                icon_2: const Icon(
                                  Icons.format_list_bulleted,
                                  color: Color.fromARGB(255, 12, 113, 201),
                                ),
                                key: ValueKey(_foundToDo[i].id.toString() +
                                    DateTime.now()
                                        .millisecondsSinceEpoch
                                        .toString()),
                                todo: _foundToDo[i],
                                //onToDoChanged: _handleToDoChange,
                                onDeleteItem: _deleteToDoItem,
                                color_forlist: maunen,
                                color_fortext: ((color_fromsettingpage ==
                                        const Color.fromARGB(0, 0, 0, 0))
                                    ? mauchu
                                    : color_fromsettingpage),
                                update_for_slidedelete: (GROUP_ToDo grouptam) {
                                  setState(() {
                                    todosList.removeWhere(
                                        (item) => item.id == grouptam.id);
                                    //savedGROUP_todo.removeWhere(
                                    //    (item) => item.id == grouptam.id);
                                  });
                                },
                              ),
                          ],
                        ),
                      ),

                      Expanded(
                          flex: 0,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                      bottom: 5,
                                      right: 5,
                                      left: 10,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white70,
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(0.0, 0.0),
                                          blurRadius: 10.0,
                                          spreadRadius: 0.0,
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: TextField(
                                      controller: _todoController,
                                      autofocus: false,
                                      focusNode: _focusNode,
                                      decoration: InputDecoration(
                                          hintText: 'Danh sách mới',
                                          fillColor: mauchu,
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ),
                                IconButton(
                                    icon: Icon(Icons.add_chart_outlined,
                                        color: ((color_fromsettingpage ==
                                                const Color.fromARGB(
                                                    0, 0, 0, 0))
                                            ? mauchu
                                            : color_fromsettingpage)),
                                    onPressed: () {
                                      _focusNode.unfocus();
                                      _addToDoItem(_todoController.text);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => task_homepage(
                                                todos: todosList[
                                                    todosList.length - 1])),
                                      );
                                    }),
                              ])),
                    ]))
          ]));
    else {
      return Scaffold(
          backgroundColor: maunen,
          appBar: _buildAppBar(
              ((color_fromsettingpage == const Color.fromARGB(0, 0, 0, 0))
                  ? maunen
                  : color_fromsettingpage)),
          body: Stack(children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  //User profile
                  //BackdropFilter(
                  //  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  //  child: Container(
                  //    color: Colors.grey.withOpacity(0.5),
                  //  ),
                  //),
                  const Divider(color: Colors.grey),
                  Expanded(
                    flex: 25,
                    child: ReorderableListView(
                      onReorder: (oldIndex, newIndex) {
                        updateMyTiles(oldIndex, newIndex);
                      },
                      padding: const EdgeInsets.all(0),
                      children: <Widget>[
                        for (int i = 0; i < 6; i++)
                          ToDoItem(
                            icon_2:
                                listfor_consticon[_foundToDo[i].id.toString()]
                                    as Icon,
                            key: ValueKey(_foundToDo[i].id.toString() +
                                DateTime.now()
                                    .millisecondsSinceEpoch
                                    .toString()),
                            todo: _foundToDo[i],
                            //onToDoChanged: _handleToDoChange,
                            onDeleteItem: _deleteToDoItem,
                            color_forlist: maunen,
                            color_fortext: ((color_fromsettingpage ==
                                    const Color.fromARGB(0, 0, 0, 0))
                                ? mauchu
                                : color_fromsettingpage),
                            update_for_slidedelete: (GROUP_ToDo grouptam) {
                              setState(() {
                                todosList.removeWhere(
                                    (item) => item.id == grouptam.id);
                                //savedGROUP_todo.removeWhere(
                                //    (item) => item.id == grouptam.id);
                              });
                            },
                          ),
                      ],
                    ),
                  ),

                  const Divider(
                    color: Color.fromARGB(255, 130, 130, 130),
                    thickness: 1.0,
                    height: 35.0,
                    indent: 20.0,
                    endIndent: 20.0,
                    //axis: Axis.vertical,
                  ),

                  Expanded(
                    flex: 25,
                    child: ReorderableListView(
                      onReorder: (oldIndex, newIndex) {
                        updateMyTiles(oldIndex + 6, newIndex + 6);
                      },
                      padding: const EdgeInsets.all(0),
                      children: <Widget>[
                        for (int i = 6; i < _foundToDo.length; i++)
                          ToDoItem(
                            icon_2: const Icon(
                              Icons.format_list_bulleted,
                              color: Color.fromARGB(255, 12, 113, 201),
                            ),
                            key: ValueKey(_foundToDo[i].id.toString() +
                                DateTime.now()
                                    .millisecondsSinceEpoch
                                    .toString()),
                            todo: _foundToDo[i],
                            //onToDoChanged: _handleToDoChange,
                            onDeleteItem: _deleteToDoItem,
                            color_forlist: maunen,
                            color_fortext: ((color_fromsettingpage ==
                                    const Color.fromARGB(0, 0, 0, 0))
                                ? mauchu
                                : color_fromsettingpage),
                            update_for_slidedelete: (GROUP_ToDo grouptam) {
                              setState(() {
                                todosList.removeWhere(
                                    (item) => item.id == grouptam.id);
                                //savedGROUP_todo.removeWhere(
                                //    (item) => item.id == grouptam.id);
                              });
                            },
                          ),
                      ],
                    ),
                  ),

                  Expanded(
                      flex: 0,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(
                                  bottom: 5,
                                  right: 5,
                                  left: 10,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 5,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white70,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 0.0),
                                      blurRadius: 10.0,
                                      spreadRadius: 0.0,
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextField(
                                  controller: _todoController,
                                  focusNode: _focusNode,
                                  autofocus: false,
                                  decoration: InputDecoration(
                                      hintText: 'Danh sách mới',
                                      fillColor: mauchu,
                                      border: InputBorder.none),
                                ),
                              ),
                            ),
                            IconButton(
                                icon: Icon(Icons.add_chart_outlined,
                                    size: 32,
                                    color: ((color_fromsettingpage ==
                                            const Color.fromARGB(0, 0, 0, 0))
                                        ? mauchu
                                        : color_fromsettingpage)),
                                onPressed: () {
                                  _focusNode.unfocus();
                                  _addToDoItem(_todoController.text);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => task_homepage(
                                            todos: todosList[
                                                todosList.length - 1])),
                                  );
                                }),
                          ])),
                ])
          ]));
    }
  }

  AppBar _buildAppBar(Color color_forappbar) {
    return AppBar(
      backgroundColor: color_forappbar,
      //elevation: 0,
      scrolledUnderElevation: 10.0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
            height: 50,
            width: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset('assets/images/toan23.jpeg'),
            ),
          ),
          Text('Harry Nguyen', style: TextStyle(color: mauchu)),
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          IconButton(
            icon: (nightandday == true)
                ? Icon(
                    Icons.brightness_4_outlined,
                    color: mauchu,
                  )
                : Icon(Icons.brightness_5_outlined, color: mauchu),
            onPressed: () {
              setState(() {
                nightandday = !nightandday;
                mauchu = (nightandday == true)
                    ? const Color.fromARGB(255, 0, 0, 0)
                    : const Color.fromARGB(255, 255, 249, 249);

                maunen = (nightandday == false)
                    ? const Color.fromARGB(255, 0, 0, 0)
                    : const Color.fromARGB(255, 255, 249, 249);
              });
            },
          ),
          IconButton(
              icon: Icon(Icons.calendar_month, color: mauchu),
              onPressed: () {}),
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
                        updatecolor_taskpage: (List<int> list_color) {
                          setState(() {
                            color_fromsettingpage = Color.fromARGB(
                                list_color[0],
                                list_color[1],
                                list_color[2],
                                list_color[3]);
                          });
                        },
                        updatephoto_taskpage: (String) {
                          setState(() {
                            photto_fromsettingpage = String;
                          });
                        },
                      );
                    });
              },
              icon: Icon(
                Icons.settings,
                color: mauchu,
              )),
        ])
      ]),
    );
  }
}
