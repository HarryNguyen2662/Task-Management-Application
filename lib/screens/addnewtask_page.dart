// ignore_for_file: must_be_immutable, avoid_types_as_parameter_names, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
//import 'package:todolist/material_widget/Radio_fulfillpoviderdart';
import 'package:todolist/widgets/TextFieldWidget.dart';
import 'package:todolist/material_provider/datataskprovider.dart';
import 'package:todolist/widgets/datatimeWidget.dart';
import 'package:todolist/material_provider/datimeprovider.dart';
import 'package:todolist/widgets/radioWidget.dart';
import 'package:todolist/screens/task_page.dart';
import '../material_provider/Radio_fulfillpovider.dart';

import '../widgets/listexpandchoiceWidget.dart';
import '../widgets/listexpandrepeat.dart';

// ignore: camel_case_types
class addnewtask_page extends ConsumerWidget {
  var titlecontroler = TextEditingController();
  var descontroler = TextEditingController();
  final FocusNode _focustitle = FocusNode();
  final FocusNode _focusdescription = FocusNode();
  //var savedtitle = 'Add Task Name', saveddes = 'Add Descriptions';
  //final Function(String) titleChanged;
  //final Function(String) desChanged;
  //final Function(DateTime) datetimeChanged;
  //Color color_fromsettingpage = Color.fromARGB(0, 0, 0, 0);
  //String photto_fromsettingpage = '';
  final List<int> maunen;
  final List<int> mauchu;
  //bool nightandday = true;
  //Color mauchu = Color.fromARGB(255, 255, 255, 255);
  //Color maunen = Color.fromARGB(255, 0, 0, 0);
  late final DateTime datetime;
  //late final String category;
  addnewtask_page({
    super.key,
    required this.maunen,
    required this.mauchu,
    //required this.desChanged,
    //required this.datetimeChanged,
    //required this.titleChanged,
    //required this.category,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final datereceiver = ref.watch(dateProvider);
    final starttimereceiver = ref.watch(starttimeProvider);
    final endtimereceiver = ref.watch(endtimeProvider);
    //_scrollController.addListener(_handleScroll);
    return Container(
      padding: const EdgeInsets.all(30),
      height: MediaQuery.of(context).size.height * 0.95,
      decoration: BoxDecoration(
        color: Color.fromARGB(maunen[0], maunen[1], maunen[2], maunen[3]),
        borderRadius: BorderRadius.circular(16),
      ),
      child: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is ScrollStartNotification) {
            _focustitle.unfocus();
            _focusdescription.unfocus();
            print('Đã bắt đầu cuộn');
          } else if (notification is ScrollUpdateNotification) {
            //_focustitle.unfocus();
            //_focusdescription.unfocus();
            print('Đang cuộn');
          } else if (notification is ScrollEndNotification) {
            //_focustitle.unfocus();
            //_focusdescription.unfocus();
            print('Kết thúc cuộn');
          }
          return true;
        },
        child: SingleChildScrollView(
          //controller: _scrollController,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              TextButton(
                onPressed: () {
                  ref.read(datataskProvider).pre_addToDoItem(
                      titlecontroler.text,
                      descontroler.text,
                      ref.read(starttimeProvider),
                      ref.read(endtimeProvider),
                      ref.read(dateProvider),
                      -1,
                      remind,
                      repeat);
                  titlecontroler.clear();
                  descontroler.clear();
                  ref
                      .read(starttimeProvider.notifier)
                      .update((state) => DateTime.now());
                  ref
                      .read(endtimeProvider.notifier)
                      .update((state) => DateTime.now());
                  ref
                      .read(dateProvider.notifier)
                      .update((state) => DateTime.now());
                  ref.read(radioProvider.notifier).update((state) => -1);
                  Navigator.pop(context);
                },
                child: Text(
                  'Huỷ',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(
                          mauchu[0], mauchu[1], mauchu[2], mauchu[3])),
                ),
              ),
              SizedBox(
                //width: double.infinity,
                child: Text(
                  'New Task Todo',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(
                          mauchu[0], mauchu[1], mauchu[2], mauchu[3])),
                ),
              ),
              TextButton(
                onPressed: () {
                  _focustitle.unfocus();
                  _focusdescription.unfocus();
                  //Navigator.pop(context);
                },
                child: Text(
                  'Thêm',
                  //textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(
                          mauchu[0], mauchu[1], mauchu[2], mauchu[3])),
                ),
              ),
            ]),
            Divider(
              color: Colors.grey.shade200,
              thickness: 1.2,
              height: 35.0,
              indent: 20.0,
              endIndent: 20.0,
              //axis: Axis.vertical,
            ),
            Text('Title Task',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(
                        mauchu[0], mauchu[1], mauchu[2], mauchu[3]))),
            const Gap(6),
            TextfieldWidget(
              //savedtitle: savedtitle,
              maxLine: 1,
              hintText: 'Add Task Name',
              textcontroller: titlecontroler, focusthing: _focustitle,
            ),
            const Gap(12),
            Text('Descriptions',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(
                        mauchu[0], mauchu[1], mauchu[2], mauchu[3]))),
            TextfieldWidget(
              //savedtitle: saveddes,
              maxLine: 2,
              hintText: 'Add Descriptions',
              textcontroller: descontroler, focusthing: _focusdescription,
            ),
            const Gap(12),
            Row(
              children: [
                datetimeWidget(
                    mauchu: Color.fromARGB(
                        mauchu[0], mauchu[1], mauchu[2], mauchu[3]),
                    titlebox: 'Date',
                    iconbox: CupertinoIcons.calendar,
                    valuetext: DateFormat('EEE, MMM d').format(datereceiver),
                    onTap: () async {
                      final getValue = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2021),
                          lastDate: DateTime(2025));
                      if (getValue != null) {
                        ref
                            .read(dateProvider.notifier)
                            .update((state) => getValue);
                      }
                    })
              ],
            ),
            const Gap(12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                datetimeWidget(
                    mauchu: Color.fromARGB(
                        mauchu[0], mauchu[1], mauchu[2], mauchu[3]),
                    titlebox: 'Start Time',
                    iconbox: CupertinoIcons.clock,
                    valuetext: DateFormat('hh:mm a').format(starttimereceiver),
                    onTap: () async {
                      final getValue = await showTimePicker(
                          context: context, initialTime: TimeOfDay.now());
                      final dateTime = DateTime(
                        0,
                        0,
                        0,
                        getValue!.hour,
                        getValue.minute,
                      );
                      ref
                          .read(starttimeProvider.notifier)
                          .update((state) => dateTime);
                    }),
                const Gap(22),
                datetimeWidget(
                    mauchu: Color.fromARGB(
                        mauchu[0], mauchu[1], mauchu[2], mauchu[3]),
                    titlebox: 'End Time',
                    iconbox: CupertinoIcons.clock,
                    valuetext: DateFormat('hh:mm a').format(endtimereceiver),
                    onTap: () async {
                      final getValue = await showTimePicker(
                          context: context, initialTime: TimeOfDay.now());
                      final dateTime = DateTime(
                        0,
                        0,
                        0,
                        getValue!.hour,
                        getValue.minute,
                      );
                      ref
                          .read(endtimeProvider.notifier)
                          .update((state) => dateTime);
                    }),
                //onTap: () => clockwheel(),
              ],
            ),
            const Gap(12),
            ExpansionPanelListExample(
              titlebox: 'Remind',
              mauchu:
                  Color.fromARGB(mauchu[0], mauchu[1], mauchu[2], mauchu[3]),
              updatenhenhang: (value) {
                remind = value;
              },
            ),
            const Gap(12),
            repeatlist(
              titlebox: 'Repeat',
              mauchu:
                  Color.fromARGB(mauchu[0], mauchu[1], mauchu[2], mauchu[3]),
              updatenhenhang: (String) {
                repeat = String;
              },
            ),
            const Gap(12),
            Text('Colors',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(
                        mauchu[0], mauchu[1], mauchu[2], mauchu[3]))),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Expanded(
                  child: RadioWidget(
                colorboder: (maunen == [255, 255, 255, 255])
                    ? Colors.white
                    : Colors.black,
                //titleRadio: 'IMPORTANT',
                value: 7,
                onChangeValue: () =>
                    ref.read(radioProvider.notifier).update((state) => 7),
              )),
              Expanded(
                  child: RadioWidget(
                colorboder: Colors.red,
                //titleRadio: 'IMPORTANT',
                value: 1,
                onChangeValue: () =>
                    ref.read(radioProvider.notifier).update((state) => 1),
              )),
              Expanded(
                  child: RadioWidget(
                colorboder: Colors.orange,
                //titleRadio: 'IMPORTANT',
                value: 2,
                onChangeValue: () =>
                    ref.read(radioProvider.notifier).update((state) => 2),
              )),
              Expanded(
                  child: RadioWidget(
                colorboder: const Color.fromARGB(255, 136, 136, 31),
                //titleRadio: 'IMPORTANT',
                value: 3,
                onChangeValue: () =>
                    ref.read(radioProvider.notifier).update((state) => 3),
              )),
              Expanded(
                  child: RadioWidget(
                colorboder: Colors.green,
                //titleRadio: 'LEARNING',
                value: 4,
                onChangeValue: () =>
                    ref.read(radioProvider.notifier).update((state) => 4),
              )),
              Expanded(
                  child: RadioWidget(
                colorboder: Colors.blue,
                //titleRadio: 'MEETTING',
                value: 5,
                onChangeValue: () =>
                    ref.read(radioProvider.notifier).update((state) => 5),
              )),
            ]),
            const Gap(12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blue.shade800,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      side: BorderSide(
                        color: Colors.blue.shade800,
                      ), // BorderSide
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: () {
                      ref.read(datataskProvider).pre_addToDoItem(
                          titlecontroler.text,
                          descontroler.text,
                          ref.read(starttimeProvider),
                          ref.read(endtimeProvider),
                          ref.read(dateProvider),
                          -1,
                          remind,
                          repeat);
                      titlecontroler.clear();
                      descontroler.clear();
                      ref
                          .read(starttimeProvider.notifier)
                          .update((state) => DateTime.now());
                      ref
                          .read(endtimeProvider.notifier)
                          .update((state) => DateTime.now());
                      ref
                          .read(dateProvider.notifier)
                          .update((state) => DateTime.now());
                      ref.read(radioProvider.notifier).update((state) => -1);
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'),
                  ), // ElevatedButton
                ), // Expanded
                const Gap(20),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade800,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ), // RoundedRectangleBorder
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: () {
                      //final getradio = ref.read(radioProvider.notifier);

                      int category = ref.read(radioProvider).toInt();
                      //ref.read(datataskProvider).initState();
                      ref.read(datataskProvider).pre_addToDoItem(
                          titlecontroler.text,
                          descontroler.text,
                          ref.read(starttimeProvider),
                          ref.read(endtimeProvider),
                          ref.read(dateProvider),
                          category,
                          remind,
                          repeat);
                      //print(early_minute_notification);
                      //ref.read(datataskProvider).addToDoItem();
                      //print('data is save');
                      titlecontroler.clear();
                      descontroler.clear();
                      ref
                          .read(starttimeProvider.notifier)
                          .update((state) => DateTime.now());
                      ref
                          .read(endtimeProvider.notifier)
                          .update((state) => DateTime.now());
                      ref
                          .read(dateProvider.notifier)
                          .update((state) => DateTime.now());
                      ref.read(radioProvider.notifier).update((state) => -1);
                      Navigator.pop(context);
                    },
                    child: const Text('Create'),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
