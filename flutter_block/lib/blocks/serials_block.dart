import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../actions/actions.dart';
import '../data/models/state/serials_state.dart';
import '../data/repository/serial_repository.dart';

class SerialsBloc extends Bloc<Action, SerialsState> {
  final SerialRepository _serialsRepository;

  SerialsBloc(this._serialsRepository) : super(const SerialsState());

  Stream<SerialsState> mapEventToState(Action action) async* {
    print('1');
    if (action is SerialsLoadedAction) {
      try {
        print('2');
        final list = await _serialsRepository.loadSerial();
        yield state.copyWith(serials: list, isLoading: false);
      } on Exception {
        yield state.copyWith(serials: [], isLoading: false);
      }
    }
    // } else if (action is UpdateSerialAction) {
    //   _serialsRepository.saveSerial(action.updatedSerial);
    //   final list = state.serials
    //       .map((speaker) => speaker.id == action.updatedSerial.id
    //           ? action.updatedSerial
    //           : speaker)
    //       .toList();
    //   yield state.copyWith(serials: list);
    // }
  }
}
