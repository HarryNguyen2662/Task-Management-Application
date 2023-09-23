// ignore: file_names
import 'package:flutter/material.dart';

class TextfieldWidget extends StatefulWidget {
  final TextEditingController textcontroller;
  final String hintText;
  final int maxLine;
  final FocusNode focusthing;
  //var savedtitle;
  //VoidCallback updatecontroler;
  const TextfieldWidget({
    Key? key,
    //required this.updatecontroler,
    required this.focusthing,
    required this.maxLine,
    required this.hintText,
    required this.textcontroller,
    //required this.savedtitle,
  }) : super(key: key);

  @override
  TextfieldState createState() => TextfieldState();
}

class TextfieldState extends State<TextfieldWidget> {
  var savedtitle = '';
  @override
  void initState() {
    widget.textcontroller.selection = TextSelection.fromPosition(
      TextPosition(offset: widget.textcontroller.text.length),
    );
    widget.textcontroller.text = savedtitle;
    super.initState();
  }

  @override
  void dispose() {
    widget.focusthing.unfocus();
    savedtitle = widget.textcontroller.text;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      widget.textcontroller.text = savedtitle;
    });
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 202, 193, 193),
          width: 2,
        ),
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        //textInputAction: TextInputAction.done,
        onChanged: (String value) {
          setState(() {
            savedtitle = widget.textcontroller.text;
          });
        },
        /*onTapOutside: (event) {
          setState(() {
            savedtitle = widget.textcontroller.text;
          });
        },*/
        focusNode: widget.focusthing,
        controller: widget.textcontroller,
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: widget.hintText,
        ),
        maxLines: widget.maxLine,
      ),
    );
  }
}
