import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_project/data/models/serial.dart';
import 'package:new_project/data/repository/serial_repository.dart';

class SerialNotifier extends StateNotifier<List<Serial>> {
  final SerialRepository _serialRepository;

  SerialNotifier(this._serialRepository) : super([]) {
    _init();
  }

  void _init() async {
    state = await _serialRepository.loadSerial();
  }
}
