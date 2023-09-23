import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class datetimeWidget extends ConsumerWidget {
  final String valuetext;
  final String titlebox;
  final IconData iconbox;
  final VoidCallback onTap;
  final mauchu;
  const datetimeWidget({
    super.key,
    required this.titlebox,
    required this.iconbox,
    required this.valuetext,
    required this.onTap,
    required this.mauchu,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(titlebox,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w700, color: mauchu)),
        Gap(6),
        Material(
          child: Ink(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(8)),
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () => onTap(),
                child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Color.fromARGB(255, 202, 193, 193),
                        width: 2,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(valuetext),
                        Gap(6),
                        Icon(iconbox),
                      ],
                    )),
              )),
        )
      ],
    ));
  }
}
