import 'package:new_project/data/model.dart';

class Interface {
  static final id = serial.map((e) => e.id).toList();
  static final title = serial.map((e) => e.title).toList();
  static final price = serial.map((e) => e.price).toList();
}
