import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/injection/injection_container.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/gradient_border_container.dart';
import '../../../../i18n/strings.g.dart';
import 'package:core_business/core_business.dart';
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

  const GeneratingPage({
    super.key,
    required this.title,
    this.imageUrl,
    required this.themeId,
    required this.themeType,
    required this.themeOrgId,
    required this.isHd,
    required this.isLongTime,
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
        )),
      child: const GeneratingView(),
    );
  }
}

class GeneratingView extends StatelessWidget {
  const GeneratingView({super.key});

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
                videoId: successState.videoId,
                title: successState.title,
                imageUrl: successState.imageUrl ?? '',
                videoUrl: successState.videoUrl,
                createdAt: successState.createdAt,
                replace: true,
              );
            },
            notifiedAndExited: (_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(t.generating.notified),
                  duration: const Duration(seconds: 2),
                ),
              );
              context.pop();
            },
          );
        },
        child: BlocBuilder<GeneratingBloc, GeneratingState>(
          builder: (context, state) {
            return state.maybeWhen(
              generating: (progress, title, imageUrl) {
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

                              // Main circle container with gradient border
                              GradientBorderContainer(
                                width: 200,
                                height: 200,
                                borderRadius: const BorderRadius.all(Radius.circular(100)),
                                borderWidth: 2.0,
                                backgroundColor: AppColors.black,
                                child: Center(
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
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

                                      // Tiny floating decorative stars
                                      Positioned(
                                        top: 40,
                                        right: 48,
                                        child: Icon(
                                          Icons.star_rounded,
                                          size: 20,
                                          color: AppColors.secondary,
                                        )
                                            .animate(onPlay: (controller) => controller.repeat(reverse: true))
                                            .scale(duration: 800.milliseconds)
                                            .moveY(begin: 0, end: -6, duration: 1.seconds),
                                      ),
                                      Positioned(
                                        bottom: 42,
                                        left: 48,
                                        child: Icon(
                                          Icons.star_rounded,
                                          size: 16,
                                          color: AppColors.primary,
                                        )
                                            .animate(onPlay: (controller) => controller.repeat(reverse: true))
                                            .scale(duration: 900.milliseconds, delay: 200.milliseconds)
                                            .moveY(begin: 0, end: 5, duration: 1200.milliseconds),
                                      ),
                                    ],
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
              orElse: () => const Center(child: CircularProgressIndicator()),
            );
          },
        ),
      ),
    );
  }
}
