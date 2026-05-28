import 'package:freezed_annotation/freezed_annotation.dart';

part 'result_state.freezed.dart';

@freezed
abstract class ResultState with _$ResultState {
  const factory ResultState.initial() = _Initial;
  const factory ResultState.loading() = _Loading;
  const factory ResultState.ready({
    required String videoId,
    required String title,
    required String? imageUrl,
    required String videoUrl,
    required String createdAt,
    required bool isPlaying,
    required bool isMuted,
    required bool isBuffering,
  }) = _Ready;
  const factory ResultState.error({required String message}) = _Error;
}
