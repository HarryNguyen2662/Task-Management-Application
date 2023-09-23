import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../material_provider/Radio_fulfillpovider.dart';

class RadioWidget extends ConsumerWidget {
  //final String titleRadio;
  final Color colorboder;
  final int value;
  final VoidCallback onChangeValue;

  const RadioWidget({
    super.key,
    required this.colorboder,
    //required this.titleRadio,
    required this.value,
    required this.onChangeValue,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final radio = ref.watch(radioProvider);
    return Material(
        key: ValueKey(DateTime.now().millisecondsSinceEpoch.toString()),
        child: Theme(
          data: ThemeData(unselectedWidgetColor: colorboder),
          child: RadioListTile(
            activeColor: colorboder,
            contentPadding: EdgeInsets.zero,
            title: Transform.translate(
              offset: const Offset(-22, 0),
              //child: Text(titleRadio,
              //   style:
              //        TextStyle(color: colorboder, fontWeight: FontWeight.w700))
            ),
            value: value,
            groupValue: radio,
            onChanged: (value) => onChangeValue(),
          ),
        ));
  }
}
