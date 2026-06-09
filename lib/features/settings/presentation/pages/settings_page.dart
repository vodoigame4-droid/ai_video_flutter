import 'package:ai_video_flutter/features/premium/presentation/pages/generation_buy_credits_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/injection/injection_container.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../i18n/strings.g.dart';
import '../../../../core/utils/app_toast.dart';
import '../../../../core/widgets/defer_init_widget.dart';
import '../../../profile/presentation/widgets/premium_banner_widget.dart';
import '../../../premium/presentation/pages/iap_page.dart';
import '../../../premium/presentation/pages/buy_credits_page.dart';
import '../../../premium/presentation/pages/debug_page.dart';
import '../bloc/developer_bloc.dart';
import '../bloc/developer_event.dart';
import '../bloc/developer_state.dart';
import 'package:core_business/core_business.dart';
import '../../../../core/widgets/rate_app_dialog.dart';
import '../../../../core/constants/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'language_page.dart';

class SettingsPage extends StatelessWidget {
  static const String path = '/settings';
  static const String name = 'settings';

  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              sl<SettingsBloc>()..add(const SettingsEvent.init()),
        ),
        BlocProvider(create: (context) => sl<DeveloperBloc>()),
      ],
      child: const SettingsView(),
    );
  }
}

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool _hasRated = false;

  @override
  void initState() {
    super.initState();
    _checkRatedStatus();
  }

  void _checkRatedStatus() {
    final prefs = sl<SharedPreferences>();
    setState(() {
      _hasRated = prefs.getBool('rating_has_rated') ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.images.bgApp.path),
          fit: BoxFit.cover,
        ),
      ),
      child: BlocListener<DeveloperBloc, DeveloperState>(
        listener: (context, state) {
          state.maybeWhen(
            update: (count, navigateToDebug) {
              if (navigateToDebug) {
                context.read<DeveloperBloc>().add(const DeveloperEvent.reset());
                context.push(DebugPage.path);
              }
            },
            orElse: () {},
          );
        },
        child: Scaffold(
          backgroundColor: Colors.transparent,
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
                      Material(
                        color: Colors.white.withValues(alpha: 0.1),
                        shape: const CircleBorder(),
                        child: InkWell(
                          onTap: () => context.pop(),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(100),
                          ),
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
                        final currentLanguageCode = state.maybeWhen(
                          ready: (code) => code,
                          orElse: () => LocaleSettings.currentLocale.languageCode,
                        );
                        final currentLocale = AppLocale.values.firstWhere(
                          (l) => l.languageCode == currentLanguageCode,
                          orElse: () => AppLocale.en,
                        );
                        final localeName = _getLocaleName(
                          t,
                          currentLocale,
                        );

                        return ListView(
                                physics: const BouncingScrollPhysics(),
                                children: [
                                  // 1. Premium Upgrade Banner (hidden if user is premium)
                                  StreamBuilder<UserEntity>(
                                    stream: sl<WatchProfileUseCase>()(),
                                    builder: (context, snapshot) {
                                      final isVip =
                                          snapshot.data?.isVip ?? false;
                                      if (isVip) return const SizedBox.shrink();

                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          PremiumBannerWidget(
                                            onTap: () =>
                                                context.push(IapPage.path),
                                          ),
                                          const SizedBox(height: 12),
                                        ],
                                      );
                                    },
                                  ),

                                  // 2. My Credits
                                  BlocProvider<CreditBadgeBloc>(
                                    create: (context) => sl<CreditBadgeBloc>()
                                      ..add(const CreditBadgeEvent.started()),
                                    child:
                                        BlocBuilder<
                                          CreditBadgeBloc,
                                          CreditBadgeState
                                        >(
                                          builder: (context, creditState) {
                                            final creditsStr = creditState
                                                .maybeWhen(
                                                  ready: (_, credits) =>
                                                      credits.toString(),
                                                  loading: () => '...',
                                                  orElse: () => '0',
                                                );

                                            return _buildSettingsItem(
                                              icon: SvgPicture.asset(
                                                Assets.icons.icAiSetting,
                                                width: 22,
                                                height: 22,
                                              ),
                                              title: t.settings.myCredits,
                                              trailingText: creditsStr,
                                              onTap: () async {
                                                try {
                                                  final user =
                                                      await sl<
                                                            WatchProfileUseCase
                                                          >()()
                                                          .first;
                                                  if (context.mounted) {
                                                    if (user.isVip) {
                                                      context.push(
                                                        GenerationBuyCreditsPage
                                                            .path,
                                                      );
                                                    } else {
                                                      context.push(
                                                        BuyCreditsPage.path,
                                                      );
                                                    }
                                                  }
                                                } catch (e) {
                                                  if (context.mounted) {
                                                    context.push(
                                                      BuyCreditsPage.path,
                                                    );
                                                  }
                                                }
                                              },
                                            );
                                          },
                                        ),
                                  ),

                                  // 3. Language
                                  _buildSettingsItem(
                                    icon: SvgPicture.asset(
                                      Assets.icons.icLanguage,
                                      width: 22,
                                      height: 22,
                                    ),
                                    title: t.settings.language,
                                    trailingText: localeName,
                                    onTap: () =>
                                        context.push(LanguagePage.path),
                                  ),

                                  // 4. Contact Us
                                  _buildSettingsItem(
                                    icon: SvgPicture.asset(
                                      Assets.icons.icContactUs,
                                      width: 22,
                                      height: 22,
                                    ),
                                    title: t.settings.contactUs,
                                    onTap: () {
                                      launchSupportEmail();
                                    },
                                  ),

                                  // 5. Rate App
                                  StreamBuilder<UserEntity>(
                                    stream: sl<WatchProfileUseCase>()(),
                                    builder: (context, snapshot) {
                                      final isRated =
                                          snapshot.data?.isRated ?? false;
                                      if (isRated || _hasRated)
                                        return const SizedBox.shrink();

                                      return _buildSettingsItem(
                                        icon: SvgPicture.asset(
                                          Assets.icons.icRate,
                                          width: 22,
                                          height: 22,
                                        ),
                                        title: t.settings.rateApp,
                                        onTap: () async {
                                          await showRateAppDialog(context);
                                          _checkRatedStatus();
                                        },
                                      );
                                    },
                                  ),

                                  // 6. Terms of Use
                                  _buildSettingsItem(
                                    icon: SvgPicture.asset(
                                      Assets.icons.icTerm,
                                      width: 22,
                                      height: 22,
                                    ),
                                    title: t.settings.termsOfUse,
                                    onTap: () {
                                      launchTermsOfUse();
                                    },
                                  ),

                                  // 7. Privacy Policy
                                  _buildSettingsItem(
                                    icon: SvgPicture.asset(
                                      Assets.icons.icPrivacy,
                                      width: 22,
                                      height: 22,
                                    ),
                                    title: t.settings.privacyPolicy,
                                    onTap: () {
                                      launchPrivacyPolicy();
                                    },
                                  ),

                                  // 8. User Code
                                  StreamBuilder<UserEntity>(
                                    stream: sl<WatchProfileUseCase>()(),
                                    builder: (context, snapshot) {
                                      final userId = snapshot.data?.id ?? '...';

                                      return _buildSettingsItem(
                                        icon: SvgPicture.asset(
                                          Assets.icons.icUserCode,
                                          width: 22,
                                          height: 22,
                                        ),
                                        title: t.settings.userCode,
                                        showChevron: false,
                                        trailingWidget: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              _formatUserId(
                                                userId,
                                              ).toUpperCase(),
                                              style: const TextStyle(
                                                color: AppColors.primary,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            SvgPicture.asset(
                                              Assets.icons.icCopy,
                                              width: 16,
                                              height: 16,
                                            ),
                                          ],
                                        ),
                                        onTap: () {
                                          Clipboard.setData(
                                            ClipboardData(text: userId),
                                          ).then((_) {
                                            if (context.mounted) {
                                              AppToast.showSuccess(
                                                t.settings.copied,
                                              );
                                            }
                                          });
                                        },
                                      );
                                    },
                                  ),
                                  const SizedBox(height: 24),

                                  // Version Code
                                  GestureDetector(
                                    onTap: () {
                                      context.read<DeveloperBloc>().add(
                                        const DeveloperEvent.tap(),
                                      );
                                    },
                                    behavior: HitTestBehavior.opaque,
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          bottom: 24,
                                        ),
                                        child: Text(
                                          'v${sl<AppConfig>().appVersion}',
                                          style: const TextStyle(
                                            color: Color(0xFFB1B1B1),
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                ],
              ),
            ),
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
    final Widget leadingIcon = SizedBox(
      width: 22,
      height: 22,
      child: Center(
        child: icon is IconData
            ? Icon(icon, color: Colors.white, size: 22)
            : (icon as Widget),
      ),
    );

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0x80171717), // rgba(23, 23, 23, 0.5) from Figma
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ), // radius 20 from Figma
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
                      color: AppColors.primary,
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

  String _formatUserId(String userId) {
    if (userId.length <= 16) return userId;
    return '${userId.substring(0, 6)}...${userId.substring(userId.length - 6)}';
  }
}
