import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/injection/injection_container.dart';
import '../../../home/presentation/pages/home_page.dart';
import '../bloc/splash_bloc.dart';
import '../bloc/splash_event.dart';
import '../bloc/splash_state.dart';
import '../widgets/logo_section_widget.dart';
import '../widgets/progress_section_widget.dart';

class SplashPage extends StatelessWidget {
  static const String path = '/';
  static const String name = 'splash';

  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashBloc>(
      create: (context) => sl<SplashBloc>()..add(const SplashEvent.init()),
      child: const SplashView(),
    );
  }
}

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000200),
      body: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          state.mapOrNull(
            success: (_) {
              HomePage.go(context);
            },
          );
        },
        child: Stack(
          children: [
            // Top-left ellipse background
            Positioned(
              left: -201,
              top: -218,
              width: 301,
              height: 338,
              child: SvgPicture.asset(
                'assets/images/ellipse.svg',
                fit: BoxFit.contain,
              ),
            ),
            // Bottom-right ellipse background
            Positioned(
              right: -201,
              bottom: -218,
              width: 301,
              height: 338,
              child: SvgPicture.asset(
                'assets/images/ellipse.svg',
                fit: BoxFit.contain,
              ),
            ),
            // Center Logo & Title
            const Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(bottom: 100.0),
                child: LogoSectionWidget(),
              ),
            ),
            // Bottom Progress section
            Positioned(
              bottom: 80,
              left: 0,
              right: 0,
              child: Center(
                child: BlocBuilder<SplashBloc, SplashState>(
                  builder: (context, state) {
                    final percent = state.maybeWhen(
                      loading: (percent) => percent,
                      success: () => 100,
                      orElse: () => 0,
                    );
                    return ProgressSectionWidget(percent: percent);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
