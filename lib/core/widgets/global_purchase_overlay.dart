import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core_business/core_business.dart';
import '../theme/app_colors.dart';
import '../../i18n/strings.g.dart';

class GlobalPurchaseOverlay extends StatelessWidget {
  final Widget child;

  const GlobalPurchaseOverlay({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        BlocSelector<IapBloc, IapState, bool>(
          selector: (state) => state.maybeMap(
            loading: (_) => true,
            orElse: () => false,
          ),
          builder: (context, isLoading) {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(
                  opacity: animation,
                  child: ScaleTransition(
                    scale: Tween<double>(begin: 1.05, end: 1.0).animate(
                      CurvedAnimation(
                        parent: animation,
                        curve: Curves.easeOutCubic,
                      ),
                    ),
                    child: child,
                  ),
                );
              },
              child: isLoading
                  ? const _LoadingOverlayContent(key: ValueKey('loading_overlay'))
                  : const SizedBox.shrink(key: ValueKey('empty_overlay')),
            );
          },
        ),
      ],
    );
  }
}

class _LoadingOverlayContent extends StatelessWidget {
  const _LoadingOverlayContent({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    return Container(
      color: Colors.black.withValues(alpha: 0.35), // Clean translucent dimming (no blur)
      alignment: Alignment.center,
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          color: const Color(0xE61C1C1E), // iOS-standard dark HUD color
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.25),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CupertinoActivityIndicator(
              radius: 14,
              color: AppColors.primary,
            ),
            const SizedBox(height: 14),
            Text(
              t.common.processing,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w500,
                fontFamily: 'SF Pro Text',
                decoration: TextDecoration.none,
                letterSpacing: -0.1,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
