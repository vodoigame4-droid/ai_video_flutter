import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/injection/injection_container.dart';
import '../../../../core/utils/app_toast.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../i18n/strings.g.dart';
import 'iap_page.dart';
import 'buy_credits_page.dart';
import 'generation_iap_page.dart';
import 'generation_buy_credits_page.dart';
import 'discount_page.dart';
import '../../../create_video/presentation/pages/generating_page.dart';

class DebugPage extends StatelessWidget {
  static const String path = '/debug';
  static const String name = 'debug';

  const DebugPage({super.key});

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

                    // Title
                    Text(
                      t.debug.title,
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

                // Debug Navigation Items
                Expanded(
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      _buildDebugItem(
                        icon: Icons.monetization_on_outlined,
                        title: t.debug.iap_page,
                        onTap: () => context.push(IapPage.path),
                      ),
                      _buildDebugItem(
                        icon: Icons.credit_card_outlined,
                        title: t.debug.buy_credits,
                        onTap: () => context.push(BuyCreditsPage.path),
                      ),
                      _buildDebugItem(
                        icon: Icons.video_library_outlined,
                        title: t.debug.generation_iap,
                        onTap: () => context.push(GenerationIapPage.path),
                      ),
                      _buildDebugItem(
                        icon: Icons.wallet_outlined,
                        title: t.debug.generation_buy_credits,
                        onTap: () =>
                            context.push(GenerationBuyCreditsPage.path),
                      ),
                      _buildDebugItem(
                        icon: Icons.percent_outlined,
                        title: t.debug.discount,
                        onTap: () => context.push(DiscountPage.path),
                      ),
                      _buildDebugItem(
                        icon: Icons.auto_awesome,
                        title: t.debug.generating_page,
                        onTap: () {
                          GeneratingPage.push(
                            context,
                            title: 'Debug Vido',
                            imageUrl: 'assets/images/img_one_person.png',
                            themeId: 'debug_theme',
                            themeType: 'TEMPLATE',
                            themeOrgId: 1,
                            isHd: true,
                            isLongTime: false,
                            serviceType: 'IMAGE_TO_VIDEO',
                          );
                        },
                      ),
                      _buildDebugItem(
                        icon: Icons.delete_sweep_outlined,
                        title: 'Clear App Data',
                        onTap: () async {
                          final prefs = sl<SharedPreferences>();
                          await prefs.clear();
                          AppToast.showSuccess('Clear app data successfully! Please restart app.');
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDebugItem({
    required IconData icon,
    required String title,
    VoidCallback? onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: const BoxDecoration(
        color: Color(0x80171717),
        borderRadius: BorderRadius.all(Radius.circular(20)),
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
                Icon(icon, color: Colors.white, size: 22),
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
