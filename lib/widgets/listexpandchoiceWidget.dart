// ignore_for_file: file_names, prefer_const_constructors_in_immutables, prefer_typing_uninitialized_variables, duplicate_ignore, no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Item2 {
  Item2({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item2> generateItems(int numberOfItems) {
  return List<Item2>.generate(numberOfItems, (int index) {
    return Item2(
      headerValue: 'None',
      expandedValue: 'leuleu',
    );
  });
}

class ExpansionPanelListExample extends StatefulWidget {
  final String titlebox;
  // ignore: prefer_typing_uninitialized_variables
  final mauchu;
  final Function(int) updatenhenhang;
  const ExpansionPanelListExample({
    Key? key,
    required this.updatenhenhang,
    required this.titlebox,
    required this.mauchu,
  }) : super(key: key);

  @override
  State<ExpansionPanelListExample> createState() =>
      _ExpansionPanelListExampleState(titlebox);
}

class _ExpansionPanelListExampleState extends State<ExpansionPanelListExample> {
  final List<Item2> _data = generateItems(1);
  final titleboxstate;
  _ExpansionPanelListExampleState(this.titleboxstate);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(titleboxstate,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: widget.mauchu)),
        const Gap(6),
        Material(
          child: Ink(
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8)),
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                //onTap: () => onTap(),
                child: Container(
                    //padding: EdgeInsets.symmetric(
                    //  horizontal: 12,
                    //  vertical: 8,
                    //),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: const Color.fromARGB(255, 202, 193, 193),
                        width: 2,
                      ),
                    ),
                    child: _buildPanel()),
              )),
        )
      ],
    ));
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item2 item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headerValue),
            );
          },
          body: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                    title: const Text('None'),
                    onTap: () {
                      setState(() {
                        item.headerValue = 'None';
                        item.isExpanded = !item.isExpanded;
                        widget.updatenhenhang(0);
                      });
                    }),
                ListTile(
                    title: const Text('5 minutes early'),
                    onTap: () {
                      setState(() {
                        item.headerValue = '5 minutes early';
                        item.isExpanded = !item.isExpanded;
                        widget.updatenhenhang(5);
                      });
                    }),
                ListTile(
                    title: const Text('10 minutes early'),
                    onTap: () {
                      setState(() {
                        item.headerValue = '10 minutes early';
                        item.isExpanded = !item.isExpanded;
                        widget.updatenhenhang(10);
                      });
                    }),
                ListTile(
                    title: const Text('15 minutes early'),
                    onTap: () {
                      setState(() {
                        item.headerValue = '15 minutes early';
                        item.isExpanded = !item.isExpanded;
                        widget.updatenhenhang(15);
                      });
                    }),
                ListTile(
                    title: const Text('30 minutes early'),
                    onTap: () {
                      setState(() {
                        item.headerValue = '30 minutes early';
                        item.isExpanded = !item.isExpanded;
                        widget.updatenhenhang(30);
                      });
                    }),
                ListTile(
                    title: const Text('60 minutes early'),
                    onTap: () {
                      setState(() {
                        item.headerValue = '60 minutes early';
                        item.isExpanded = !item.isExpanded;
                        widget.updatenhenhang(60);
                      });
                    }),
              ],
            ),
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}
