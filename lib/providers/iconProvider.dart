import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod_hive_task1_updated/services/provider_services.dart';

Box box = Hive.box('iconBox');

final colorStateProvider = StateProvider<int>((ref) => box.get('color') ?? 0); 
final sizeStateProvider = StateProvider<double>((ref) => box.get('size') ?? 100.0);
final iconSelectProvider = StateProvider<int>((ref) => box.get('icon') ?? 0 );