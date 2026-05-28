import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/gradient_border_container.dart';
import '../../../../i18n/strings.g.dart';

class PremiumBannerWidget extends StatelessWidget {
  final VoidCallback onTap;

  const PremiumBannerWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return Container(
      height: 148,
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        border: Border.all(
          color: const Color(0xFF1C362B), // --dark-green-border
          width: 1,
        ),
        image: const DecorationImage(
          image: AssetImage('assets/images/premium_banner.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          // Black Overlay
          Positioned.fill(
            child: Container(color: Colors.black.withValues(alpha: 0.4)),
          ),

          // Centered Column Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Title
                Text(
                  t.profile.upgradeTitle,
                  style:
                      context.textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ) ??
                      const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),

                // Subtitle
                Text(
                  t.profile.upgradeSubtitle,
                  style:
                      context.textTheme.bodySmall?.copyWith(
                        color: const Color(0xFFB1B1B1),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ) ??
                      const TextStyle(
                        color: Color(0xFFB1B1B1),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),

                // Go Premium Button with gradient border, and flipped arrow svg
                GradientBorderContainer(
                  width: 176,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(100),
                  ),
                  borderWidth: 1.0,
                  backgroundColor: Colors.white.withValues(alpha: 0.15),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: onTap,
                      borderRadius: const BorderRadius.all(Radius.circular(100)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 8,
                          top: 6,
                          bottom: 6,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                t.profile.goPremium,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Ink(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                gradient: context.appTheme.primaryGradient,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  'assets/icons/ic_arrow_right.svg',
                                  width: 16,
                                  height: 16,
                                  colorFilter: const ColorFilter.mode(
                                    Colors.white,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
