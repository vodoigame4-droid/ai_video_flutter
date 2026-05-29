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
    @Default('') String extendPrompt,
    @Default('Full HD') String extendQuality,
    @Default('5s') String extendDuration,
    @Default(3) int inspireMeCount,
    @Default(false) bool isGeneratingExtended,
    @Default(false) bool isDeleted,
  }) = _Ready;
  const factory ResultState.error({required String message}) = _Error;
}
