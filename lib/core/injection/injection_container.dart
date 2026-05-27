import 'package:get_it/get_it.dart';
import '../../features/splash/presentation/bloc/splash_bloc.dart';
import '../../features/onboarding/presentation/bloc/onboarding_bloc.dart';
import '../../features/home/presentation/blocs/home_bloc.dart';
import '../../features/dashboard/presentation/bloc/dashboard_bloc.dart';
import '../../features/profile/presentation/bloc/profile_bloc.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // Features - Splash
  sl.registerFactory(() => SplashBloc());

  // Features - Onboarding
  sl.registerFactory(() => OnboardingBloc());

  // Features - Home
  sl.registerFactory(() => HomeBloc());

  // Features - Dashboard
  sl.registerFactory(() => DashboardBloc());

  // Features - Profile
  sl.registerFactory(() => ProfileBloc());
}
