import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/data/models/serial.dart';

import '../data/models/state/serials_state.dart';
import '../data/repository/serial_repository.dart';

class SerialsCubit extends Cubit<SerialsState> {
  final SerialRepository _serialsRepository;
  SerialsCubit(this._serialsRepository) : super(SerialsState());

  void loadSerial() async {
    final list = await _serialsRepository.loadSerial();
    emit(SerialsState(serials: list));
  }

  void addSerialToCard(int index) {
    emit(SerialsState(
        serials: state.serials, cards: [...state.cards, state.serials[index]]));
  }

  void removeAllSerialToCard() {
    emit(SerialsState(serials: state.serials, cards: []));
  }

  void removeOneSerialToCard(int index) {
    emit(SerialsState(
        serials: state.serials,
        cards: state.cards
            .where((element) => state.cards.indexOf(element) != index)
            .toList()));
  }
}
