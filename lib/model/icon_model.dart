import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'icon_model.g.dart';

@HiveType(typeId: 0) @immutable
class IconModel {

  @HiveField(0)
  final int iconVal;

  @HiveField(1)
  final int colorVal;

  @HiveField(2)
  final double sliderVal;

  const IconModel(
      {required this.iconVal,
      required this.colorVal,
      required this.sliderVal});

  IconModel copyWith({int? iconVal, int? colorVal, double? sliderVal}) {
    return IconModel(
      iconVal: iconVal ?? this.iconVal,
      colorVal: colorVal ?? this.colorVal,
      sliderVal: sliderVal ?? this.sliderVal,
    );
  }
}