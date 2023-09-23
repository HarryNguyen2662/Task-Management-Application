// ignore: depend_on_referenced_packages
import 'package:riverpod/riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dateProvider = StateProvider<DateTime>((ref) {
  return DateTime.now();
});

final starttimeProvider = StateProvider<DateTime>((ref) {
  return DateTime.now().add(const Duration(minutes: 1));
});

final endtimeProvider = StateProvider<DateTime>((ref) {
  return DateTime.now().add(const Duration(minutes: 1));
});
