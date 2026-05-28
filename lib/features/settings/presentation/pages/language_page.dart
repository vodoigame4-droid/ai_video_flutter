import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/injection/injection_container.dart';
import '../../../../i18n/strings.g.dart';
import '../bloc/settings_bloc.dart';
import '../bloc/settings_event.dart';
import '../bloc/settings_state.dart';

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

class LanguageView extends StatelessWidget {
  const LanguageView({super.key});

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

              // Header Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back Button
                  Material(
                    color: Colors.white.withValues(alpha: 0.1),
                    shape: const CircleBorder(),
                    child: InkWell(
                      onTap: () => context.pop(),
                      borderRadius: const BorderRadius.all(Radius.circular(100)),
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
                    t.language.title,
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

              // Language Items List
              Expanded(
                child: BlocBuilder<SettingsBloc, SettingsState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => const Center(child: CircularProgressIndicator()),
                      loading: () => const Center(child: CircularProgressIndicator()),
                      ready: (currentLocale) {
                        return ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: AppLocale.values.length,
                          itemBuilder: (context, index) {
                            final locale = AppLocale.values[index];
                            final isSelected = locale == currentLocale;
                            final nativeName = _getNativeLanguageName(locale);

                            return _buildLanguageItem(
                              context: context,
                              locale: locale,
                              title: nativeName,
                              isSelected: isSelected,
                              onTap: () {
                                context.read<SettingsBloc>().add(
                                      SettingsEvent.changeLanguage(locale),
                                    );
                              },
                            );
                          },
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
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0x80171717), // rgba(23, 23, 23, 0.5) from Figma
        borderRadius: const BorderRadius.all(Radius.circular(20)), // radius 20 from Figma
        border: Border.all(
          color: isSelected
              ? const Color(0xFF2BC5C5) // var(--secondary-color) from Figma
              : const Color(0xFF1C362B), // var(--dark-green-border) from Figma
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
                // Flag Container on the left
                _buildFlag(locale),
                const SizedBox(width: 12), // 12px gap from Figma
                
                // Native name
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500, // Medium for both from Figma
                    ),
                  ),
                ),
                
                // Radio button on the right
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
