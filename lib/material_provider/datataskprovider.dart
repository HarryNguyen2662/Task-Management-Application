// ignore: depend_on_referenced_packages
import 'package:riverpod/riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../screens/task_page.dart';

final datataskProvider = StateProvider<task_homepageState>((ref) {
  return task_homepageState();
});
