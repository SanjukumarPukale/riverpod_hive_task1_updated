import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_hive_task1_updated/Controller/db_controller.dart';
import 'package:riverpod_hive_task1_updated/locator.dart';

// Box box = Hive.box('iconBox');

// final colorStateProvider = StateProvider<int>((ref) => box.get('color') ?? 0);
// final sizeStateProvider = StateProvider<double>((ref) => box.get('size') ?? 100.0);
// final iconSelectProvider = StateProvider<int>((ref) => box.get('icon') ?? 0 );

@immutable
class IconProvider {
  final int iconIndex;
  final int colorIndex;
  final double sliderVal;

  const IconProvider(
      {required this.iconIndex,
      required this.colorIndex,
      required this.sliderVal});

  IconProvider copyWith({int? iconIndex, int? colorIndex, double? sliderVal}) {
    return IconProvider(
      iconIndex: iconIndex ?? this.iconIndex,
      colorIndex: colorIndex ?? this.colorIndex,
      sliderVal: sliderVal ?? this.sliderVal,
    );
  }
}

final ip = IconProvider(
  iconIndex: locator.get<DBService>().getIcon(),
  colorIndex: locator.get<DBService>().getColor(),
  sliderVal: locator.get<DBService>().getSize(),
);

class IconProviderNotifier extends StateNotifier<IconProvider> {
  IconProviderNotifier() : super(ip);

  void colorSelected(int colorIndex) {
    locator.get<DBService>().saveColor(colorIndex);
    state = state.copyWith(colorIndex: colorIndex);
  }

  void sliderChanged(double sliderVal) {
    locator.get<DBService>().saveSize(sliderVal);
    state = state.copyWith(sliderVal: sliderVal);
  }

  void iconSelected(int iconIndex) {
    locator.get<DBService>().saveIcon(iconIndex);
    state = state.copyWith(iconIndex: iconIndex);
  }
}

