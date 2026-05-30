import 'package:freezed_annotation/freezed_annotation.dart';

part 'generating_state.freezed.dart';

@freezed
abstract class GeneratingState with _$GeneratingState {
  const factory GeneratingState.initial() = _Initial;
  const factory GeneratingState.generating({
    required double progress,
    required String title,
    required String? imageUrl,
  }) = _Generating;
  const factory GeneratingState.success({
    required String videoId,
    required String title,
    required String? imageUrl,
    required String videoUrl,
    required String createdAt,
  }) = _Success;
  const factory GeneratingState.notifiedAndExited({required bool isPermissionGranted}) = _NotifiedAndExited;
}
