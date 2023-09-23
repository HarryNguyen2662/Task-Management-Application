// ignore_for_file: camel_case_types, non_constant_identifier_names, prefer_typing_uninitialized_variables, no_logic_in_create_state

import 'package:flutter/material.dart';
import 'change_backgroundtopic.dart';

//ref.read(radioProvider.notifier).update((state) => 1)

class setting_todotaskpage extends StatefulWidget {
  final Function(List<int>) updatecolor_taskpage;
  final Function(String) updatephoto_taskpage;
  final Color_pickedfromstate;
  final Photo_pickedfromstate;
  const setting_todotaskpage({
    super.key,
    required this.updatecolor_taskpage,
    this.Color_pickedfromstate,
    required this.updatephoto_taskpage,
    this.Photo_pickedfromstate,
  });
  @override
  State<setting_todotaskpage> createState() => setting_todotaskpagestate(
        updatecolor_taskpage,
        updatephoto_taskpage,
      );
}

class setting_todotaskpagestate extends State<setting_todotaskpage> {
  final Function(List<int>) updatecolor_taskpage;
  final Function(String) updatephoto_taskpage;
  //final Color_picked;
  //final photo_picked;
  setting_todotaskpagestate(
      this.updatecolor_taskpage, this.updatephoto_taskpage);

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
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Divider(
              color: Color.fromARGB(255, 102, 100, 100),
              thickness: 5,
              height: 35.0,
              indent: 150.0,
              endIndent: 150.0,
              //axis: Axis.vertical,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              //crossAxisAlignment: CrossAxisAlignment.,
              children: [
                const SizedBox(
                  //width: double.infinity,
                  child: Text(
                    'Tuỳ chọn danh sách',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 15),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Hoàn thành',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 71, 58, 215)),
                  ),
                ),
              ],
            ),
            TextButton(
              onPressed: () {},
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      const Icon(
                        Icons.sort_rounded,
                        color: Colors.black,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 15),
                      ),
                      const Text(
                        'Sắp xếp',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16, color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ]),
                    const Icon(Icons.arrow_forward_ios_sharp,
                        color: Colors.black),
                  ]),
            ),
            TextButton(
              onPressed: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    context: context,
                    builder: (context) {
                      return colorchangepage(
                        updatecolor_taskpage: updatecolor_taskpage,
                        updatephoto_taskpage: updatephoto_taskpage,
                      );
                    });
              },
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      const Icon(
                        Icons.format_color_fill,
                        color: Colors.black,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 15),
                      ),
                      const Text(
                        'Thay đổi chủ đề',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16, color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ]),
                    const Icon(Icons.arrow_forward_ios_sharp,
                        color: Colors.black),
                  ]),
            ),
          ]),
        ));
  }
}
