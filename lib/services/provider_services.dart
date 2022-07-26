import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:riverpod_hive_task1_updated/providers/iconProvider.dart';

Box box = Hive.box('iconBox');

class ProviderService {

  void selectColorIndex(int index, WidgetRef ref) {
    box.put('color', index);
    ref.read(colorStateProvider.state).state = index;
  }
  
  void changeSlider(double value, WidgetRef ref) {
    box.put('size', value);
    ref.read(sizeStateProvider.state).state = value;
  }
  
  void selectIconIndex(int index, WidgetRef ref) {
    box.put('icon', index);
    ref.read(iconSelectProvider.state).state = index;
  }

  // int colorSelect(var ref) {
  //   if((ref.read(colorStateProvider.state).state == null) && (box.get('color') != null) ){
  //     return box.get('color');
  //   } 
  //   return 0;
  // }

  // double changeSize(var ref) {
  //   if((ref.read(sizeStateProvider.state).state == null) && (box.get('size') != null) ){
  //     return box.get('size');
  //   } 
  //   return 100.0;
  // }

  // int changeIcon(var ref) {
  //   if((ref.read(iconSelectProvider.state).state == null) && (box.get('icon') != null) ){
  //     return box.get('icon');
  //   } 
  //   return 0;
  // }

}