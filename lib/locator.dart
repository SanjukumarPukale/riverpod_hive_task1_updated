import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:riverpod_hive_task1_updated/screens/colo_icon_list.dart';
import 'package:riverpod_hive_task1_updated/services/db_service.dart';
import 'package:riverpod_hive_task1_updated/services/provider_services.dart';

final locator = GetIt.instance;

Box box = Hive.box('iconBox');

void setup() {
  locator.registerSingleton<ProviderService>(ProviderService());
  locator.registerSingleton<ColorIcon>(ColorIcon());
  locator.registerSingleton(DBService(box: box));
}