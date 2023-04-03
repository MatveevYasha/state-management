import 'package:meta/meta.dart';
import 'package:new_project/data/models/serial.dart';

@immutable
class AppState {
  final bool isLoading;
  final List<Serial> serials;
  final List<Serial> card;

  const AppState({
    this.isLoading = false,
    this.serials = const [],
    this.card = const [],
  });

  factory AppState.loading() => const AppState(isLoading: true);

  AppState copyWith({
    bool? isLoading,
    List<Serial>? serials,
    List<Serial>? card,
  }) {
    return AppState(
      isLoading: isLoading ?? this.isLoading,
      serials: serials ?? this.serials,
      card: card ?? this.card,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          serials == other.serials &&
          card == other.card;

  @override
  int get hashCode => isLoading.hashCode ^ serials.hashCode ^ card.hashCode;

  @override
  String toString() {
    return 'AppState{isLoading: $isLoading, '
        'speakers: $serials, talks: $card}';
  }
}
