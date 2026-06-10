import 'package:ai_video_flutter/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import '../../../../core/injection/injection_container.dart';
import '../../../../i18n/strings.g.dart';
import 'package:core_business/core_business.dart';
import '../../../../core/widgets/defer_init_widget.dart';
import '../../../../gen/assets.gen.dart';

class LanguagePage extends StatelessWidget {
  static const String path = '/settings/language';
  static const String name = 'language';

  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SettingsBloc>()..add(const SettingsEvent.init()),
      child: const LanguageView(),
    );
  }
}

class LanguageView extends StatefulWidget {
  const LanguageView({super.key});

  @override
  State<LanguageView> createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {
  Future<void> _selectLanguage(BuildContext context, String languageCode) async {
    final locale = AppLocale.values.firstWhere(
      (l) => l.languageCode == languageCode,
      orElse: () => AppLocale.en,
    );

    // Load the deferred language library asynchronously
    await LocaleSettings.setLocale(locale);

    if (context.mounted) {
      context.read<SettingsBloc>().add(
            SettingsEvent.changeLanguage(languageCode),
          );
    }
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
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),

                // Header Row
                BlocBuilder<SettingsBloc, SettingsState>(
                  builder: (context, state) {
                    final isLoading = state.maybeWhen(
                      loading: () => true,
                      orElse: () => false,
                    );

                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Back Button (with black 10% opacity background)
                        GestureDetector(
                          onTap: isLoading ? null : () => context.pop(),
                          child: Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: Colors.black.withValues(alpha: 0.1),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ),

                        // Title
                        Text(
                          t.language.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        // Confirm Checkmark Tick on the Top-Right
                        GestureDetector(
                          onTap: isLoading ? null : () => context.pop(),
                          child: Container(
                            width: 36,
                            height: 36,
                            alignment: Alignment.centerRight,
                            child: isLoading
                                ? const SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        Color(0xFF2BC5C5),
                                      ),
                                    ),
                                  )
                                : SvgPicture.asset(
                                    Assets.icons.icTick,
                                    width: 36,
                                    height: 16,
                                  ),
                          ),
                        ),
                      ],
                    );
                  },
                ),

                const SizedBox(height: 30),

                // Language Items List
                Expanded(
                  child: DeferInitWidget(
                    child: BlocListener<SettingsBloc, SettingsState>(
                      listener: (context, state) {
                        state.maybeWhen(
                          ready: (currentLanguageCode) {
                            final locale = AppLocale.values.firstWhere(
                              (l) => l.languageCode == currentLanguageCode,
                              orElse: () => AppLocale.en,
                            );
                            if (LocaleSettings.currentLocale != locale) {
                              LocaleSettings.setLocale(locale);
                            }
                          },
                          orElse: () {},
                        );
                      },
                      child: BlocBuilder<SettingsBloc, SettingsState>(
                        builder: (context, state) {
                          final isLoading = state.maybeWhen(
                            loading: () => true,
                            orElse: () => false,
                          );

                          return state.maybeWhen(
                            initial: () => const Center(child: CircularProgressIndicator()),
                            orElse: () {
                              final currentLanguageCode = state.maybeWhen(
                                ready: (code) => code,
                                orElse: () => 'en',
                              );

                              return ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                itemCount: AppLocale.values.length,
                                itemBuilder: (context, index) {
                                  final locale = AppLocale.values[index];
                                  final isSelected = locale.languageCode == currentLanguageCode;
                                  final nativeName = _getNativeLanguageName(locale);

                                  return _buildLanguageItem(
                                    context: context,
                                    locale: locale,
                                    title: nativeName,
                                    isSelected: isSelected,
                                    onTap: isLoading
                                        ? null
                                        : () => _selectLanguage(context, locale.languageCode),
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _getNativeLanguageName(AppLocale locale) {
    switch (locale) {
      case AppLocale.en:
        return 'English';
      case AppLocale.ar:
        return 'العربية';
      case AppLocale.de:
        return 'Deutsch';
      case AppLocale.es:
        return 'Español';
      case AppLocale.fr:
        return 'Français';
      case AppLocale.hi:
        return 'हिन्दी';
      case AppLocale.id:
        return 'Bahasa Indonesia';
      case AppLocale.ja:
        return '日本語';
      case AppLocale.ko:
        return '한국어';
      case AppLocale.pt:
        return 'Português';
      case AppLocale.vi:
        return 'Tiếng Việt';
      case AppLocale.zh:
        return '中文';
    }
  }

  Widget _buildFlag(AppLocale locale) {
    final emoji = _getEmojiFlag(locale);
    return Container(
      width: 32,
      height: 32,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white10,
      ),
      child: Text(
        emoji,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }

  String _getEmojiFlag(AppLocale locale) {
    switch (locale) {
      case AppLocale.en:
        return '🇺🇸';
      case AppLocale.vi:
        return '🇻🇳';
      case AppLocale.ar:
        return '🇸🇦';
      case AppLocale.de:
        return '🇩🇪';
      case AppLocale.es:
        return '🇪🇸';
      case AppLocale.fr:
        return '🇫🇷';
      case AppLocale.hi:
        return '🇮🇳';
      case AppLocale.id:
        return '🇮🇩';
      case AppLocale.ja:
        return '🇯🇵';
      case AppLocale.ko:
        return '🇰🇷';
      case AppLocale.pt:
        return '🇵🇹';
      case AppLocale.zh:
        return '🇨🇳';
    }
  }

  Widget _buildLanguageItem({
    required BuildContext context,
    required AppLocale locale,
    required String title,
    required bool isSelected,
    required VoidCallback? onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0x80171717),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        border: isSelected
        ? const GradientBoxBorder(
            gradient: LinearGradient(
              colors: [
                AppColors.primary,
                AppColors.secondary,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            width: 1,
          )
        : Border.all(
            color: const Color(0xFF1C362B),
            width: 1,
          ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                _buildFlag(locale),
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
                SvgPicture.asset(
                  isSelected
                      ? 'assets/images/ic_radio_active.svg'
                      : 'assets/images/ic_radio_inactive.svg',
                  width: 24,
                  height: 24,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
