import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_hive_task1_updated/screens/home_page.dart';
import 'package:riverpod_hive_task1_updated/screens/setting_page.dart';
  
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



