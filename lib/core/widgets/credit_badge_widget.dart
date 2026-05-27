import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../../i18n/strings.g.dart';

class CreditBadgeWidget extends StatelessWidget {
  final bool isPro;
  final String credits;
  final VoidCallback? onTap;

  const CreditBadgeWidget({
    super.key,
    this.isPro = true,
    this.credits = '300',
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final gradient = const LinearGradient(
      colors: [Color(0xFF2BC5C5), Color(0xFF24C780)],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    );

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        child: Ink(
          padding: const EdgeInsets.only(left: 18, right: 8, top: 6, bottom: 6),
          decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: const BorderRadius.all(Radius.circular(100)),
            border: Border.all(
              color: const Color(0xFF31B8F2),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                isPro ? context.t.common.pro : credits,
                style: context.textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ) ??
                    const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(width: 4),
              Image.asset(
                'assets/icons/ic_star_vip.png',
                width: 20,
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
