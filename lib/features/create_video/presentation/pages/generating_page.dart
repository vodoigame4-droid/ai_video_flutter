import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/injection/injection_container.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/gradient_border_container.dart';
import '../../../../i18n/strings.g.dart';
import '../../../../core/extensions/context_failure_ext.dart';
import '../../../../core/utils/app_toast.dart';
import 'package:core_business/core_business.dart';
import '../../../profile/presentation/pages/profile_page.dart';
import 'result_page.dart';

class GeneratingPage extends StatelessWidget {
  static const String path = '/generating';
  static const String name = 'generating';

  final String title;
  final String? imageUrl;
  final String themeId;
  final String themeType;
  final int themeOrgId;
  final bool isHd;
  final bool isLongTime;
  final String serviceType;
  final String? videoUrl;
  final String? prompt;

  const GeneratingPage({
    super.key,
    required this.title,
    this.imageUrl,
    required this.themeId,
    required this.themeType,
    required this.themeOrgId,
    required this.isHd,
    required this.isLongTime,
    required this.serviceType,
    this.videoUrl,
    this.prompt,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<GeneratingBloc>()
        ..add(GeneratingEvent.startGenerating(
          title: title,
          imageUrl: imageUrl,
          themeId: themeId,
          themeType: themeType,
          themeOrgId: themeOrgId,
          isHd: isHd,
          isLongTime: isLongTime,
          serviceType: serviceType,
          videoUrl: videoUrl,
          prompt: prompt,
        )),
      child: GeneratingView(
        title: title,
        imageUrl: imageUrl,
        serviceType: serviceType,
        videoUrlSrc: videoUrl,
        themeId: themeId,
        themeType: themeType,
        themeOrgId: themeOrgId,
        isHd: isHd,
        isLongTime: isLongTime,
      ),
    );
  }
}

class GeneratingView extends StatelessWidget {
  final String title;
  final String? imageUrl;
  final String serviceType;
  final String? videoUrlSrc;
  final String themeId;
  final String themeType;
  final int themeOrgId;
  final bool isHd;
  final bool isLongTime;

  const GeneratingView({
    super.key,
    required this.title,
    this.imageUrl,
    required this.serviceType,
    this.videoUrlSrc,
    required this.themeId,
    required this.themeType,
    required this.themeOrgId,
    required this.isHd,
    required this.isLongTime,
  });

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return Scaffold(
      backgroundColor: AppColors.black,
      body: BlocListener<GeneratingBloc, GeneratingState>(
        listener: (context, state) {
          state.mapOrNull(
            success: (successState) {
              // Replace screen with ResultPage so back button doesn't go back to Generating
              ResultPage.push(
                context,
                ResultPageArgs(
                  videoId: successState.videoId,
                  title: successState.title,
                  imageUrl: successState.imageUrl ?? '',
                  videoUrl: successState.videoUrl,
                  createdAt: successState.createdAt,
                  serviceType: serviceType,
                  videoUrlSrc: videoUrlSrc,
                  themeId: themeId,
                  themeType: themeType,
                  themeOrgId: themeOrgId,
                  isHd: isHd,
                  isLongTime: isLongTime,
                  fromGeneration: true,
                ),
                replace: true,
              );
            },
            notifiedAndExited: (state) {
              final message = state.isPermissionGranted
                  ? t.generating.notified
                  : t.generating.notification_denied;
              if (state.isPermissionGranted) {
                AppToast.showSuccess(message);
              } else {
                AppToast.showWarning(message);
              }
              sl<ProfileBloc>().add(const ProfileEvent.init());
              context.goNamed(ProfilePage.name);
            },
            failure: (failureState) {
              context.handleFailure(Failure.business(code: failureState.message, message: ''));
              context.pop();
            },
          );
        },
        child: BlocBuilder<GeneratingBloc, GeneratingState>(
          builder: (context, state) {
            final double progress = state.maybeMap(
              generating: (g) => g.progress,
              orElse: () => 0.0,
            );

            final String? currentImageUrl = state.maybeMap(
              generating: (g) => g.imageUrl,
              orElse: () => imageUrl,
            );

            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
                child: Column(
                  children: [
                    const Spacer(),

                    // Animated central graphics (Stars + glowing borders)
                    Center(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // Outer rotating thin cyan/teal border
                          Container(
                            width: 220,
                            height: 220,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.secondary.withValues(alpha: 0.15),
                                width: 1,
                              ),
                            ),
                          )
                              .animate(onPlay: (controller) => controller.repeat())
                              .rotate(duration: 15.seconds),

                          // Glowing pulse ring
                          Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.secondary.withValues(alpha: 0.2),
                                  blurRadius: 30,
                                  spreadRadius: 5,
                                ),
                              ],
                            ),
                          )
                              .animate(onPlay: (controller) => controller.repeat(reverse: true))
                              .scale(
                                begin: const Offset(0.92, 0.92),
                                end: const Offset(1.05, 1.05),
                                duration: 2.seconds,
                                curve: Curves.easeInOut,
                              ),

                          // Main circle container with glowing border
                          Hero(
                            tag: 'template-hero-$themeId',
                            child: GradientBorderContainer(
                              width: 200,
                              height: 200,
                              borderRadius: const BorderRadius.all(Radius.circular(100)),
                              borderWidth: 2.0,
                              backgroundColor: AppColors.black,
                              child: Center(
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      // Background image if imageUrl exists
                                      if (currentImageUrl != null && currentImageUrl.isNotEmpty)
                                        Positioned.fill(
                                          child: Opacity(
                                            opacity: 0.5,
                                            child: currentImageUrl.startsWith('http')
                                                ? Image.network(currentImageUrl, fit: BoxFit.cover)
                                                : (currentImageUrl.startsWith('assets/')
                                                    ? Image.asset(currentImageUrl, fit: BoxFit.cover)
                                                    : Image.file(File(currentImageUrl), fit: BoxFit.cover)),
                                          ),
                                        ),
                                      // Central Star (Large)
                                      ShaderMask(
                                        shaderCallback: (bounds) =>
                                            AppColors.primaryGradient.createShader(bounds),
                                        blendMode: BlendMode.srcIn,
                                        child: Icon(
                                          Icons.auto_awesome,
                                          size: 72,
                                          color: AppColors.white,
                                        ),
                                      )
                                          .animate(onPlay: (controller) => controller.repeat(reverse: true))
                                          .scale(
                                            begin: const Offset(0.85, 0.85),
                                            end: const Offset(1.15, 1.15),
                                            duration: 1200.milliseconds,
                                            curve: Curves.easeInOut,
                                          ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                          // Progress text indicator
                          Positioned(
                            bottom: -28,
                            child: Text(
                              "${(progress * 100).toInt()}%",
                              style: context.textTheme.titleMedium?.copyWith(
                                color: AppColors.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                                .animate(onPlay: (controller) => controller.repeat(reverse: true))
                                .shimmer(duration: 2.seconds, color: AppColors.white),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 80),

                    // Title: Generating your video
                    ShaderMask(
                      shaderCallback: (bounds) => AppColors.primaryGradient.createShader(bounds),
                      blendMode: BlendMode.srcIn,
                      child: Text(
                        t.generating.title,
                        style: context.textTheme.titleLarge?.copyWith(
                          fontSize: 28,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    )
                        .animate(onPlay: (controller) => controller.repeat(reverse: true))
                        .scale(
                          begin: const Offset(0.98, 0.98),
                          end: const Offset(1.02, 1.02),
                          duration: 1500.milliseconds,
                        ),

                    const SizedBox(height: 8),

                    Text(
                      t.generating.your_video,
                      style: context.textTheme.titleLarge?.copyWith(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Subtitle
                    Text(
                      t.generating.desc,
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: AppColors.subText,
                        fontSize: 16,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const Spacer(),

                    // Notify me when complete button
                    InkWell(
                      onTap: () {
                        context.read<GeneratingBloc>().add(const GeneratingEvent.notifyComplete());
                      },
                      borderRadius: const BorderRadius.all(Radius.circular(100)),
                      child: GradientBorderContainer(
                        borderRadius: const BorderRadius.all(Radius.circular(100)),
                        borderWidth: 1.2,
                        gradient: AppColors.borderGradient,
                        backgroundColor: AppColors.black,
                        child: Container(
                          height: 56,
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.notifications_active_outlined,
                                color: AppColors.secondary,
                                size: 24,
                              )
                                  .animate(onPlay: (controller) => controller.repeat())
                                  .shake(
                                    hz: 4,
                                    curve: Curves.easeInOut,
                                    duration: 2.seconds,
                                  ),
                              const SizedBox(width: 10),
                              Text(
                                t.generating.notify_me,
                                style: context.textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
