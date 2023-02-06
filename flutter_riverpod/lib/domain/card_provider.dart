import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_project/domain/card_notifier.dart';

import '../data/models/serial.dart';

final cardProvider =
    StateNotifierProvider<CardNotifier, List<Serial>>((_) => CardNotifier());
