import 'package:new_project/data/models/serial.dart';

class SerialsState {
  final List<Serial> serials;
  final bool isLoading;

  const SerialsState({
    this.serials = const [],
    this.isLoading = true,
  });

  SerialsState copyWith({
    List<Serial>? serials,
    bool? isLoading,
  }) {
    return SerialsState(
      serials: serials ?? this.serials,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SerialsState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          serials == other.serials;

  @override
  int get hashCode => serials.hashCode ^ isLoading.hashCode;

  @override
  String toString() =>
      'SpeakersState{speakers: $serials, isLoading: $isLoading}';
}
