import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wiwi_havin_base_ads/wiwi_havin_base_ads.dart';

part 'iap_state.freezed.dart';

@freezed
abstract class IapState with _$IapState {
  const factory IapState.initial() = _Initial;
  
  const factory IapState.loading() = _Loading;
  
  const factory IapState.ready({
    required bool isWeeklySelected,
    required bool isVideoRevealed,
    @Default([]) List<Product> weeklyProducts,
    @Default([]) List<Product> yearlyProducts,
    @Default([]) List<Product> discountCreditProducts,
    @Default([]) List<Product> regularCreditProducts,
  }) = _Ready;
  
  const factory IapState.success({
    required String message,
    required bool isWeeklySelected,
    required bool isVideoRevealed,
    @Default([]) List<Product> weeklyProducts,
    @Default([]) List<Product> yearlyProducts,
    @Default([]) List<Product> discountCreditProducts,
    @Default([]) List<Product> regularCreditProducts,
  }) = _Success;
  
  const factory IapState.error({
    required String message,
    required bool isWeeklySelected,
    required bool isVideoRevealed,
    @Default([]) List<Product> weeklyProducts,
    @Default([]) List<Product> yearlyProducts,
    @Default([]) List<Product> discountCreditProducts,
    @Default([]) List<Product> regularCreditProducts,
  }) = _Error;
}
