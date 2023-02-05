import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_project/data/models/serial.dart';
import 'package:new_project/data/repository/serial_repository.dart';

class SerialNotifier extends StateNotifier<List<Serial>> {
  final SerialRepository _serialRepository;
  List<Serial> cards = [];

  SerialNotifier(this._serialRepository) : super([]) {
    _init();
  }

  void _init() async {
    state = await _serialRepository.loadSerial();
  }

  void addSerialToCard(unit) {
    state.map((e) => e.id == unit.id ? unit : e.id).toList();
    cards.add(unit);
  }

  void deleteOneSerialToCard(int index) {
    cards.removeAt(index);
  }

  void deleteAllSerialToCard() {
    cards.clear();
  }
}
