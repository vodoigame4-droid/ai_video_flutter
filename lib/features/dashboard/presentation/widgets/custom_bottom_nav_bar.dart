import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../i18n/strings.g.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;
  final VoidCallback onCreatePressed;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
    required this.onCreatePressed,
  });

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return SizedBox(
      width: 300,
      height: 100, // Elevated button extends above the 64px bar
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Main Nav Bar (Background & tabs)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 64,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(100)),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 7.5, sigmaY: 7.5),
                child: Container(
                  height: 64,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.15),
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                    border: Border.all(
                      color: const Color(0xFF878787),
                      width: 1,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Home Tab
                      _buildTabItem(
                        context,
                        index: 0,
                        iconAsset: 'assets/images/nav_home.svg',
                        label: t.dashboard.home,
                      ),
                      // Spacer to yield room for elevated central button
                      const SizedBox(width: 80),
                      // Profile/User Tab
                      _buildTabItem(
                        context,
                        index: 1,
                        iconAsset: 'assets/images/nav_user.svg',
                        label: t.dashboard.user,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Elevated central button "Create Video"
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: onCreatePressed,
                  child: Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryGradient,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0x3306F294), // rgba(6, 242, 148, 0.2)
                        width: 3,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withValues(alpha: 0.3),
                          blurRadius: 15,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                      'assets/images/ai_nav_icon.svg',
                      width: 40,
                      height: 40,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                // Gradient Text Label
                ShaderMask(
                  shaderCallback: (bounds) =>
                      AppColors.primaryGradient.createShader(bounds),
                  child: Text(
                    t.dashboard.createVideo,
                    style: context.appTheme.navLabelCreateStyle,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem(
    BuildContext context, {
    required int index,
    required String iconAsset,
    required String label,
  }) {
    final isActive = selectedIndex == index;

    return InkWell(
      onTap: () => onTabSelected(index),
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              iconAsset,
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                isActive ? Colors.white : const Color(0xFF979797),
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: isActive
                  ? context.appTheme.navLabelActiveStyle
                  : context.appTheme.navLabelInactiveStyle,
            ),
          ],
        ),
      ),
    );
  }
}
