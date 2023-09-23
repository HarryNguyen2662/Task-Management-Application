// ignore_for_file: file_names

import 'package:flutter/material.dart';

class AnimatedNeumorphism extends StatefulWidget {
  const AnimatedNeumorphism({Key? key}) : super(key: key);
  @override
  State<AnimatedNeumorphism> createState() => _AnimatedNeumorphismState();
}

class _AnimatedNeumorphismState extends State<AnimatedNeumorphism>
    with TickerProviderStateMixin {
  double turns = 0.0;
  bool isClicked = false;
  late AnimationController _controllerani;
  Color customBlackColor = const Color.fromARGB(255, 53, 53, 53);
  Color customWhiteColor = const Color.fromARGB(255, 237, 237, 237);

  @override
  void initState() {
    _controllerani = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controllerani.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedRotation(
        curve: Curves.easeOutExpo,
        turns: turns,
        duration: const Duration(seconds: 1),
        child: GestureDetector(
            onTap: () {
              if (isClicked) {
                setState(() {
                  turns -= 1 / 4;
                });
                _controllerani.reverse();
              } else {
                setState(() {
                  turns += 1 / 4;
                });
                _controllerani.forward();
              }
              isClicked = !isClicked;
            },
            child: AnimatedContainer(
                curve: Curves.easeOutExpo,
                duration: const Duration(seconds: 1),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: customWhiteColor,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 30.0,
                        offset: isClicked
                            ? const Offset(20, -20)
                            : const Offset(20, 20),
                        color: Colors.grey,
                      ),
                      BoxShadow(
                        blurRadius: 30.0,
                        offset: isClicked
                            ? const Offset(-20, 20)
                            : const Offset(-20, -20),
                        color: Colors.white,
                      )
                    ]),
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: Center(
                      child: AnimatedIcon(
                    icon: AnimatedIcons.search_ellipsis,
                    progress: _controllerani,
                    size: 20,
                    color: customBlackColor,
                  )),
                ))));
  }
}
