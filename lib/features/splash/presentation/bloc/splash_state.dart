import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.freezed.dart';

@freezed
abstract class SplashState with _$SplashState {
  const factory SplashState.initial() = _Initial;
  const factory SplashState.loading(int percent) = _Loading;
  const factory SplashState.success() = _Success;
  const factory SplashState.error({required String message}) = _Error;
}
