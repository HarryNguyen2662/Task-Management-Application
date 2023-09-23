// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
//import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class colorchangepage extends StatefulWidget {
  //final titlecontroler = TextEditingController();
  //final descontroler = TextEditingController();
  //final Function(String) titleChanged;
  //final Function(String) desChanged;
  //final Function(DateTime) datetimeChanged;
  final Function(List<int>) updatecolor_taskpage;
  final Function(String) updatephoto_taskpage;
  //late final DateTime datetime;
  //late final String category;
  const colorchangepage({
    super.key,
    required this.updatecolor_taskpage,
    required this.updatephoto_taskpage,
    //required this.desChanged,
    //required this.datetimeChanged,
    //required this.titleChanged,
    //required this.category,
  });

  @override
  State<colorchangepage> createState() => colorchangepagestate();
}

class colorchangepagestate extends State<colorchangepage> {
  int ID_button = 1;
  int ID_color = 0;
  String photopick = '';
  Color colorpick = const Color.fromARGB(0, 0, 0, 0);
  int press_image = 0;

  void updatebutton(int ID_changed) {
    setState(() {
      ID_button = ID_changed;
    });
  }

  Color currentColor = Colors.amber;
  Color pickerColor = const Color(0xff443a49);
  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }
  //List<Color> currentColors = [Colors.yellow, Colors.green];
  //List<Color> colorHistory = [];

  //void changeColor(Color color) => setState(() => currentColor = color);
  //void changeColors(List<Color> colors) =>
  //    setState(() => currentColors = colors);

  @override
  Widget build(BuildContext context) {
    //final datereceiver = ref.watch(dateProvider);
    //final starttimereceiver = ref.watch(starttimeProvider);
    //final endtimereceiver = ref.watch(endtimeProvider);
    return Container(
        //padding: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height * 0.30,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const Divider(
              color: Color.fromARGB(255, 102, 100, 100),
              thickness: 5,
              height: 35.0,
              indent: 140.0,
              endIndent: 140.0,
              //axis: Axis.vertical,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new_outlined,
                      color: Colors.black),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(
                  child: Text(
                    'Chọn chủ đề',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),

                //nut vo hinh trong man hinh
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new_outlined,
                      color: Color.fromARGB(255, 255, 255, 255)),
                  onPressed: () {},
                ),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              const Gap(12),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: const StadiumBorder(),
                  //side: BorderSide(width: 2, color: Colors.red),
                  backgroundColor:
                      (ID_button == 1) ? Colors.grey : Colors.white,
                  minimumSize: const Size(75, 45),
                ),
                onPressed: () => updatebutton(1),
                child: Text(
                  'Màu',
                  style: TextStyle(
                      color: (ID_button == 1) ? Colors.white : Colors.grey,
                      fontSize: 16),
                ),
              ),
              const Gap(22),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: const StadiumBorder(),
                  //side: BorderSide(width: 2, color: Colors.red),
                  backgroundColor:
                      (ID_button == 2) ? Colors.grey : Colors.white,
                  minimumSize: const Size(75, 45),
                ),
                onPressed: () => updatebutton(2),
                child: Text(
                  'Ảnh',
                  style: TextStyle(
                      color: (ID_button == 2) ? Colors.white : Colors.grey,
                      fontSize: 16),
                ),
              ),
              const Gap(22),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: const StadiumBorder(),
                  //side: BorderSide(width: 2, color: Colors.red),
                  backgroundColor:
                      (ID_button == 3) ? Colors.grey : Colors.white,
                  minimumSize: const Size(75, 45),
                ),
                onPressed: () => updatebutton(3),
                child: Text(
                  'Tuỳ chỉnh',
                  style: TextStyle(
                      color: (ID_button == 3) ? Colors.white : Colors.grey,
                      fontSize: 16),
                ),
              ),
            ]),
            const Gap(12),
            if (ID_button == 1)
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Theme(
                        data: ThemeData(
                          unselectedWidgetColor:
                              const Color.fromARGB(255, 98, 113, 186),
                        ),
                        child: Transform.scale(
                          scale: 2.0,
                          child: Radio(
                            value: 1,
                            activeColor:
                                const Color.fromARGB(255, 98, 113, 186),
                            groupValue: ID_color,
                            onChanged: (value) {
                              setState(() {
                                if (value != null) {
                                  ID_color = value;
                                  colorpick =
                                      const Color.fromARGB(255, 98, 113, 186);
                                  widget.updatecolor_taskpage(
                                      [255, 98, 113, 186]);
                                  //widget.updatephoto_taskpage('');
                                }
                              });
                            },
                          ),
                        ),
                      ),
                      const Gap(12),
                      Theme(
                        data: ThemeData(
                          unselectedWidgetColor:
                              const Color.fromARGB(255, 141, 93, 156),
                        ),
                        child: Transform.scale(
                          scale: 2.0,
                          child: Radio(
                            value: 2,
                            activeColor:
                                const Color.fromARGB(255, 141, 93, 156),
                            groupValue: ID_color,
                            onChanged: (value) {
                              setState(() {
                                if (value != null) {
                                  ID_color = value;
                                  colorpick =
                                      const Color.fromARGB(255, 141, 93, 156);
                                  widget.updatecolor_taskpage(
                                      [255, 141, 93, 156]);
                                  //widget.updatephoto_taskpage('');
                                }
                              });
                            },
                          ),
                        ),
                      ),
                      const Gap(12),
                      Theme(
                        data: ThemeData(
                          unselectedWidgetColor:
                              const Color.fromARGB(255, 169, 77, 108),
                        ),
                        child: Transform.scale(
                          scale: 2.0,
                          child: Radio(
                            value: 3,
                            activeColor:
                                const Color.fromARGB(255, 169, 77, 108),
                            groupValue: ID_color,
                            onChanged: (value) {
                              setState(() {
                                if (value != null) {
                                  ID_color = value;
                                  colorpick =
                                      const Color.fromARGB(255, 169, 77, 108);
                                  widget.updatecolor_taskpage(
                                      [255, 169, 77, 108]);
                                  //widget.updatephoto_taskpage('');
                                }
                              });
                            },
                          ),
                        ),
                      ),
                      const Gap(12),
                      Theme(
                        data: ThemeData(
                          unselectedWidgetColor:
                              const Color.fromARGB(255, 170, 81, 76),
                        ),
                        child: Transform.scale(
                          scale: 2.0,
                          child: Radio(
                            value: 4,
                            activeColor: const Color.fromARGB(255, 170, 81, 76),
                            groupValue: ID_color,
                            onChanged: (value) {
                              setState(() {
                                if (value != null) {
                                  ID_color = value;
                                  colorpick =
                                      const Color.fromARGB(255, 170, 81, 76);
                                  widget
                                      .updatecolor_taskpage([255, 170, 81, 76]);
                                  //widget.updatephoto_taskpage('');
                                }
                              });
                            },
                          ),
                        ),
                      ),
                      const Gap(12),
                      Theme(
                        data: ThemeData(
                          unselectedWidgetColor:
                              const Color.fromARGB(255, 82, 130, 95),
                        ),
                        child: Transform.scale(
                          scale: 2.0,
                          child: Radio(
                            value: 5,
                            activeColor: const Color.fromARGB(255, 82, 130, 95),
                            groupValue: ID_color,
                            onChanged: (value) {
                              setState(() {
                                if (value != null) {
                                  ID_color = value;
                                  colorpick =
                                      const Color.fromARGB(255, 82, 130, 95);
                                  widget
                                      .updatecolor_taskpage([255, 82, 130, 95]);
                                  //widget.updatephoto_taskpage('');
                                }
                              });
                            },
                          ),
                        ),
                      ),
                      const Gap(12),
                      Theme(
                        data: ThemeData(
                          unselectedWidgetColor:
                              const Color.fromARGB(255, 79, 128, 123),
                        ),
                        child: Transform.scale(
                          scale: 2.0,
                          child: Radio(
                            value: 6,
                            activeColor:
                                const Color.fromARGB(255, 79, 128, 123),
                            groupValue: ID_color,
                            onChanged: (value) {
                              setState(() {
                                if (value != null) {
                                  ID_color = value;
                                  colorpick =
                                      const Color.fromARGB(255, 79, 128, 123);
                                  widget.updatecolor_taskpage(
                                      [255, 79, 128, 123]);
                                  //widget.updatephoto_taskpage('');
                                }
                              });
                            },
                          ),
                        ),
                      ),
                      const Gap(12),
                      Theme(
                        data: ThemeData(
                          unselectedWidgetColor:
                              const Color.fromARGB(255, 108, 107, 128),
                        ),
                        child: Transform.scale(
                          scale: 2.0,
                          child: Radio(
                            value: 7,
                            activeColor:
                                const Color.fromARGB(255, 108, 107, 128),
                            groupValue: ID_color,
                            onChanged: (value) {
                              setState(() {
                                if (value != null) {
                                  ID_color = value;
                                  colorpick =
                                      const Color.fromARGB(255, 108, 107, 128);
                                  widget.updatecolor_taskpage(
                                      [255, 108, 107, 128]);
                                  //widget.updatephoto_taskpage('');
                                }
                              });
                            },
                          ),
                        ),
                      ),

                      //--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                      //--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                      //--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                      //--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                      //--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                      //--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                      //--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                      //--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                      //--------------------------------------------------------------------------------------------------------------------------------------------------------------------------

                      const Gap(12),
                      Theme(
                        data: ThemeData(
                          unselectedWidgetColor:
                              const Color.fromARGB(255, 46, 59, 75),
                        ),
                        child: Transform.scale(
                          scale: 2.0,
                          child: Radio(
                            value: 8,
                            activeColor: const Color.fromARGB(255, 46, 59, 75),
                            groupValue: ID_color,
                            onChanged: (value) {
                              setState(() {
                                if (value != null) {
                                  ID_color = value;
                                  colorpick =
                                      const Color.fromARGB(255, 46, 59, 75);
                                  widget
                                      .updatecolor_taskpage([255, 46, 59, 75]);
                                  //widget.updatephoto_taskpage('');
                                }
                              });
                            },
                          ),
                        ),
                      ),
                      const Gap(12),
                      Theme(
                        data: ThemeData(
                          unselectedWidgetColor:
                              const Color.fromARGB(255, 104, 87, 124),
                        ),
                        child: Transform.scale(
                          scale: 2.0,
                          child: Radio(
                            value: 9,
                            activeColor:
                                const Color.fromARGB(255, 104, 87, 124),
                            groupValue: ID_color,
                            onChanged: (value) {
                              setState(() {
                                if (value != null) {
                                  ID_color = value;
                                  colorpick =
                                      const Color.fromARGB(255, 104, 87, 124);
                                  widget.updatecolor_taskpage(
                                      [255, 104, 87, 124]);
                                  //widget.updatephoto_taskpage('');
                                }
                              });
                            },
                          ),
                        ),
                      ),
                      const Gap(12),
                      Theme(
                        data: ThemeData(
                          unselectedWidgetColor:
                              const Color.fromARGB(255, 131, 84, 95),
                        ),
                        child: Transform.scale(
                          scale: 2.0,
                          child: Radio(
                            value: 10,
                            activeColor: const Color.fromARGB(255, 131, 84, 95),
                            groupValue: ID_color,
                            onChanged: (value) {
                              setState(() {
                                if (value != null) {
                                  ID_color = value;
                                  colorpick =
                                      const Color.fromARGB(255, 131, 84, 95);
                                  widget
                                      .updatecolor_taskpage([255, 131, 84, 95]);
                                  //widget.updatephoto_taskpage('');
                                }
                              });
                            },
                          ),
                        ),
                      ),
                      const Gap(12),
                      Theme(
                        data: ThemeData(
                          unselectedWidgetColor:
                              const Color.fromARGB(255, 105, 28, 4),
                        ),
                        child: Transform.scale(
                          scale: 2.0,
                          child: Radio(
                            value: 11,
                            activeColor: const Color.fromARGB(255, 105, 28, 4),
                            groupValue: ID_color,
                            onChanged: (value) {
                              setState(() {
                                if (value != null) {
                                  ID_color = value;
                                  colorpick =
                                      const Color.fromARGB(255, 105, 28, 4);
                                  widget
                                      .updatecolor_taskpage([255, 105, 28, 4]);
                                  //widget.updatephoto_taskpage('');
                                }
                              });
                            },
                          ),
                        ),
                      ),
                      const Gap(12),
                      Theme(
                        data: ThemeData(
                          unselectedWidgetColor:
                              const Color.fromARGB(255, 77, 90, 68),
                        ),
                        child: Transform.scale(
                          scale: 2.0,
                          child: Radio(
                            value: 12,
                            activeColor: const Color.fromARGB(255, 77, 90, 68),
                            groupValue: ID_color,
                            onChanged: (value) {
                              setState(() {
                                if (value != null) {
                                  ID_color = value;
                                  colorpick =
                                      const Color.fromARGB(255, 77, 90, 68);
                                  widget
                                      .updatecolor_taskpage([255, 77, 90, 68]);
                                  //widget.updatephoto_taskpage('');
                                }
                              });
                            },
                          ),
                        ),
                      ),
                      const Gap(12),
                      Theme(
                        data: ThemeData(
                          unselectedWidgetColor:
                              const Color.fromARGB(255, 110, 66, 109),
                        ),
                        child: Transform.scale(
                          scale: 2.0,
                          child: Radio(
                            value: 13,
                            activeColor:
                                const Color.fromARGB(255, 110, 66, 109),
                            groupValue: ID_color,
                            onChanged: (value) {
                              setState(() {
                                if (value != null) {
                                  ID_color = value;
                                  colorpick =
                                      const Color.fromARGB(255, 110, 66, 109);
                                  widget.updatecolor_taskpage(
                                      [255, 110, 66, 109]);
                                  //widget.updatephoto_taskpage('');
                                }
                              });
                            },
                          ),
                        ),
                      ),
                      const Gap(12),
                      Theme(
                        data: ThemeData(
                          unselectedWidgetColor:
                              const Color.fromARGB(255, 116, 129, 1),
                        ),
                        child: Transform.scale(
                          scale: 2.0,
                          child: Radio(
                            value: 14,
                            activeColor: const Color.fromARGB(255, 116, 129, 1),
                            groupValue: ID_color,
                            onChanged: (value) {
                              setState(() {
                                if (value != null) {
                                  ID_color = value;
                                  colorpick =
                                      const Color.fromARGB(255, 116, 129, 1);
                                  widget
                                      .updatecolor_taskpage([255, 116, 129, 1]);
                                  //widget.updatephoto_taskpage('');
                                }
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  )),
            if (ID_button == 2)
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const Gap(30),
                      InkWell(
                        onTap: () {
                          setState(() {
                            press_image = 0;
                            photopick = '';
                            widget.updatephoto_taskpage(photopick);
                            //widget.updatecolor_taskpage(
                            //    Color.fromARGB(0, 0, 0, 0));
                          });
                        },
                        child: const Icon(
                          Icons.clear_rounded,
                          size: 80,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            press_image = 1;
                            photopick = 'assets/images/cupsky.jpeg';
                            widget.updatephoto_taskpage(photopick);
//                            widget.updatecolor_taskpage(
//                                Color.fromARGB(0, 0, 0, 0));
                          });
                        },
                        child: (press_image != 1)
                            ? const CircleAvatar(
                                radius: 40.0,
                                backgroundImage:
                                    AssetImage('assets/images/cupsky.jpeg'),
                              )
                            : const Icon(
                                Icons.done,
                                size: 80,
                              ),
                      ),
                      const Gap(22),
                      InkWell(
                        onTap: () {
                          setState(() {
                            press_image = 2;
                            photopick = 'assets/images/cupsky1.jpeg';
                            widget.updatephoto_taskpage(photopick);
//                            widget.updatecolor_taskpage(
//                                Color.fromARGB(0, 0, 0, 0));
                          });
                        },
                        child: (press_image != 2)
                            ? const CircleAvatar(
                                radius: 40.0,
                                backgroundImage:
                                    AssetImage('assets/images/cupsky1.jpeg'),
                              )
                            : const Icon(
                                Icons.done,
                                size: 80,
                              ),
                      ),
                      const Gap(22),
                      InkWell(
                        onTap: () {
                          setState(() {
                            press_image = 3;
                            photopick = 'assets/images/cupsky2.jpeg';
                            widget.updatephoto_taskpage(photopick);
//                            widget.updatecolor_taskpage(
//                                Color.fromARGB(0, 0, 0, 0));
                          });
                        },
                        child: (press_image != 3)
                            ? const CircleAvatar(
                                radius: 40.0,
                                backgroundImage:
                                    AssetImage('assets/images/cupsky2.jpeg'),
                              )
                            : const Icon(
                                Icons.done,
                                size: 80,
                              ),
                      ),
                      const Gap(22),
                      InkWell(
                        onTap: () {
                          setState(() {
                            press_image = 4;
                            photopick = 'assets/images/cupsky3.jpeg';
                            widget.updatephoto_taskpage(photopick);
//                            widget.updatecolor_taskpage(
//                                Color.fromARGB(0, 0, 0, 0));
                          });
                        },
                        child: (press_image != 4)
                            ? const CircleAvatar(
                                radius: 40.0,
                                backgroundImage:
                                    AssetImage('assets/images/cupsky3.jpeg'),
                              )
                            : const Icon(
                                Icons.done,
                                size: 80,
                              ),
                      ),
                      const Gap(22),
                      InkWell(
                        onTap: () {
                          setState(() {
                            press_image = 5;
                            photopick = 'assets/images/cupsky4.jpeg';
                            widget.updatephoto_taskpage(photopick);
//                            widget.updatecolor_taskpage(
//                                Color.fromARGB(0, 0, 0, 0));
                          });
                        },
                        child: (press_image != 5)
                            ? const CircleAvatar(
                                radius: 40.0,
                                backgroundImage:
                                    AssetImage('assets/images/cupsky4.jpeg'),
                              )
                            : const Icon(
                                Icons.done,
                                size: 80,
                              ),
                      ),
                      const Gap(22),
                      InkWell(
                        onTap: () {
                          setState(() {
                            press_image = 6;
                            photopick = 'assets/images/cupsky5.jpeg';
                            widget.updatephoto_taskpage(photopick);
//                            widget.updatecolor_taskpage(
//                                Color.fromARGB(0, 0, 0, 0));
                          });
                        },
                        child: (press_image != 6)
                            ? const CircleAvatar(
                                radius: 40.0,
                                backgroundImage:
                                    AssetImage('assets/images/cupsky5.jpeg'),
                              )
                            : const Icon(
                                Icons.done,
                                size: 80,
                              ),
                      ),
                      const Gap(22),
                      InkWell(
                        onTap: () {
                          setState(() {
                            press_image = 7;
                            photopick = 'assets/images/cupsky6.jpeg';
                            widget.updatephoto_taskpage(photopick);
//                            widget.updatecolor_taskpage(
//                                Color.fromARGB(0, 0, 0, 0));
                          });
                        },
                        child: (press_image != 7)
                            ? const CircleAvatar(
                                radius: 40.0,
                                backgroundImage:
                                    AssetImage('assets/images/cupsky6.jpeg'),
                              )
                            : const Icon(
                                Icons.done,
                                size: 80,
                              ),
                      ),
                      const Gap(22),
                      InkWell(
                        onTap: () {
                          setState(() {
                            press_image = 8;
                            photopick = 'assets/images/cupsky7.jpeg';
                            widget.updatephoto_taskpage(photopick);
//                            widget.updatecolor_taskpage(
//                                Color.fromARGB(0, 0, 0, 0));
                          });
                        },
                        child: (press_image != 8)
                            ? const CircleAvatar(
                                radius: 40.0,
                                backgroundImage:
                                    AssetImage('assets/images/cupsky7.jpeg'),
                              )
                            : const Icon(
                                Icons.done,
                                size: 80,
                              ),
                      ),
                      const Gap(22),
                      InkWell(
                        onTap: () {
                          setState(() {
                            press_image = 9;
                            photopick = 'assets/images/cupgreen1.jpeg';
                            widget.updatephoto_taskpage(photopick);
//                            widget.updatecolor_taskpage(
//                                Color.fromARGB(0, 0, 0, 0));
                          });
                        },
                        child: (press_image != 9)
                            ? const CircleAvatar(
                                radius: 40.0,
                                backgroundImage:
                                    AssetImage('assets/images/cupgreen1.jpeg'),
                              )
                            : const Icon(
                                Icons.done,
                                size: 80,
                              ),
                      ),
                      const Gap(22),
                      InkWell(
                        onTap: () {
                          setState(() {
                            press_image = 10;
                            photopick = 'assets/images/cupgreen2.jpeg';
                            widget.updatephoto_taskpage(photopick);
//                            widget.updatecolor_taskpage(
//                                Color.fromARGB(0, 0, 0, 0));
                          });
                        },
                        child: (press_image != 10)
                            ? const CircleAvatar(
                                radius: 40.0,
                                backgroundImage:
                                    AssetImage('assets/images/cupgreen2.jpeg'),
                              )
                            : const Icon(
                                Icons.done,
                                size: 80,
                              ),
                      ),
                      const Gap(22),
                      InkWell(
                        onTap: () {
                          setState(() {
                            press_image = 11;
                            photopick = 'assets/images/cupgreen3.jpeg';
                            widget.updatephoto_taskpage(photopick);
//                            widget.updatecolor_taskpage(
//                                Color.fromARGB(0, 0, 0, 0));
                          });
                        },
                        child: (press_image != 11)
                            ? const CircleAvatar(
                                radius: 40.0,
                                backgroundImage:
                                    AssetImage('assets/images/cupgreen3.jpeg'),
                              )
                            : const Icon(
                                Icons.done,
                                size: 80,
                              ),
                      ),
                      const Gap(22),
                      InkWell(
                        onTap: () {
                          setState(() {
                            press_image = 12;
                            photopick = 'assets/images/cupgreen4.jpeg';
                            widget.updatephoto_taskpage(photopick);
//                            widget.updatecolor_taskpage(
//                                Color.fromARGB(0, 0, 0, 0));
                          });
                        },
                        child: (press_image != 12)
                            ? const CircleAvatar(
                                radius: 40.0,
                                backgroundImage:
                                    AssetImage('assets/images/cupgreen4.jpeg'),
                              )
                            : const Icon(
                                Icons.done,
                                size: 80,
                              ),
                      ),
                      const Gap(22),
                      InkWell(
                        onTap: () {
                          setState(() {
                            press_image = 13;
                            photopick = 'assets/images/cupgreen5.jpeg';
                            widget.updatephoto_taskpage(photopick);
//                            widget.updatecolor_taskpage(
//                                Color.fromARGB(0, 0, 0, 0));
                          });
                        },
                        child: (press_image != 13)
                            ? const CircleAvatar(
                                radius: 40.0,
                                backgroundImage:
                                    AssetImage('assets/images/cupgreen5.jpeg'),
                              )
                            : const Icon(
                                Icons.done,
                                size: 80,
                              ),
                      ),
                      const Gap(22),
                      InkWell(
                        onTap: () {
                          setState(() {
                            press_image = 14;
                            photopick = 'assets/images/cupgreen6.jpeg';
                            widget.updatephoto_taskpage(photopick);
//                            widget.updatecolor_taskpage(
//                                Color.fromARGB(0, 0, 0, 0));
                          });
                        },
                        child: (press_image != 14)
                            ? const CircleAvatar(
                                radius: 40.0,
                                backgroundImage:
                                    AssetImage('assets/images/cupgreen6.jpeg'),
                              )
                            : const Icon(
                                Icons.done,
                                size: 80,
                              ),
                      ),
                    ],
                  )),
            if (ID_button == 3)
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Chọn màu'),
                                content: SingleChildScrollView(
                                  child: ColorPicker(
                                    pickerColor: pickerColor,
                                    onColorChanged: changeColor,
                                    showLabel: true,
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text('OK'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      widget.updatecolor_taskpage([
                                        pickerColor.alpha,
                                        pickerColor.red,
                                        pickerColor.green,
                                        pickerColor.blue
                                      ]);
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: const CircleAvatar(
                          radius: 40.0,
                          //backgroundColor: ,
                          backgroundImage:
                              AssetImage('assets/images/rainbow.jpeg'),
                        ),
                      ),
                    ],
                  ))
            //if (ID_button == 3)
          ]),
        ));
  }
}
