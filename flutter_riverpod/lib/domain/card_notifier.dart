import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/models/serial.dart';

class CardNotifier extends StateNotifier<List<Serial>> {
  CardNotifier() : super(<Serial>[]);

  void addSerialToCard(Serial unit) {
    state = [...state, unit];
  }

  void deleteOneSerialToCard(int index) {
    state = state.where((element) => state.indexOf(element) != index).toList();

// баг при удалении одинаковых карточек
  }

  void deleteAllSerialToCard() {
    state = [];
  }
}
