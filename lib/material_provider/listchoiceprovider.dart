import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:riverpod/riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final starttimeProvider = StateProvider<TimeOfDay>((ref) {
  return TimeOfDay.now();
});

final endtimeProvider = StateProvider<TimeOfDay>((ref) {
  return TimeOfDay.now();
});
