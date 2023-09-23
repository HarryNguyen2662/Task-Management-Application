// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'am_pm.dart';
import 'hours.dart';
import 'minutes.dart';
import 'tile.dart';

class clockwheel extends StatefulWidget {
  const clockwheel({Key? key}) : super(key: key);

  @override
  clockwheelstate createState() => clockwheelstate();
}

class clockwheelstate extends State<clockwheel> {
  late FixedExtentScrollController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = FixedExtentScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // hours wheel
          Container(
            width: 70,
            child: ListWheelScrollView.useDelegate(
              controller: _controller,
              itemExtent: 50,
              perspective: 0.005,
              diameterRatio: 1.2,
              physics: FixedExtentScrollPhysics(),
              childDelegate: ListWheelChildBuilderDelegate(
                childCount: 13,
                builder: (context, index) {
                  return MyHours(
                    hours: index,
                  );
                },
              ),
            ),
          ),

          SizedBox(
            width: 10,
          ),

          // minutes wheel
          Container(
            width: 70,
            child: ListWheelScrollView.useDelegate(
              itemExtent: 50,
              perspective: 0.005,
              diameterRatio: 1.2,
              physics: FixedExtentScrollPhysics(),
              childDelegate: ListWheelChildBuilderDelegate(
                childCount: 60,
                builder: (context, index) {
                  return MyMinutes(
                    mins: index,
                  );
                },
              ),
            ),
          ),

          SizedBox(
            width: 15,
          ),

          // am or pm
          Container(
            width: 70,
            child: ListWheelScrollView.useDelegate(
              itemExtent: 50,
              perspective: 0.005,
              diameterRatio: 1.2,
              physics: FixedExtentScrollPhysics(),
              childDelegate: ListWheelChildBuilderDelegate(
                childCount: 2,
                builder: (context, index) {
                  if (index == 0) {
                    return AmPm(
                      isItAm: true,
                    );
                  } else {
                    return AmPm(
                      isItAm: false,
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
