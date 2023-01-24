import 'package:flutter/material.dart';
import 'package:new_project/data/models/serial.dart';
import 'package:new_project/data/repository/serial_repository.dart';

class SerialNotifier with ChangeNotifier {
  late final SerialRepository _serialRepository;
  List<Serial> serials = [];
  List<Serial> cards = [];

  bool get isLoaded => serials.isNotEmpty;

  SerialNotifier(this._serialRepository) {
    _initSerials();
    _initCards();
  }

  void _initSerials() async {
    serials = await _serialRepository.loadSerial();
    notifyListeners();
  }

  void _initCards() async {
    cards = [];
    notifyListeners();
  }

  void addSerialToCard(Serial unit) {
    serials.map((e) => e.id == unit.id ? unit : e.id).toList();
    cards.add(unit);

    notifyListeners();
  }

  void deleteAllSerialToCard() {
    cards.clear();

    notifyListeners();
  }
}
