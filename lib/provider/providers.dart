import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_hive_task1_updated/Controller/icon_provider_controller.dart';
import 'package:riverpod_hive_task1_updated/model/icon_model.dart';
import 'package:riverpod_hive_task1_updated/view/home_page.dart';
import 'package:riverpod_hive_task1_updated/view/setting_page.dart';

// Icon Provider
final iconProvider = StateNotifierProvider<IconModelNotifier, IconModel>(
    (ref) => IconModelNotifier());

// Router Provider
  final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
          name: 'home',
          builder: (context, state) => HomePage(),
          path: '/',
        ),
        GoRoute(
          name: 'setting',
          builder: (context, state) => SettingPage(),
          path: '/setting',
        ),
      ],
      );
});



