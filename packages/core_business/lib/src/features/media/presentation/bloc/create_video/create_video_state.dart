import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_video_state.freezed.dart';

@freezed
abstract class CreateVideoState with _$CreateVideoState {
  const factory CreateVideoState.initial() = _Initial;
  const factory CreateVideoState.loading() = _Loading;
  const factory CreateVideoState.ready({
    required int selectedTab,
    required String customPrompt,
    required int inspireMeCount,
    required List<String?> slotsPaths,
    required String quality,
    required String duration,
    required bool isGenerating,
    @Default(false) bool isSuccess,
  }) = _Ready;
  const factory CreateVideoState.error({required String message}) = _Error;
}
