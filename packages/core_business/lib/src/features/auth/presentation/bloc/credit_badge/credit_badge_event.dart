import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/user_entity.dart';

part 'credit_badge_event.freezed.dart';

@freezed
abstract class CreditBadgeEvent with _$CreditBadgeEvent {
  const factory CreditBadgeEvent.started() = _Started;
  const factory CreditBadgeEvent.profileUpdated(UserEntity user) = _ProfileUpdated;
}
