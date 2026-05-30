import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_event.freezed.dart';

@freezed
abstract class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.init() = _Init;
  const factory ProfileEvent.changeSubTab(int subTabIndex) = _ChangeSubTab;
  const factory ProfileEvent.deleteVideo(String id) = _DeleteVideo;
  const factory ProfileEvent.tickProgress() = _TickProgress;
  const factory ProfileEvent.watchLikedTemplates() = _WatchLikedTemplates;
}
