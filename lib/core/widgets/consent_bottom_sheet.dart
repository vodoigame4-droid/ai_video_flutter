import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:core_business/core_business.dart';

import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../services/remote_config_service.dart';
import '../constants/app_constants.dart';
import '../../i18n/strings.g.dart';
import '../injection/injection_container.dart';

class ConsentBottomSheet extends StatefulWidget {
  const ConsentBottomSheet({super.key});

  /// Displays the consent dialog popup. Returns true if accepted, false otherwise.
  static Future<bool> show(BuildContext context) async {
    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) => const ConsentBottomSheet(),
    );
    return result ?? false;
  }

  @override
  State<ConsentBottomSheet> createState() => _ConsentBottomSheetState();
}

class _ConsentBottomSheetState extends State<ConsentBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final t = context.t;
    final remoteConfig = sl<RemoteConfigService>();

    // Load dynamic text from Remote Config, fall back to localized translation if empty
    final title = remoteConfig.privacySheetTitle.isNotEmpty
        ? remoteConfig.privacySheetTitle
        : t.privacy_dialog.title;

    final description = remoteConfig.privacySheetDescription.isNotEmpty
        ? remoteConfig.privacySheetDescription
        : t.privacy_dialog.desc;

    return Dialog(
      backgroundColor: Colors.white,
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.85,
        ),
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Top Illustration/Icon
            Center(child: _buildShieldIcon()),
            const SizedBox(height: 20),
            // Title
            Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF1F1F1F),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Description (Scrollable)
            Flexible(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Text(
                  description,
                  style: const TextStyle(
                    color: Color(0xFF4A4A4A),
                    fontSize: 14,
                    height: 1.5,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Bullet list box
            _buildBulletsBox(t),
            const SizedBox(height: 16),
            // Privacy Links
            Center(child: _buildLinksText(context, t)),
            const SizedBox(height: 24),
            // Action Buttons
            _buildActionButtons(context, t),
          ],
        ),
      ),
    );
  }

  Widget _buildShieldIcon() {
    return Container(
      width: 90,
      height: 90,
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.1),
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Light glow circle
          Container(
            width: 66,
            height: 66,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.15),
              shape: BoxShape.circle,
            ),
          ),
          const Icon(Icons.shield, color: AppColors.primary, size: 56),
          const Positioned(
            bottom: 30,
            child: Icon(Icons.lock, color: Colors.white, size: 20),
          ),
        ],
      ),
    );
  }

  Widget _buildBulletsBox(Translations t) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.15),
          width: 1,
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildBulletItem(
            icon: Icons.verified_user_outlined,
            text: t.privacy_dialog.bullet_1,
          ),
          const SizedBox(height: 12),
          _buildBulletItem(
            icon: Icons.block_outlined,
            text: t.privacy_dialog.bullet_2,
          ),
          const SizedBox(height: 12),
          _buildBulletItem(
            icon: Icons.delete_outline,
            text: t.privacy_dialog.bullet_3,
          ),
        ],
      ),
    );
  }

  Widget _buildBulletItem({required IconData icon, required String text}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: AppColors.primary, size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: Color(0xFF333333),
              fontSize: 13,
              height: 1.4,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context, Translations t) {
    return Row(
      children: [
        // Cancel Button
        Expanded(
          child: ElevatedButton(
            onPressed: () => Navigator.of(context).pop(false),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFF1F1F1),
              foregroundColor: const Color(0xFF555555),
              elevation: 0,
              shadowColor: Colors.transparent,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Text(
              t.privacy_dialog.cancel,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        const SizedBox(width: 12),
        // Agree Button with Gradient
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
              borderRadius: BorderRadius.circular(16),
            ),
            child: ElevatedButton(
              onPressed: () async {
                final prefs = sl<SharedPreferences>();
                await prefs.setBool(StorageKeys.isPrivacyAccepted, true);
                if (context.mounted) {
                  Navigator.of(context).pop(true);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.white,
                elevation: 0,
                shadowColor: Colors.transparent,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Text(
                t.privacy_dialog.agree,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLinksText(BuildContext context, Translations t) {
    final linkStyle = const TextStyle(
      color: AppColors.primary,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.underline,
    );

    // Matches the localized format: "By continuing, you agree to our {privacy} and {terms}."
    final parts = t.privacy_dialog
        .agree_policy(privacy: '{{PRIVACY}}', terms: '{{TERMS}}')
        .split(RegExp(r'(\{\{PRIVACY\}\}|\{\{TERMS\}\})'));

    final matches = RegExp(r'(\{\{PRIVACY\}\}|\{\{TERMS\}\})')
        .allMatches(
          t.privacy_dialog.agree_policy(
            privacy: '{{PRIVACY}}',
            terms: '{{TERMS}}',
          ),
        )
        .toList();

    final List<InlineSpan> spans = [];

    for (int i = 0; i < parts.length; i++) {
      spans.add(TextSpan(text: parts[i]));
      if (i < matches.length) {
        final match = matches[i].group(0);
        if (match == '{{PRIVACY}}') {
          spans.add(
            TextSpan(
              text: t.premium.privacy_policy,
              style: linkStyle,
              recognizer: TapGestureRecognizer()
                ..onTap = () => launchPrivacyPolicy(),
            ),
          );
        } else if (match == '{{TERMS}}') {
          spans.add(
            TextSpan(
              text: t.premium.terms_of_use,
              style: linkStyle,
              recognizer: TapGestureRecognizer()
                ..onTap = () => launchTermsOfUse(),
            ),
          );
        }
      }
    }

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: const TextStyle(
          color: Color(0xFF666666),
          fontSize: 13,
          height: 1.4,
        ),
        children: spans,
      ),
    );
  }
}
