import 'package:new_project/data/models/serial.dart';

abstract class SerialRepository {
  const SerialRepository();

  Future<List<Serial>> loadSerial();

  Future<void> saveSerial(Serial serial);
}

class ConstSerialsRepository extends SerialRepository {
  const ConstSerialsRepository();

  static const List<Serial> _allSerial = [
    Serial(id: 0, title: 'Suzumiya Haruhi no Yûutsu', price: 120),
    Serial(id: 1, title: 'Aa! Megamisama!', price: 324),
    Serial(id: 2, title: 'Erufen rito', price: 123),
    Serial(id: 3, title: 'Bleach', price: 342),
    Serial(id: 4, title: 'Golden Boy', price: 231),
    Serial(id: 5, title: 'FLCL', price: 111),
    Serial(id: 6, title: 'K-On!', price: 234),
    Serial(id: 7, title: 'Fullmetal Alchemist: Brotherhood', price: 344),
    Serial(id: 8, title: 'Herushingu', price: 453),
    Serial(id: 9, title: 'Lucky Star', price: 564),
  ];

  @override
  Future<List<Serial>> loadSerial() async {
    return _allSerial;
  }

  @override
  Future<void> saveSerial(Serial serial) async {
    //Here should be saving item to repository
    return;
  }
}
