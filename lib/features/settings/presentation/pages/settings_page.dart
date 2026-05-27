import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/injection/injection_container.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../i18n/strings.g.dart';
import '../../../home/presentation/widgets/video_settings_sheet.dart';
import '../../../profile/presentation/widgets/premium_banner_widget.dart';
import '../bloc/settings_bloc.dart';
import '../bloc/settings_event.dart';
import '../bloc/settings_state.dart';
import 'language_page.dart';

class SettingsPage extends StatelessWidget {
  static const String path = '/settings';
  static const String name = 'settings';

  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SettingsBloc>()..add(const SettingsEvent.init()),
      child: const SettingsView(),
    );
  }
}

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  void _showPremiumSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => const VideoSettingsSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // Header Row matching LanguagePage exactly
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back Button
                  ClipOval(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                      child: Material(
                        color: Colors.white.withValues(alpha: 0.1),
                        shape: const CircleBorder(),
                        child: InkWell(
                          onTap: () => context.pop(),
                          child: const SizedBox(
                            width: 36,
                            height: 36,
                            child: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Title (matching size 24, font-semibold from Figma)
                  Text(
                    t.settings.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  // Spacer to balance
                  const SizedBox(width: 36),
                ],
              ),

              const SizedBox(height: 30),

              // Settings Items List
              Expanded(
                child: BlocBuilder<SettingsBloc, SettingsState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () =>
                          const Center(child: CircularProgressIndicator()),
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      ready: (currentLocale) {
                        final localeName = _getLocaleName(t, currentLocale);

                        return ListView(
                          physics: const BouncingScrollPhysics(),
                          children: [
                            // 1. Premium Upgrade Banner
                            PremiumBannerWidget(
                              onTap: () => _showPremiumSheet(context),
                            ),
                            const SizedBox(height: 12),

                            // 2. My Credits
                            _buildSettingsItem(
                              icon: Image.asset(
                                Assets.icons.icStarVip.path,
                                width: 22,
                                height: 22,
                              ),
                              title: t.settings.myCredits,
                              trailingText: '300',
                              onTap: () => _showPremiumSheet(context),
                            ),

                            // 3. Language
                            _buildSettingsItem(
                              icon: Icons.language_rounded,
                              title: t.settings.language,
                              trailingText: localeName,
                              onTap: () => context.push(LanguagePage.path),
                            ),

                            // 4. Contact Us
                            _buildSettingsItem(
                              icon: Icons.mail_outline_rounded,
                              title: t.settings.contactUs,
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(t.settings.contactUs),
                                  ),
                                );
                              },
                            ),

                            // 5. Rate App
                            _buildSettingsItem(
                              icon: Icons.star_outline_rounded,
                              title: t.settings.rateApp,
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(t.settings.rateApp),
                                  ),
                                );
                              },
                            ),

                            // 6. Terms of Use
                            _buildSettingsItem(
                              icon: Icons.description_outlined,
                              title: t.settings.termsOfUse,
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(t.settings.termsOfUse),
                                  ),
                                );
                              },
                            ),

                            // 7. Privacy Policy
                            _buildSettingsItem(
                              icon: Icons.security_outlined,
                              title: t.settings.privacyPolicy,
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(t.settings.privacyPolicy),
                                  ),
                                );
                              },
                            ),

                            // 8. User Code
                            _buildSettingsItem(
                              icon: Icons.qr_code_rounded,
                              title: t.settings.userCode,
                              showChevron: false,
                              trailingWidget: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                    'EDFO1R0Y2XLBJ1I2',
                                    style: TextStyle(
                                      color: AppColors.primary,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Icon(
                                    Icons.copy_rounded,
                                    color: AppColors.primary.withValues(alpha: 0.8),
                                    size: 18,
                                  ),
                                ],
                              ),
                              onTap: () {
                                Clipboard.setData(
                                  const ClipboardData(
                                    text: 'EDFO1R0Y2XLBJ1I2',
                                  ),
                                ).then((_) {
                                  if (context.mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(t.settings.copied),
                                        duration: const Duration(seconds: 2),
                                      ),
                                    );
                                  }
                                });
                              },
                            ),
                            const SizedBox(height: 24),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getLocaleName(Translations t, AppLocale locale) {
    switch (locale) {
      case AppLocale.en:
        return t.language.en;
      case AppLocale.ar:
        return t.language.ar;
      case AppLocale.de:
        return t.language.de;
      case AppLocale.es:
        return t.language.es;
      case AppLocale.fr:
        return t.language.fr;
      case AppLocale.hi:
        return t.language.hi;
      case AppLocale.id:
        return t.language.id;
      case AppLocale.ja:
        return t.language.ja;
      case AppLocale.ko:
        return t.language.ko;
      case AppLocale.pt:
        return t.language.pt;
      case AppLocale.vi:
        return t.language.vi;
      case AppLocale.zh:
        return t.language.zh;
    }
  }

  Widget _buildSettingsItem({
    required dynamic icon, // Can be IconData or Widget
    required String title,
    String? trailingText,
    Widget? trailingWidget,
    bool showChevron = true,
    VoidCallback? onTap,
  }) {
    final Widget leadingIcon = icon is IconData
        ? Icon(icon, color: Colors.white, size: 22)
        : (icon as Widget);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0x80171717), // rgba(23, 23, 23, 0.5) from Figma
        borderRadius: const BorderRadius.all(Radius.circular(20)), // radius 20 from Figma
        border: Border.all(
          color: const Color(0xFF1C362B), // var(--dark-green-border) from Figma
          width: 1,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(16), // 16px padding from Figma
            child: Row(
              children: [
                leadingIcon,
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                if (trailingText != null) ...[
                  Text(
                    trailingText,
                    style: const TextStyle(
                      color: Color(0xFFB1B1B1),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  if (showChevron) const SizedBox(width: 8),
                ],
                if (trailingWidget != null) ...[
                  trailingWidget,
                  if (showChevron) const SizedBox(width: 8),
                ],
                if (showChevron)
                  const Icon(
                    Icons.chevron_right_rounded,
                    color: Color(0xFFB1B1B1),
                    size: 20,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
