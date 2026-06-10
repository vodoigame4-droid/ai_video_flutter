import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../../../core/injection/injection_container.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/app_toast.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../i18n/strings.g.dart';
import 'iap_page.dart';
import 'buy_credits_page.dart';
import 'generation_iap_page.dart';
import 'generation_buy_credits_page.dart';
import '../../../create_video/presentation/pages/generating_page.dart';

class DebugPage extends StatefulWidget {
  static const String path = '/debug';
  static const String name = 'debug';

  const DebugPage({super.key});

  @override
  State<DebugPage> createState() => _DebugPageState();
}

class _DebugPageState extends State<DebugPage> {
  String _deviceId = '';

  @override
  void initState() {
    super.initState();
    _loadDeviceId();
  }

  void _loadDeviceId() {
    final prefs = sl<SharedPreferences>();
    setState(() {
      _deviceId = prefs.getString('device_id') ?? '';
    });
  }

  void _showEditDeviceIdDialog(BuildContext context) {
    final controller = TextEditingController(text: _deviceId);
    showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.8),
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: const Color(0xFF171717),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            side: BorderSide(color: Color(0xFF2BC5C5), width: 1),
          ),
          title: const Text(
            'Change Device ID',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          content: TextField(
            controller: controller,
            style: const TextStyle(color: Colors.white, fontFamily: 'monospace'),
            decoration: const InputDecoration(
              hintText: 'Enter new device ID',
              hintStyle: TextStyle(color: Color(0xFF9E9E9E)),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFB1B1B1)),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF2BC5C5)),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text(
                'Cancel',
                style: TextStyle(color: Color(0xFF9E9E9E)),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                final newId = controller.text.trim();
                if (newId.isNotEmpty) {
                  final prefs = sl<SharedPreferences>();
                  await prefs.setString('device_id', newId);
                  if (mounted) {
                    setState(() {
                      _deviceId = newId;
                    });
                  }
                  if (dialogContext.mounted) {
                    Navigator.pop(dialogContext);
                  }
                  AppToast.showSuccess('Device ID updated successfully! Please restart/reload.');
                } else {
                  AppToast.showError('Device ID cannot be empty');
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2BC5C5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              child: const Text(
                'Save',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        );
      },
    );
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
                      // Device ID Card
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFF171717).withValues(alpha: 0.8),
                          borderRadius: const BorderRadius.all(Radius.circular(20)),
                          border: Border.all(
                            color: const Color(0xFF2BC5C5).withValues(alpha: 0.3),
                            width: 1.5,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Device ID',
                              style: TextStyle(
                                color: Color(0xFFB1B1B1),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 6),
                            SelectableText(
                              _deviceId.isEmpty ? 'Not set' : _deviceId,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'monospace',
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                // Copy Button
                                TextButton.icon(
                                  onPressed: _deviceId.isEmpty
                                      ? null
                                      : () async {
                                          await Clipboard.setData(
                                            ClipboardData(text: _deviceId),
                                          );
                                          AppToast.showSuccess(
                                            t.settings.copied,
                                          );
                                        },
                                  icon: const Icon(
                                    Icons.copy_rounded,
                                    size: 16,
                                    color: Color(0xFF2BC5C5),
                                  ),
                                  label: const Text(
                                    'Copy',
                                    style: TextStyle(
                                      color: Color(0xFF2BC5C5),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  style: TextButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                // Change Button
                                TextButton.icon(
                                  onPressed: () => _showEditDeviceIdDialog(context),
                                  icon: const Icon(
                                    Icons.edit_rounded,
                                    size: 16,
                                    color: AppColors.secondary,
                                  ),
                                  label: const Text(
                                    'Change',
                                    style: TextStyle(
                                      color: AppColors.secondary,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  style: TextButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
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
                        onTap: () => context.push(IapPage.discountPath),
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
                      _buildDebugItem(
                        icon: Icons.phonelink_erase_outlined,
                        title: 'Reset & Clear Hardware UDID',
                        onTap: () async {
                          final prefs = sl<SharedPreferences>();
                          await prefs.remove('device_id');
                          
                          String message = 'Device ID override cleared successfully!';
                          
                          if (Theme.of(context).platform == TargetPlatform.iOS) {
                            try {
                              final packageInfo = await PackageInfo.fromPlatform();
                              final bundleName = packageInfo.appName;
                              final accountName = packageInfo.packageName;
                              
                              const storage = FlutterSecureStorage(
                                iOptions: IOSOptions(
                                  accessibility: KeychainAccessibility.first_unlock,
                                ),
                              );
                              
                              // Delete the key under both current bundleName service and default service
                              // Note: In flutter_secure_storage, 'accountName' corresponds to kSecAttrService (Service name)
                              await storage.delete(
                                key: accountName,
                                iOptions: IOSOptions(accountName: bundleName),
                              );
                              await storage.delete(
                                key: accountName,
                                iOptions: const IOSOptions(accountName: 'ai_video_flutter'),
                              );
                              
                              message += '\niOS Keychain UDID cleared successfully!';
                            } catch (e) {
                              debugPrint('DebugPage: Failed to clear iOS Keychain UDID: $e');
                              message += '\nWarning: Failed to clear iOS Keychain.';
                            }
                          } else {
                            message += '\nNote: Android ANDROID_ID cannot be cleared natively (system locked), but your override has been removed.';
                          }
                          
                          _loadDeviceId();
                          AppToast.showSuccess('$message\n\nPlease restart the app.');
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
