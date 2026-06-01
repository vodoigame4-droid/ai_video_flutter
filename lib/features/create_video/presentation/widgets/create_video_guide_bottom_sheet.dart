import 'dart:ui';
import 'package:ai_video_flutter/core/widgets/gradient_border_container.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/gradient_button.dart';
import '../../../../core/widgets/app_image.dart';
import '../../../../i18n/strings.g.dart';

class CreateVideoGuideBottomSheet extends StatelessWidget {
  final String imageUrl;

  const CreateVideoGuideBottomSheet({super.key, required this.imageUrl});

  static void show(BuildContext context, {required String imageUrl}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => CreateVideoGuideBottomSheet(imageUrl: imageUrl),
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return Container(
      height: 794,
      decoration: const BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
            child: AppImage(imageUrl: imageUrl, fit: BoxFit.cover),
          ),

          // Content overlay
          Positioned.fill(
            child: Column(
              children: [
                // Top drag handle
                Container(
                  margin: const EdgeInsets.only(top: 24),
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: const Color(0xFF3F3F3F),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),

                const Spacer(),

                // Step 1 and Step 2 guide elements
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Step 1
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          t.guide.step_1,
                          style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 16),
                        GradientBorderContainer(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          backgroundColor: Colors.black.withValues(alpha: 0.3),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              width: 125,
                              height: 40,
                              alignment: Alignment.center,
                              child: Text(
                                t.guide.upload_photo,
                                style: const TextStyle(
                                  color: AppColors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 40),
                    // Step 2
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          t.guide.step_2,
                          style: const TextStyle(
                            color: AppColors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 16),
                        GradientBorderContainer(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          backgroundColor: Colors.black.withValues(alpha: 0.3),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              width: 125,
                              height: 40,
                              alignment: Alignment.center,
                              child: Text(
                                t.guide.upload_photo,
                                style: const TextStyle(
                                  color: AppColors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 40),

                // Got It button
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: 24,
                  ),
                  child: GradientButton(
                    width: double.infinity,
                    label: t.guide.got_it,
                    onPressed: () => Navigator.pop(context),
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
