import 'package:hive_flutter/hive_flutter.dart';

class DBService {
  Box box;

  DBService({
    required this.box,
  });

  void saveColor(int index) {
    box.put('color', index);
  }

  void saveSize(double value) {
    box.put('size', value);
  }

  void saveIcon(int index) {
    box.put('icon', index);
  }

}
