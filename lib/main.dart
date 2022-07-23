import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod_hive_task1_updated/locator.dart';
import 'package:riverpod_hive_task1_updated/provider/providers.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('iconBox');
  setup();
  runApp(
   const ProviderScope(
      child: MyApp(),
    ),
  ); // 1
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      title: 'Riverpod Hive demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
    );
  }
}
