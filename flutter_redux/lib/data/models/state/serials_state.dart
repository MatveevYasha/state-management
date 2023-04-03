import 'package:new_project/data/models/serial.dart';

class SerialsState {
  final List<Serial> serials;
  final List<Serial> cards;
  final bool isLoading;

  const SerialsState({
    this.serials = const [],
    this.cards = const [],
    this.isLoading = true,
  });

  SerialsState copyWith({
    List<Serial>? serials,
    List<Serial>? cards,
    bool? isLoading,
  }) {
    return SerialsState(
      serials: serials ?? this.serials,
      cards: cards ?? this.cards,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SerialsState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          serials == other.serials &&
          cards == other.cards;

  @override
  int get hashCode => serials.hashCode ^ isLoading.hashCode ^ cards.hashCode;

  @override
  String toString() =>
      'SerialsState{serials: $serials, cards: $cards, isLoading: $isLoading}';
}
