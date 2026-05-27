import 'package:freezed_annotation/freezed_annotation.dart';

part 'templates_event.freezed.dart';

@freezed
abstract class TemplatesEvent with _$TemplatesEvent {
  const factory TemplatesEvent.init(String category) = _Init;
  const factory TemplatesEvent.selectCategory(String category) = _SelectCategory;
}
