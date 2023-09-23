// ignore_for_file: prefer_typing_uninitialized_variables, camel_case_types, no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'None',
      expandedValue: 'leuleu',
    );
  });
}

class repeatlist extends StatefulWidget {
  final String titlebox;
  final mauchu;
  final Function(String) updatenhenhang;
  const repeatlist({
    Key? key,
    required this.titlebox,
    required this.mauchu,
    required this.updatenhenhang,
  }) : super(key: key);

  @override
  State<repeatlist> createState() => repeatlistState(titlebox);
}

class repeatlistState extends State<repeatlist> {
  final List<Item> _data = generateItems(1);
  final titleboxstate;
  repeatlistState(this.titleboxstate);

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
      children: _data.map<ExpansionPanel>((Item item) {
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
                        widget.updatenhenhang(item.headerValue);
                      });
                    }),
                ListTile(
                    title: const Text('Daily'),
                    onTap: () {
                      setState(() {
                        item.headerValue = 'Daily';
                        item.isExpanded = !item.isExpanded;
                        widget.updatenhenhang(item.headerValue);
                      });
                    }),
                ListTile(
                    title: const Text('Weekly'),
                    onTap: () {
                      setState(() {
                        item.headerValue = 'Weekly';
                        item.isExpanded = !item.isExpanded;
                        widget.updatenhenhang(item.headerValue);
                      });
                    }),
                ListTile(
                    title: const Text('Monthly'),
                    onTap: () {
                      setState(() {
                        item.headerValue = 'Monthly';
                        item.isExpanded = !item.isExpanded;
                        widget.updatenhenhang(item.headerValue);
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
