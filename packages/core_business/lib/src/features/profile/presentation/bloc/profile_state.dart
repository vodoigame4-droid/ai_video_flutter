import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:core_business/src/core/resources/resource.dart';
import 'package:core_business/src/features/media/domain/entities/media_entities.dart';
import '../../domain/entities/user_video_entity.dart';

part 'profile_state.freezed.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;
  const factory ProfileState.loading() = _Loading;
  const factory ProfileState.ready({
    required int subTabIndex,
    required Resource<List<UserVideoEntity>> videosState,
    required List<ThemeEntity> likedTemplates,
  }) = _Ready;
}
