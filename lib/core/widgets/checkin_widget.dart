import 'dart:async';
import 'dart:ui';
import 'package:ai_video_flutter/core/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:lottie/lottie.dart';
import 'package:core_business/core_business.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:go_router/go_router.dart';
import 'package:ai_video_flutter/core/navigation/route_observer.dart';
import 'package:ai_video_flutter/features/premium/presentation/pages/iap_page.dart';
import 'package:ai_video_flutter/features/premium/presentation/pages/discount_page.dart';
import '../injection/injection_container.dart';
import '../errors/backend_error_handler.dart';
import '../notification/local_notification_service.dart';
import '../../gen/assets.gen.dart';
import '../../i18n/strings.g.dart';
import 'package:ai_video_flutter/core/permission/app_permission_handler.dart';

enum DayState { claimed, today, upcoming }

class CheckInWidget extends StatefulWidget {
  const CheckInWidget({super.key});

  static final checkInTrigger = StreamController<void>.broadcast();

  @override
  State<CheckInWidget> createState() => _CheckInWidgetState();
}

class _CheckInWidgetState extends State<CheckInWidget> with RouteAware {
  bool _notificationEnabled = true;
  bool _hasAutoShown = false;
  StreamSubscription<void>? _triggerSubscription;
  late final DailyCheckInBloc _dailyCheckInBloc;

  @override
  void initState() {
    super.initState();
    _dailyCheckInBloc = sl<DailyCheckInBloc>()..add(const DailyCheckInEvent.init());
    _checkSystemNotificationPermission();
    _triggerSubscription = CheckInWidget.checkInTrigger.stream.listen((_) {
      if (mounted) {
        _showCheckInDialog(context);
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final modalRoute = ModalRoute.of(context);
    if (modalRoute != null) {
      routeObserver.subscribe(this, modalRoute);
    }
  }

  Future<void> _checkSystemNotificationPermission() async {
    final isEnabled = sl<LocalNotificationService>().isCheckInNotificationEnabled();
    if (!isEnabled) {
      if (mounted) {
        setState(() {
          _notificationEnabled = false;
        });
      }
      return;
    }
    try {
      final isGranted = await AppPermissionHandler.isNotificationPermissionGranted();
      if (mounted) {
        setState(() {
          _notificationEnabled = isGranted;
        });
      }
    } catch (_) {
      if (mounted) {
        setState(() {
          _notificationEnabled = isEnabled;
        });
      }
    }
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    _triggerSubscription?.cancel();
    super.dispose();
  }

  @override
  void didPopNext() {
    LogUtils.d('CheckInWidget: returned to home tab, checking check-in auto-show...');
    _checkAndShowDailyCheckInIfNeeded();
  }

  void _checkAndShowDailyCheckInIfNeeded() {
    _dailyCheckInBloc.state.mapOrNull(
      ready: (readyState) {
        if (!readyState.isCheckedInToday && !_hasAutoShown && !_isIapOrDiscountActive()) {
          _hasAutoShown = true;
          _showCheckInDialog(context);
        }
      },
    );
  }

  bool _isIapOrDiscountActive() {
    try {
      final router = GoRouter.of(context);
      final location = router.routerDelegate.currentConfiguration.uri.toString();
      return location.contains(IapPage.path) || location.contains(DiscountPage.path);
    } catch (_) {
      return false;
    }
  }

  void _showCheckInDialog(BuildContext context) async {
    final isEnabled = sl<LocalNotificationService>().isCheckInNotificationEnabled();
    bool isPermissionGranted = false;
    try {
      isPermissionGranted = await AppPermissionHandler.isNotificationPermissionGranted();
    } catch (_) {
      isPermissionGranted = isEnabled;
    }

    if (mounted) {
      setState(() {
        _notificationEnabled = isEnabled && isPermissionGranted;
      });
    }

    if (!context.mounted) return;

    showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.75),
      builder: (dialogContext) {
        return BlocProvider.value(
          value: context.read<DailyCheckInBloc>(),
          child: _CheckInDialogContent(
            initialNotificationEnabled: _notificationEnabled,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _dailyCheckInBloc,
      child: Builder(
        builder: (context) {
          return BlocListener<DailyCheckInBloc, DailyCheckInState>(
            listener: (context, state) {
              state.mapOrNull(
                ready: (readyState) {
                  if (!readyState.isCheckedInToday && !_hasAutoShown && !_isIapOrDiscountActive()) {
                    _hasAutoShown = true;
                    _showCheckInDialog(context);
                  }
                },
              );
            },
            child: GestureDetector(
              onTap: () => _showCheckInDialog(context),
              behavior: HitTestBehavior.opaque,
              child: Transform.scale(
                scale: 1.8,
                child: Lottie.asset(
                  Assets.raw.checkinBoxLottie,
                  height: 40,
                  width: 40,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CheckInDialogContent extends StatefulWidget {
  final bool initialNotificationEnabled;

  const _CheckInDialogContent({
    required this.initialNotificationEnabled,
  });

  @override
  State<_CheckInDialogContent> createState() => _CheckInDialogContentState();
}

class _CheckInDialogContentState extends State<_CheckInDialogContent>
    with WidgetsBindingObserver {
  late bool _notificationEnabled;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _notificationEnabled = widget.initialNotificationEnabled;
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _checkSystemNotificationPermission();
    }
  }

  Future<void> _checkSystemNotificationPermission() async {
    final isEnabled = sl<LocalNotificationService>().isCheckInNotificationEnabled();
    if (!isEnabled) {
      if (mounted) {
        setState(() {
          _notificationEnabled = false;
        });
      }
      return;
    }
    try {
      final isGranted = await AppPermissionHandler.isNotificationPermissionGranted();
      if (isGranted) {
        await sl<LocalNotificationService>().setCheckInNotificationEnabled(true);
        await sl<LocalNotificationService>().scheduleDailyCheckInNotification();
      }
      if (mounted) {
        setState(() {
          _notificationEnabled = isGranted;
        });
      }
    } catch (_) {
      if (mounted) {
        setState(() {
          _notificationEnabled = isEnabled;
        });
      }
    }
  }

  Future<void> _onNotificationChanged(bool val) async {
    if (val) {
      final isGranted = await AppPermissionHandler.checkAndRequestNotificationPermission(context);
      if (!mounted) return;
      if (isGranted) {
        await sl<LocalNotificationService>().setCheckInNotificationEnabled(true);
        await sl<LocalNotificationService>().scheduleDailyCheckInNotification();
        setState(() {
          _notificationEnabled = true;
        });
      } else {
        setState(() {
          _notificationEnabled = false;
        });
      }
    } else {
      final shouldDisable = await _showDisableNotificationConfirmDialog(context);
      if (shouldDisable) {
        await sl<LocalNotificationService>().setCheckInNotificationEnabled(false);
        await sl<LocalNotificationService>().cancelDailyCheckInNotification();
        if (mounted) {
          setState(() {
            _notificationEnabled = false;
          });
        }
      } else {
        if (mounted) {
          setState(() {
            _notificationEnabled = true;
          });
        }
      }
    }
  }

  Future<bool> _showDisableNotificationConfirmDialog(BuildContext context) async {
    final t = context.t;

    final title = t.checkin.disable_notification_title;
    final desc = t.checkin.disable_notification_desc;
    final cancelText = t.checkin.disable_notification_keep;
    final confirmText = t.checkin.disable_notification_disable;

    final result = await showDialog<bool>(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.5),
      builder: (dialogContext) {
        return Center(
          child: Container(
            width: 330,
            margin: const EdgeInsets.symmetric(horizontal: 24),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
            decoration: BoxDecoration(
              color: const Color(0xFF171717),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              border: Border.all(
                color: const Color(0xFF2BC5C5),
                width: 1,
              ),
            ),
            child: Material(
              color: Colors.transparent,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Title
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),

                  // Description
                  Text(
                    desc,
                    style: const TextStyle(
                      color: Color(0xFFB1B1B1),
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),

                  // Action Buttons Row
                  Row(
                    children: [
                      // Cancel Button
                      Expanded(
                        child: InkWell(
                          onTap: () => Navigator.pop(dialogContext, false),
                          borderRadius: const BorderRadius.all(Radius.circular(100)),
                          child: Container(
                            height: 48,
                            decoration: const BoxDecoration(
                              color: Color(0xFF979797),
                              borderRadius: BorderRadius.all(Radius.circular(100)),
                            ),
                            child: Center(
                              child: Text(
                                cancelText,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),

                      // Confirm Button
                      Expanded(
                        child: InkWell(
                          onTap: () => Navigator.pop(dialogContext, true),
                          borderRadius: const BorderRadius.all(Radius.circular(100)),
                          child: Container(
                            height: 48,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFF007BFF),
                                  Color(0xFF24C780),
                                ],
                              ),
                              borderRadius: const BorderRadius.all(Radius.circular(100)),
                            ),
                            child: Center(
                              child: Text(
                                confirmText,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );

    return result ?? false;
  }

  Widget _buildTitle(BuildContext context) {
    final String title = context.t.checkin.title;
    final List<String> parts = title.split(' ');

    if (parts.length >= 2) {
      final String firstPart = parts[0];
      final String secondPart = parts.sublist(1).join(' ');

      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (bounds) => const LinearGradient(
              colors: [
                Color(0xFF007BFF),
                Color(0xFF00C6FF),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ).createShader(bounds),
            child: Text(
              firstPart,
              style: GoogleFonts.inter(
                fontSize: 28,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 8),
          ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (bounds) => const LinearGradient(
              colors: [
                Color(0xFF24C780),
                Color(0xFF2BC5C5),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ).createShader(bounds),
            child: Text(
              secondPart,
              style: GoogleFonts.inter(
                fontSize: 28,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
          ),
        ],
      );
    } else {
      return ShaderMask(
        blendMode: BlendMode.srcIn,
        shaderCallback: (bounds) => const LinearGradient(
          colors: [
            Color(0xFF007BFF),
            Color(0xFF24C780),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ).createShader(bounds),
        child: Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 28,
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        ),
      );
    }
  }

  DayState _getDayState({
    required int streakDay,
    required int currentStreak,
    required bool isCheckedInToday,
  }) {
    if (isCheckedInToday) {
      if (streakDay <= currentStreak) {
        return DayState.claimed;
      } else {
        return DayState.upcoming;
      }
    } else {
      if (streakDay <= currentStreak) {
        return DayState.claimed;
      } else if (streakDay == currentStreak + 1) {
        return DayState.today;
      } else {
        return DayState.upcoming;
      }
    }
  }

  bool _isTodayDay(int day, int currentStreak, bool isCheckedInToday) {
    if (isCheckedInToday) {
      return currentStreak == day;
    } else {
      return currentStreak + 1 == day;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DailyCheckInBloc, DailyCheckInState>(
      listener: (context, state) {
        state.mapOrNull(
          ready: (readyState) {
            readyState.checkInStatus.whenOrNull(
              success: (credits) {
                final isVi = Translations.of(context).$meta.locale.languageCode == 'vi';
                final message = isVi
                    ? '+$credits Điểm tín dụng! Điểm danh thành công.'
                    : '+$credits Credits! Checked in successfully.';
                
                // Automatically dismiss check-in dialog
                Navigator.of(context).pop();

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                    duration: const Duration(seconds: 3),
                    backgroundColor: AppColors.primary,
                  ),
                );
              },
              error: (failure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      BackendErrorHelper.getErrorMessage(
                        context,
                        failure.toErrorCodeOrMessage(),
                      ),
                    ),
                    duration: const Duration(seconds: 3),
                    backgroundColor: Colors.red,
                  ),
                );
              },
            );
          },
        );
      },
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const Dialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
          error: (message) => Dialog(
            backgroundColor: AppColors.onSurface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: const BorderSide(color: AppColors.secondary, width: 1.2),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.error_outline, color: Colors.red, size: 48),
                  const SizedBox(height: 16),
                  Text(
                    BackendErrorHelper.getErrorMessage(context, message),
                    style: const TextStyle(color: AppColors.white, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      context.read<DailyCheckInBloc>().add(const DailyCheckInEvent.init());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: Text(
                      context.t.video_player.retry,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ready: (dailyLoginEntity, isCheckedInToday, checkInStatus) {
            final double screenWidth = MediaQuery.of(context).size.width;
            final double day7Width = (screenWidth * 0.65).clamp(180.0, 240.0);
            final double day7Height = (screenWidth * 0.45).clamp(120.0, 160.0) * 0.85;

            final rewardsMap = {
              for (var r in dailyLoginEntity.rewards) r.streakDay: r
            };

            return Dialog(
              backgroundColor: Colors.transparent,
              elevation: 0,
              shape: const RoundedRectangleBorder(side: BorderSide.none),
              insetPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // White Card Stack
                    Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.topCenter,
                      children: [
                        // White Card Body
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(top: 50),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(28),
                          ),
                          padding: const EdgeInsets.fromLTRB(16, 75, 16, 24),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Sparkly Title
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    Assets.images.icLineCheckin.path,
                                    width: 40,
                                    height: 26,
                                    fit: BoxFit.contain,
                                  ),
                                  const SizedBox(width: 4),
                                  Flexible(
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: _buildTitle(context),
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Image.asset(
                                    Assets.images.icLineCheckin2.path,
                                    width: 40,
                                    height: 26,
                                    fit: BoxFit.contain,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              // Subtitle
                              Text(
                                context.t.checkin.subtitle,
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF4CAF50),
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 20),

                              // Days Grid
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  _buildDayCard(
                                    context: context,
                                    day: 1,
                                    reward: 'x${(rewardsMap[1]?.rewardCredits ?? 5).toString().padLeft(2, '0')}',
                                    state: _getDayState(
                                      streakDay: 1,
                                      currentStreak: dailyLoginEntity.currentStreak,
                                      isCheckedInToday: isCheckedInToday,
                                    ),
                                    isToday: _isTodayDay(1, dailyLoginEntity.currentStreak, isCheckedInToday),
                                  ),
                                  _buildDayCard(
                                    context: context,
                                    day: 2,
                                    reward: 'x${(rewardsMap[2]?.rewardCredits ?? 8).toString().padLeft(2, '0')}',
                                    state: _getDayState(
                                      streakDay: 2,
                                      currentStreak: dailyLoginEntity.currentStreak,
                                      isCheckedInToday: isCheckedInToday,
                                    ),
                                    isToday: _isTodayDay(2, dailyLoginEntity.currentStreak, isCheckedInToday),
                                  ),
                                  _buildDayCard(
                                    context: context,
                                    day: 3,
                                    reward: 'x${(rewardsMap[3]?.rewardCredits ?? 10).toString().padLeft(2, '0')}',
                                    state: _getDayState(
                                      streakDay: 3,
                                      currentStreak: dailyLoginEntity.currentStreak,
                                      isCheckedInToday: isCheckedInToday,
                                    ),
                                    isToday: _isTodayDay(3, dailyLoginEntity.currentStreak, isCheckedInToday),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  _buildDayCard(
                                    context: context,
                                    day: 4,
                                    reward: 'x${(rewardsMap[4]?.rewardCredits ?? 12).toString().padLeft(2, '0')}',
                                    state: _getDayState(
                                      streakDay: 4,
                                      currentStreak: dailyLoginEntity.currentStreak,
                                      isCheckedInToday: isCheckedInToday,
                                    ),
                                    isToday: _isTodayDay(4, dailyLoginEntity.currentStreak, isCheckedInToday),
                                  ),
                                  _buildDayCard(
                                    context: context,
                                    day: 5,
                                    reward: 'x${(rewardsMap[5]?.rewardCredits ?? 15).toString().padLeft(2, '0')}',
                                    state: _getDayState(
                                      streakDay: 5,
                                      currentStreak: dailyLoginEntity.currentStreak,
                                      isCheckedInToday: isCheckedInToday,
                                    ),
                                    isToday: _isTodayDay(5, dailyLoginEntity.currentStreak, isCheckedInToday),
                                  ),
                                  _buildDayCard(
                                    context: context,
                                    day: 6,
                                    reward: 'x${(rewardsMap[6]?.rewardCredits ?? 18).toString().padLeft(2, '0')}',
                                    state: _getDayState(
                                      streakDay: 6,
                                      currentStreak: dailyLoginEntity.currentStreak,
                                      isCheckedInToday: isCheckedInToday,
                                    ),
                                    isToday: _isTodayDay(6, dailyLoginEntity.currentStreak, isCheckedInToday),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              // Day 7
                              Center(
                                child: _buildDay7Card(
                                  context: context,
                                  reward: 'x${(rewardsMap[7]?.rewardCredits ?? 25).toString()}',
                                  state: _getDayState(
                                    streakDay: 7,
                                    currentStreak: dailyLoginEntity.currentStreak,
                                    isCheckedInToday: isCheckedInToday,
                                  ),
                                  width: day7Width,
                                  height: day7Height,
                                  isToday: _isTodayDay(7, dailyLoginEntity.currentStreak, isCheckedInToday),
                                ),
                              ),
                              const SizedBox(height: 24),

                              // Check-in Button
                              Container(
                                width: double.infinity,
                                height: 50,
                                decoration: BoxDecoration(
                                  gradient: isCheckedInToday
                                      ? null
                                      : const LinearGradient(
                                          colors: [AppColors.primary, AppColors.secondary],
                                        ),
                                  color: isCheckedInToday ? const Color(0xFFE0E0E0) : null,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: InkWell(
                                  onTap: isCheckedInToday || checkInStatus.maybeWhen(loading: () => true, orElse: () => false)
                                      ? null
                                      : () => context.read<DailyCheckInBloc>().add(
                                            const DailyCheckInEvent.checkIn(ignoreReward: false),
                                          ),
                                  borderRadius: BorderRadius.circular(100),
                                  child: Center(
                                    child: checkInStatus.maybeWhen(
                                      loading: () => const CupertinoActivityIndicator(color: Colors.white),
                                      orElse: () => Text(
                                        isCheckedInToday
                                            ? context.t.checkin.checked_in
                                            : context.t.checkin.check_in_btn,
                                        style: GoogleFonts.inter(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: isCheckedInToday ? const Color(0xFF9E9E9E) : Colors.white,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Overlapping Illustration
                        Positioned(
                          top: -10,
                          child: Image.asset(
                            Assets.images.bgCheckinHeader.path,
                            height: 130,
                            fit: BoxFit.contain,
                          ),
                        ),
                        // Close Button
                        Positioned(
                          top: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: AppColors.activeTab.withValues(alpha: 0.6),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    // Daily Bonus Notification switch tile below
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(15),
                            border: const GradientBoxBorder(
                              gradient: LinearGradient(
                                colors: [AppColors.primary, AppColors.secondary],
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  context.t.checkin.daily_bonus_notification,
                                  style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Transform.scale(
                                    scale: 0.8,
                                    child: CupertinoSwitch(
                                      value: _notificationEnabled,
                                      activeTrackColor: const Color(0xFF00E676),
                                      onChanged: _onNotificationChanged,
                                    ),
                                  ),
                                ],
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
        );
      },
    );
  }

  Widget _buildDayCard({
    required BuildContext context,
    required int day,
    required String reward,
    required DayState state,
    bool isToday = false,
  }) {
    Color borderColor;
    Gradient? headerGradient;
    Color headerTextColor;
    Widget centerIcon;
    Color cardBgColor = Colors.white;

    switch (state) {
      case DayState.claimed:
        borderColor = const Color(0xFF0075E7).withValues(alpha: 0.5);
        headerGradient = AppColors.primaryGradient.withOpacity(0.5);
        headerTextColor = const Color(0xFFFFFFFF);
        centerIcon = Stack(
          alignment: Alignment.center,
          children: [
            Opacity(
              opacity: 0.5,
              child: Image.asset(
                Assets.images.icCheckinCoin.path,
                fit: BoxFit.contain,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.check, color: Colors.white, size: 12),
            ),
          ],
        );
        break;
      case DayState.today:
        borderColor = const Color(0xFF0075E7).withValues(alpha: 0.5);
        headerGradient = AppColors.primaryGradient;
        headerTextColor = const Color(0xFFFFFFFF);
        centerIcon = Image.asset(
          Assets.images.icCheckinCoin.path,
          fit: BoxFit.contain,
        );
        cardBgColor = const Color(0xFFDFF5E4);
        break;
      case DayState.upcoming:
        borderColor = const Color(0xFF0075E7).withValues(alpha: 0.5);
        headerGradient = AppColors.primaryGradient.withOpacity(0.5);
        headerTextColor = const Color(0xFFFFFFFF);
        centerIcon = Image.asset(
          Assets.images.icCheckinCoin.path,
          fit: BoxFit.contain,
        );
        break;
    }

    return Expanded(
      child: AspectRatio(
        aspectRatio: 0.95,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: cardBgColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: borderColor, width: 1.5),
            boxShadow: state != DayState.claimed
                ? [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.25),
                      offset: const Offset(0, 4),
                      blurRadius: 4,
                    ),
                  ]
                : null,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Column(
              children: [
                // Header bar
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: null,
                    gradient: headerGradient,
                  ),
                  child: Text(
                    isToday
                        ? context.t.checkin.today
                        : context.t.checkin.day(n: day),
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: headerTextColor,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 2,
                      horizontal: 4,
                    ),
                    child: Center(child: centerIcon),
                  ),
                ),
                Text(
                  reward,
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: state == DayState.claimed
                      ? const Color(0xFF0A4F87).withValues(alpha: 0.5)
                      : (state == DayState.today
                          ? const Color(0xFF1E9320)
                          : const Color(0xFF0A4F87)),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDay7Card({
    required BuildContext context,
    required String reward,
    required DayState state,
    required double width,
    required double height,
    bool isToday = false,
  }) {
    Color borderColor = const Color(0xFFBBDEFB);
    Gradient? headerGradient = AppColors.primaryGradient.withOpacity(0.5);
    Color headerTextColor = Colors.white;
    Widget centerIcon = Image.asset(
      Assets.images.icCheckinBadgeCoin.path,
      fit: BoxFit.contain,
    );
    Color cardBgColor = Colors.white;

    if (state == DayState.claimed) {
      borderColor = const Color(0xFFE0E0E0);
      headerGradient = AppColors.primaryGradient.withOpacity(0.5);
      headerTextColor = const Color(0xFF9E9E9E);
      centerIcon = Stack(
        alignment: Alignment.center,
        children: [
          Opacity(
            opacity: 0.5,
            child: Image.asset(
              Assets.images.icCheckinBadgeCoin.path,
              fit: BoxFit.contain,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.check, color: Colors.white, size: 12),
          ),
        ],
      );
    } else if (state == DayState.today) {
      borderColor = const Color(0xFF00D492);
      headerGradient = AppColors.primaryGradient;
      headerTextColor = Colors.white;
      cardBgColor = const Color(0xFFE8F5E9);
    }

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: cardBgColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor, width: 1.5),
        boxShadow: state != DayState.claimed
            ? [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.25),
                  offset: const Offset(0, 4),
                  blurRadius: 4,
                ),
              ]
            : null,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Column(
          children: [
            // Header bar
            Container(
              padding: const EdgeInsets.symmetric(vertical: 2),
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: null,
                gradient: headerGradient,
              ),
              child: Text(
                isToday
                    ? context.t.checkin.today
                    : context.t.checkin.day(n: 7),
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: headerTextColor,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.zero,
                child: Center(
                  child: Transform.scale(
                    scale: 2.0,
                    child: centerIcon,
                  ),
                ),
              ),
            ),
            Text(
              reward,
              style: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: state == DayState.claimed
                    ? const Color(0xFF0A4F87).withValues(alpha: 0.5)
                    : (state == DayState.today
                        ? const Color(0xFF1E9320)
                        : const Color(0xFF0A4F87)),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
          ],
        ),
      ),
    );
  }
}
