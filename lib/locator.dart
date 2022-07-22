import 'package:get_it/get_it.dart';
import 'package:riverpod_hive_task1_updated/screens/colo_icon_list.dart';
import 'package:riverpod_hive_task1_updated/services/provider_services.dart';

final locator = GetIt.instance;

void setup() {
  locator.registerSingleton<ProviderService>(ProviderService());
  locator.registerSingleton<ColorIcon>(ColorIcon());
}