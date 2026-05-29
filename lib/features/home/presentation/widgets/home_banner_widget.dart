import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/credit_badge_widget.dart';
import '../../../../i18n/strings.g.dart';

/// The top banner section of the HomePage.
/// Renders the background image, top status overlays, app title, PRO badge, and the user's credits.
class HomeBannerWidget extends StatelessWidget {
  const HomeBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return Stack(
      children: [
        // Banner background image
        Container(
          height: 250,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/home_banner.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Dark gradient overlay
        Container(
          height: 250,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black.withValues(alpha: 0.6),
                Colors.black.withValues(alpha: 0.1),
                Colors.black.withValues(alpha: 0.8),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        // Content over the banner
        SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                // Header Row: Title, PRO badge, and credit status
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          t.home.title,
                          style: context.textTheme.displayMedium,
                        ),
                        const SizedBox(width: 8),
                        Image.asset(
                          'assets/images/pro_badge_icon.png',
                          height: 22,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                    const CreditBadgeWidget(),
                  ],
                ),
                const SizedBox(height: 48),
                // Inner Banner Title
                Text(
                  t.home_new.welcomeToAppName,
                  style: context.appTheme.onboardingTitleStyle,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
