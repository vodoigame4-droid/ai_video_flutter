import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:core_business/core_business.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../../i18n/strings.g.dart';
import '../utils/app_toast.dart';
import '../utils/rating_prompt_manager.dart';

Future<void> showRateAppDialog(BuildContext context) {
  final t = context.t;
  int currentRating = 5; // Default is 5 stars

  return showDialog<void>(
    context: context,
    barrierColor: AppColors.black.withValues(alpha: 0.5),
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Dialog(
              backgroundColor: AppColors.onSurface,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(24)),
                side: BorderSide(color: AppColors.secondary, width: 1.2),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Star Image at the top
                    Image.asset(
                      'assets/images/ic_rate_app.png',
                      width: 250,
                      height: 110,
                      fit: BoxFit.contain,
                    ),
                    // Title
                    Text(
                      t.rating_dialog.title,
                      style: context.textTheme.titleMedium?.copyWith(
                        color: AppColors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ) ?? const TextStyle(
                        color: AppColors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),

                    // Description
                    Text(
                      t.rating_dialog.desc,
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: AppColors.subText,
                        fontSize: 15,
                        height: 1.4,
                      ) ?? const TextStyle(
                        color: AppColors.subText,
                        fontSize: 15,
                        height: 1.4,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),

                    // 5 Stars Selector
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
                        final starIndex = index + 1;
                        final isSelected = starIndex <= currentRating;
                        
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              currentRating = starIndex;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: Icon(
                              isSelected ? Icons.star_rounded : Icons.star_outline_rounded,
                              color: isSelected 
                                  ? const Color(0xFFFFD700) 
                                  : AppColors.secondary.withValues(alpha: 0.5),
                              size: 38,
                            ),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 28),

                    // Support Us Button (Gradient)
                     InkWell(
                      onTap: () async {
                        // Dismiss dialog first
                        Navigator.pop(context);

                        // Save persistent flag so they aren't prompted again in background
                        await RatingPromptManager.markAsRated();

                        if (Platform.isIOS) {
                          // iOS: Always open App Store, regardless of selected stars (avoid gating review violation)
                          const String iosAppId = '6470000000'; // App Store ID placeholder
                          final iosUri = Uri.parse('https://apps.apple.com/app/id$iosAppId?action=write-review');
                          try {
                            if (await canLaunchUrl(iosUri)) {
                              await launchUrl(iosUri, mode: LaunchMode.externalApplication);
                            } else {
                              LogUtils.e('RateAppDialog: Could not launch iOS App Store URL: $iosUri');
                            }
                          } catch (e, stack) {
                            LogUtils.e('RateAppDialog: Error launching iOS App Store', error: e, stackTrace: stack);
                          }
                        } else if (Platform.isAndroid) {
                          // Android: If 4 or 5 stars -> open Play Store. If 1-3 stars -> show thank you toast
                          if (currentRating >= 4) {
                            try {
                              final packageInfo = await PackageInfo.fromPlatform();
                              final packageName = packageInfo.packageName;
                              final marketUri = Uri.parse('market://details?id=$packageName');
                              final webUri = Uri.parse('https://play.google.com/store/apps/details?id=$packageName');

                              if (await canLaunchUrl(marketUri)) {
                                await launchUrl(marketUri, mode: LaunchMode.externalApplication);
                              } else if (await canLaunchUrl(webUri)) {
                                await launchUrl(webUri, mode: LaunchMode.externalApplication);
                              } else {
                                LogUtils.e('RateAppDialog: Could not launch Android Play Store URLs');
                              }
                            } catch (e, stack) {
                              LogUtils.e('RateAppDialog: Error launching Android Play Store', error: e, stackTrace: stack);
                            }
                          } else {
                            // Show thank-you toast for lower rating
                            AppToast.showSuccess(t.rating_dialog.success);
                          }
                        }
                      },
                      borderRadius: const BorderRadius.all(Radius.circular(100)),
                      child: Container(
                        height: 52,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          gradient: AppColors.primaryGradient,
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/ic_support_us.svg',
                              width: 22,
                              height: 22,
                              colorFilter: const ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              t.rating_dialog.support_us,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Maybe Later Button
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.access_time_rounded,
                              color: AppColors.subText.withValues(alpha: 0.8),
                              size: 16,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              t.rating_dialog.maybe_later,
                              style: TextStyle(
                                color: AppColors.subText.withValues(alpha: 0.8),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}
