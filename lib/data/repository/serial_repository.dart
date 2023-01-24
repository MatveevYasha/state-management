import 'package:new_project/data/models/serial.dart';

abstract class SerialRepository {
  const SerialRepository();

  Future<List<Serial>> loadSerial();

  Future<void> saveSerial(Serial serial);
}

class ConstSerialsRepository extends SerialRepository {
  const ConstSerialsRepository();

  static const List<Serial> _allSerial = [
    Serial(id: 0, title: 'Fullmetal Alchemist: Brotherfood', price: 120),
    Serial(id: 1, title: 'Cowboy Bebop', price: 324),
    Serial(id: 2, title: 'One Piece', price: 123),
    Serial(id: 3, title: 'Monster', price: 342),
    Serial(id: 4, title: 'Hajime no Ippo', price: 231),
    Serial(id: 5, title: 'Mob Psycho 100', price: 111),
    Serial(id: 6, title: 'Hunter x Hunter', price: 234),
    Serial(id: 7, title: 'Neon Genesis Evangelion', price: 344),
    Serial(id: 8, title: 'FLCL', price: 453),
    Serial(id: 9, title: 'Baccano', price: 564),
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
