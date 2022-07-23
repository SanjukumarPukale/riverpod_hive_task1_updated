import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:riverpod_hive_task1_updated/Controller/db_controller.dart';
import 'package:riverpod_hive_task1_updated/view/colo_icon_list.dart';

final locator = GetIt.instance;

Box box = Hive.box('iconBox');

void setup() {
  // locator.registerSingleton<ProviderService>(ProviderService());
  locator.registerSingleton<ColorIcon>(ColorIcon());
  locator.registerSingleton(DBService(box: box));
}