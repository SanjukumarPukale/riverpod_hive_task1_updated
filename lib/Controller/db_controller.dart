import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod_hive_task1_updated/model/icon_model.dart';

class DBService {
  Box box;

  DBService({
    required this.box,
  });

  void saveIconModel(IconModel iconModel ) {
    box.put('iconModel', iconModel);
  }

  IconModel getIconModel() {
    return box.get('iconModel') ?? IconModel(iconVal: 0, colorVal: 0, sliderVal: 100.0);
  }

}
