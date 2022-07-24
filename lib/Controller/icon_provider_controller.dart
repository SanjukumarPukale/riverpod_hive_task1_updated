import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_hive_task1_updated/Controller/db_controller.dart';
import 'package:riverpod_hive_task1_updated/locator.dart';
import 'package:riverpod_hive_task1_updated/model/icon_model.dart';


final ip = IconModel(
  iconVal: locator.get<DBService>().getIconModel().iconVal,
  colorVal: locator.get<DBService>().getIconModel().colorVal,
  sliderVal: locator.get<DBService>().getIconModel().sliderVal,
);

class IconModelNotifier extends StateNotifier<IconModel> {
  IconModelNotifier() : super(ip);

  void colorSelected(int colorVal) {
    state = state.copyWith(colorVal: colorVal);
    locator.get<DBService>().saveIconModel(state);
  }

  void sliderChanged(double sliderVal) {
     state = state.copyWith(sliderVal: sliderVal);
    locator.get<DBService>().saveIconModel(state);
  }

  void iconSelected(int iconVal) {
    state = state.copyWith(iconVal: iconVal);
    locator.get<DBService>().saveIconModel(state);
  }
}

