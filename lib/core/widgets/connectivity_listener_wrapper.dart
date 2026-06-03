import 'dart:async';
import 'dart:ui';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../theme/app_colors.dart';
import '../../i18n/strings.g.dart';
import 'gradient_border_container.dart';

class ConnectivityListenerWrapper extends StatefulWidget {
  final Widget child;

  const ConnectivityListenerWrapper({super.key, required this.child});

  @override
  State<ConnectivityListenerWrapper> createState() => _ConnectivityListenerWrapperState();
}

class _ConnectivityListenerWrapperState extends State<ConnectivityListenerWrapper> {
  bool _isConnected = true;
  bool _isChecking = false;
  late final StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  final Connectivity _connectivity = Connectivity();

  @override
  void initState() {
    super.initState();
    _checkInitialConnectivity();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> _checkInitialConnectivity() async {
    try {
      final results = await _connectivity.checkConnectivity();
      _updateConnectionStatus(results);
    } catch (e) {
      // If check fails, default to connected to avoid false block
      _updateConnectionStatus([ConnectivityResult.wifi]);
    }
  }

  void _updateConnectionStatus(List<ConnectivityResult> results) {
    final hasConnection = results.isNotEmpty && !results.contains(ConnectivityResult.none);
    if (_isConnected != hasConnection) {
      setState(() {
        _isConnected = hasConnection;
      });
    }
  }

  Future<void> _handleRetry() async {
    if (_isChecking) return;
    setState(() {
      _isChecking = true;
    });

    // Wait at least 1s to simulate network reconnecting
    await Future.wait([
      Future.delayed(const Duration(seconds: 1)),
      _connectivity.checkConnectivity().then((results) {
        _updateConnectionStatus(results);
      }),
    ]);

    if (mounted) {
      setState(() {
        _isChecking = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return Stack(
      children: [
        widget.child,
        if (!_isConnected)
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  color: AppColors.black.withValues(alpha: 0.8),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: GradientBorderContainer(
                        borderWidth: 1.2,
                        backgroundColor: AppColors.onSurface,
                        borderRadius: const BorderRadius.all(Radius.circular(24)),
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Pulsing warning icon
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: AppColors.heart.withValues(alpha: 0.1),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: AppColors.heart.withValues(alpha: 0.3),
                                    width: 1.5,
                                  ),
                                ),
                                child: const Icon(
                                  Icons.wifi_off_rounded,
                                  color: AppColors.heart,
                                  size: 40,
                                ),
                              )
                                  .animate(onPlay: (controller) => controller.repeat(reverse: true))
                                  .scale(
                                    begin: const Offset(0.95, 0.95),
                                    end: const Offset(1.05, 1.05),
                                    duration: 1200.milliseconds,
                                    curve: Curves.easeInOut,
                                  ),
                              const SizedBox(height: 24),

                              // Localized Title
                              Text(
                                t.connectivity.no_internet_title,
                                style: const TextStyle(
                                  color: AppColors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 12),

                              // Localized Description
                              Text(
                                t.connectivity.no_internet_desc,
                                style: const TextStyle(
                                  color: AppColors.subText,
                                  fontSize: 15,
                                  height: 1.4,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 28),

                              // Localized Retry Connection Button
                              InkWell(
                                onTap: _isChecking ? null : _handleRetry,
                                borderRadius: const BorderRadius.all(Radius.circular(100)),
                                child: Container(
                                  height: 48,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    gradient: _isChecking ? null : AppColors.primaryGradient,
                                    color: _isChecking ? AppColors.white.withValues(alpha: 0.1) : null,
                                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                                  ),
                                  child: _isChecking
                                      ? const SizedBox(
                                          width: 20,
                                          height: 20,
                                          child: CircularProgressIndicator(
                                            valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
                                            strokeWidth: 2.0,
                                          ),
                                        )
                                      : Text(
                                          t.connectivity.retry_button,
                                          style: const TextStyle(
                                            color: AppColors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ).animate().fade(duration: 300.milliseconds),
      ],
    );
  }
}
