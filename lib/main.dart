// ignore_for_file: unnecessary_import, non_constant_identifier_names

import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/model/data_hive.dart';
import 'package:todolist/model/groupmodel.dart';
import 'package:todolist/model/taskmodel.dart';
import 'package:todolist/screens/login_page.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:todolist/notification/notifi_servicecopy.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:hive_flutter/hive_flutter.dart';
//import 'package:flutter_background_servi
//ce_android/flutter_background_service_android.dart';

late List<dynamic> dynamicList;
List<GROUP_ToDo> savedGROUP_todo = [];
List<GROUP_ToDo> base_data_group = [
  GROUP_ToDo(
      id: '01',
      Group_Text: 'Ngày của tôi',
      const_gr: true,
      todoList: [],
      mark_done: false,
      mark_doneimage: false,
      mauchutaskpage: [255, 255, 255, 255],
      maunentaskpage: [255, 0, 0, 0],
      mausettingtaskpage: [0, 0, 0, 0],
      nightandday: true,
      phottosettingtakspage: ''),
  GROUP_ToDo(
      id: '02',
      Group_Text: 'Quan trọng',
      const_gr: true,
      todoList: [],
      mark_done: false,
      mark_doneimage: false,
      mauchutaskpage: [255, 255, 255, 255],
      maunentaskpage: [255, 0, 0, 0],
      mausettingtaskpage: [0, 0, 0, 0],
      nightandday: true,
      phottosettingtakspage: ''),
  GROUP_ToDo(
      id: '03',
      Group_Text: 'Đã lập kế hoạch',
      const_gr: true,
      todoList: [],
      mark_done: false,
      mark_doneimage: false,
      mauchutaskpage: [255, 255, 255, 255],
      maunentaskpage: [255, 0, 0, 0],
      mausettingtaskpage: [0, 0, 0, 0],
      nightandday: true,
      phottosettingtakspage: ''),
  GROUP_ToDo(
      id: '04',
      Group_Text: 'Đã giao cho tôi',
      const_gr: true,
      todoList: [],
      mark_done: false,
      mark_doneimage: false,
      mauchutaskpage: [255, 255, 255, 255],
      maunentaskpage: [255, 0, 0, 0],
      mausettingtaskpage: [0, 0, 0, 0],
      nightandday: true,
      phottosettingtakspage: ''),
  GROUP_ToDo(
      id: '05',
      Group_Text: 'Việc với các đặc điểm đặc biệt',
      const_gr: true,
      todoList: [],
      mark_done: false,
      mark_doneimage: false,
      mauchutaskpage: [255, 255, 255, 255],
      maunentaskpage: [255, 0, 0, 0],
      mausettingtaskpage: [0, 0, 0, 0],
      nightandday: true,
      phottosettingtakspage: ''),
  GROUP_ToDo(
      id: '06',
      Group_Text: 'Tác vụ',
      const_gr: true,
      todoList: [],
      mark_done: false,
      mark_doneimage: false,
      mauchutaskpage: [255, 255, 255, 255],
      maunentaskpage: [255, 0, 0, 0],
      mausettingtaskpage: [0, 0, 0, 0],
      nightandday: true,
      phottosettingtakspage: '')
];

Future<void> initializeService() async {
  final service = FlutterBackgroundService();
  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'my_foreground', // id
    'MY FOREGROUND SERVICE', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.low, // importance must be at low or higher level
  );

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  if (Platform.isIOS || Platform.isAndroid) {
    await flutterLocalNotificationsPlugin.initialize(
      const InitializationSettings(
        iOS: DarwinInitializationSettings(),
        android: AndroidInitializationSettings('ic_bg_service_small'),
      ),
    );
  }

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await service.configure(
    androidConfiguration: AndroidConfiguration(
      // this will be executed when app is in foreground or background in separated isolate
      onStart: onStart,

      // auto start service
      autoStart: true,
      isForegroundMode: true,

      notificationChannelId: 'my_foreground',
      initialNotificationTitle: 'AWESOME SERVICE',
      initialNotificationContent: 'Initializing',
      foregroundServiceNotificationId: 888,
    ),
    iosConfiguration: IosConfiguration(
      autoStart: true,
      onForeground: onStart,
      onBackground: onIosBackground,
    ),
  );

  service.startService();
}

@pragma('vm:entry-point')
Future<bool> onIosBackground(ServiceInstance service) async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  //onStart;
  return true;
}

@pragma('vm:entry-point')
void onStart(ServiceInstance service) async {
  DartPluginRegistrant.ensureInitialized();

  if (service is AndroidServiceInstance) {
    service.on('setAsForeground').listen((event) {
      service.setAsForegroundService();
    });

    service.on('setAsBackground').listen((event) {
      service.setAsBackgroundService();
    });
  }

  service.on('stopService').listen((event) {
    service.stopSelf();
  });

  // bring to foreground
  Timer.periodic(const Duration(seconds: 1), (timer) async {
    if (TimeOfDay.now() == const TimeOfDay(hour: 0, minute: 0)) {
      for (int i = 0; i < savedGROUP_todo.length; i++) {
        for (int j = 0; j < savedGROUP_todo[i].todoList.length; j++) {
          if (savedGROUP_todo[i].todoList[j].repeat == 'Daily') {
            savedGROUP_todo[i]
                .todoList[j]
                .Datetask!
                .add(const Duration(days: 1));
          }
          if (savedGROUP_todo[i].todoList[j].repeat == 'Weekly') {
            savedGROUP_todo[i]
                .todoList[j]
                .Datetask!
                .add(const Duration(days: 7));
          }
          if (savedGROUP_todo[i].todoList[j].repeat == 'Monthly') {
            DateTime? tam = savedGROUP_todo[i].todoList[j].Datetask;
            DateTime futuremoment = DateTime(tam!.year, tam.month + 1, tam.day,
                tam.hour, tam.minute, tam.second, tam.millisecond);
            savedGROUP_todo[i].todoList[j].Datetask = futuremoment;
          }
        }
      }

      for (int i = 0; i < savedGROUP_todo[0].todoList.length; i++) {
        ToDo tam = savedGROUP_todo[0].todoList[i];
        if ((tam.Datetask!.day.toString() == DateTime.now().day.toString() &&
            (tam.Datetask!.month.toString() ==
                    DateTime.now().month.toString() &&
                (tam.Datetask!.year.toString() ==
                    DateTime.now().year.toString())))) {
          NotificationService().scheduleNotification(
              id: savedGROUP_todo[0].todoList[i].id!,
              title:
                  'New task: ${savedGROUP_todo[0].todoList[i].TitleTask!} - ${savedGROUP_todo[0].todoList[i].Description!}',
              body:
                  'From ${DateFormat('hh:mm a').format(savedGROUP_todo[0].todoList[i].startTimetask as DateTime)} To ${DateFormat('hh:mm a').format(savedGROUP_todo[0].todoList[i].endTimetask as DateTime)}\nToday - ${DateFormat('EEE, MMM d').format(savedGROUP_todo[0].todoList[i].Datetask as DateTime)}',
              scheduledNotificationDateTime: DateTime(
                  tam.Datetask!.year,
                  tam.Datetask!.month,
                  tam.Datetask!.day,
                  tam.startTimetask!.hour,
                  tam.startTimetask!.minute));

          NotificationService().scheduleNotification(
              id: savedGROUP_todo[0].todoList[i].id! + 100,
              title: 'Endtask: ${savedGROUP_todo[0].todoList[i].TitleTask!}',
              body:
                  'From ${DateFormat('hh:mm a').format(savedGROUP_todo[0].todoList[i].startTimetask as DateTime)} To ${DateFormat('hh:mm a').format(savedGROUP_todo[0].todoList[i].endTimetask as DateTime)}\nToday - ${DateFormat('EEE, MMM d').format(savedGROUP_todo[0].todoList[i].Datetask as DateTime)}',
              scheduledNotificationDateTime: DateTime(
                  tam.Datetask!.year,
                  tam.Datetask!.month,
                  tam.Datetask!.day,
                  tam.endTimetask!.hour,
                  tam.endTimetask!.minute));
        }
      }
    }

    int? datanotification;
    final deviceInfo = DeviceInfoPlugin();
    String? device;
    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      device = androidInfo.model;
    }
    if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      device = iosInfo.model;
    }
    service.invoke(
      'update',
      {
        "current_date": DateTime.now().toIso8601String(),
        "device": device,
        "datanotification": datanotification,
      },
    );
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  tz.initializeTimeZones();
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(GROUPToDoAdapter());
  Hive.registerAdapter(ToDoAdapter());
  Hive.registerAdapter(hivedataAdapter());
  await Hive.initFlutter();
  await Hive.openBox('leuleuleu');
  await initializeService();

  runApp(MaterialApp(
    home: ProviderScope(
      child: MyApp(),
    ),
  ));
  WidgetsBinding.instance.addObserver(MyAppLifecycleObserver());
}

class MyAppLifecycleObserver extends WidgetsBindingObserver {
  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.inactive ||
        state == AppLifecycleState.detached) {
      await Hive.openBox('leuleuleu');
      final box = Hive.box('leuleuleu');
      await box.clear();
      await box.put('mylistdatabase', savedGROUP_todo);
//print(box.get('hive_data')[0].Group_Text);
      await box.compact();
      await box.close();
      await Hive.close();
    }
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => MyAppstate();
}

class MyAppstate extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    var box = Hive.box('leuleuleu');
    if (box.isEmpty == true) {
      box.put('mylistdatabase', base_data_group);
    }
    dynamicList = box.get('mylistdatabase');
    for (var item in dynamicList) {
      if (item is GROUP_ToDo) {
        savedGROUP_todo.add(item);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Demo Settings',
        home: StreamBuilder<Map<String, dynamic>?>(
          stream: FlutterBackgroundService().on('update'),
          builder: (context, snapshot) {
            /*if (!snapshot.hasData) {
              return const LoginPagewaiting();
            }*/
//final data = snapshot.data!;
//String? device = data["device"];
//DateTime? date = DateTime.tryParse(data["current_date"]);
//String? Datanotification = data["datanotification"];
            return LoginPage();
          },
        ));
  }

  @override
  void dispose() {
    final box = Hive.box('leuleuleu');
    box.clear();
    box.put('hive_data', hive_data(mylistdatabase: savedGROUP_todo));
    box.compact();
    box.close();
    Hive.close();
    WidgetsBinding.instance.removeObserver(MyAppLifecycleObserver());
    super.dispose();
  }
}
