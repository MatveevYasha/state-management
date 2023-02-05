import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:new_project/data/models/serial.dart';
import 'package:new_project/data/repository/serial_repository.dart';
import 'package:new_project/domain/serial_notifier.dart';

final serialsProvider = StateNotifierProvider<SerialNotifier, List<Serial>>(
    (_) => SerialNotifier(const ConstSerialsRepository()));

// final serialsProvider = StateNotifierProvider<SerialNotifier, List<Serial>>(
//     (_) => SerialNotifier(const ConstSerialsRepository()));

// final loadingProvider =
//     Provider((ref) => ref.watch(serialsProvider).isNotEmpty);

// final cardProvider = StateNotifierProvider<CardNotifier, List<Serial>>(
//     (_) => CardNotifier(ConstCardRepository(), const ConstSerialsRepository()));

