import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/data/models/serial.dart';

import '../actions/actions.dart';
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
  // void loadSerial() async {
   
  // }

  // _onLoadSerials(LoadSerialsAction event, Emitter<SerialsState> emit) async {
  //   try {
  //     final list = await _serialsRepository.loadSerial();
  //     emit(state.copyWith(serials: list, isLoading: true));
  //   } catch (e) {
  //     emit(state.copyWith(serials: [], isLoading: false));
  //   }
  // }

  // _onAddSerialToCard(AddSerialToCard event, Emitter<SerialsState> emit) async {
  //   emit(state.copyWith(cards: [...state.cards, state.serials[event.index]]));
  // }

  // _removeAllSerialToCard(
  //     RemoveAllSerialToCard event, Emitter<SerialsState> emit) async {
  //   emit(state.copyWith(cards: []));
  // }

  // _removeOneSerialToCard(
  //     RemoveOneSerialToCard event, Emitter<SerialsState> emit) async {
  //   emit(state.copyWith(
  //       cards: state.cards
  //           .where((element) => state.cards.indexOf(element) != event.index)
  //           .toList()));
  // }

