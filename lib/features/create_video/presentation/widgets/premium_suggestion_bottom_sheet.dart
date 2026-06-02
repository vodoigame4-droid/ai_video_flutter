import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/gradient_button.dart';
import '../../../../i18n/strings.g.dart';
import '../../../premium/presentation/pages/iap_page.dart';

class PremiumSuggestionBottomSheet extends StatelessWidget {
  const PremiumSuggestionBottomSheet({super.key});

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const PremiumSuggestionBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return Container(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 10,
        bottom: MediaQuery.of(context).padding.bottom + 24,
      ),
      decoration: BoxDecoration(
        color: context.colorScheme.surface.withValues(alpha: 0.95),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Top drag handle
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              const SizedBox(height: 24),

              // Gold crown container with glassmorphic style
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary.withValues(alpha: 0.1),
                  border: Border.all(
                    color: const Color(0xFFFFD700).withValues(alpha: 0.5),
                    width: 2,
                  ),
                ),
                child: const Center(
                  child: Icon(
                    Icons.workspace_premium_rounded,
                    color: Color(0xFFFFD700), // Gold Crown Icon
                    size: 38,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Title
              Text(
                t.create.limit_dialog_title,
                style: context.textTheme.titleLarge?.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),

              // Description
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  t.create.limit_dialog_desc,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: AppColors.subText,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 32),

              // Action Buttons
              GradientButton(
                width: double.infinity,
                label: t.create.limit_dialog_btn,
                onPressed: () {
                  context.pop(); // Close bottom sheet
                  context.push(IapPage.path); // Redirect to VIP purchase
                },
              ),
              const SizedBox(height: 12),
              
              TextButton(
                onPressed: () => context.pop(),
                style: TextButton.styleFrom(
                  minimumSize: const Size(double.infinity, 48),
                ),
                child: Text(
                  t.create.limit_dialog_cancel,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: AppColors.subText,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
