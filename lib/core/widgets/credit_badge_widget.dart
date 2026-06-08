import 'package:ai_video_flutter/features/premium/presentation/pages/iap_page.dart';
import 'package:ai_video_flutter/features/premium/presentation/pages/buy_credits_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core_business/core_business.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_theme.dart';
import '../../i18n/strings.g.dart';
import '../injection/injection_container.dart';
import 'rolling_counter.dart';

class CreditBadgeWidget extends StatelessWidget {
  const CreditBadgeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreditBadgeBloc>(
      create: (context) =>
          sl<CreditBadgeBloc>()..add(const CreditBadgeEvent.started()),
      child: BlocBuilder<CreditBadgeBloc, CreditBadgeState>(
        builder: (context, state) {
          final isPro = state.maybeWhen(
            ready: (isPro, _) => isPro,
            orElse: () => false,
          );
          final creditsStr = state.maybeWhen(
            ready: (_, credits) => credits.toString(),
            loading: () => '...',
            orElse: () => '0',
          );

          final gradient = const LinearGradient(
            colors: [Color(0xFF2BC5C5), Color(0xFF24C780)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          );

          return Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                LogUtils.d('CreditBadgeWidget: onTap clicked. isPro=$isPro');
                if (isPro) {
                  LogUtils.d(
                    'CreditBadgeWidget: navigating to BuyCreditsPage (${BuyCreditsPage.path})',
                  );
                  context.push(BuyCreditsPage.path);
                } else {
                  LogUtils.d(
                    'CreditBadgeWidget: navigating to IapPage (${IapPage.path})',
                  );
                  context.push(IapPage.path);
                }
              },
              borderRadius: const BorderRadius.all(Radius.circular(100)),
              child: Ink(
                padding: const EdgeInsets.only(
                  left: 18,
                  right: 8,
                  top: 6,
                  bottom: 6,
                ),
                decoration: BoxDecoration(
                  gradient: gradient,
                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                  border: Border.all(color: const Color(0xFF31B8F2), width: 1),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    isPro
                        ? Text(
                            context.t.common.pro,
                            style:
                                context.textTheme.bodyMedium?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ) ??
                                const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                          )
                        : RollingCounter(
                            text: creditsStr,
                            textStyle:
                                context.textTheme.bodyMedium?.copyWith(
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
        },
      ),
    );
  }
}
