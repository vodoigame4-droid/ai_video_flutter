import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_event.freezed.dart';

@freezed
abstract class DashboardEvent with _$DashboardEvent {
  const factory DashboardEvent.init() = _Init;
  const factory DashboardEvent.changeTab(int index) = _ChangeTab;
}
