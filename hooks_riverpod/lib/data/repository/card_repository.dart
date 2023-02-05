import 'package:new_project/data/models/serial.dart';

abstract class CardRepository {
  const CardRepository();

  Future<List<Serial>> loadSerialToCard();

  Future<void> saveSerialToCard(Serial serial);
}

class ConstCardRepository extends CardRepository {
  ConstCardRepository();

  static List<Serial> _allSerialInCard = [];

  @override
  Future<List<Serial>> loadSerialToCard() async {
    return _allSerialInCard;
  }

  @override
  Future<void> saveSerialToCard(Serial serial) async {
    _allSerialInCard.add(serial);
    return;
  }
}
