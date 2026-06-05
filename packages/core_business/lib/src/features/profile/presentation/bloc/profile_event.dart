import 'dart:async';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_event.freezed.dart';

@freezed
abstract class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.init([Completer<void>? completer]) = _Init;
  const factory ProfileEvent.changeSubTab(int subTabIndex) = _ChangeSubTab;
  const factory ProfileEvent.deleteVideo(String id) = _DeleteVideo;
  const factory ProfileEvent.watchLikedTemplates() = _WatchLikedTemplates;
  const factory ProfileEvent.watchHistory() = _WatchHistory;
}
