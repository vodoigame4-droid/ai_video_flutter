import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:network/network.dart';
import 'package:core_business/core_business.dart';
import '../utils/log_utils.dart';
import '../config/app_config_impl.dart';

import '../../features/splash/presentation/bloc/splash_bloc.dart';
import '../../features/onboarding/presentation/bloc/onboarding_bloc.dart';
import '../../features/dashboard/presentation/bloc/dashboard_bloc.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // Features - Splash
  sl.registerFactory(() => SplashBloc());

  // Features - Onboarding
  sl.registerFactory(() => OnboardingBloc());

  // Features - Dashboard
  sl.registerFactory(() => DashboardBloc());

  // Network Client
  sl.registerLazySingleton<ApiClient>(
    () => ApiClient(
      baseUrl: 'https://video-effect-be.apihub.today/api/v1',
      logCallback: LogUtils.d,
      tokenProvider: () async {
        final prefs = sl<SharedPreferences>();
        return prefs.getString('auth_access_token');
      },
    ),
  );

  // Shared Preferences
  final sharedPrefs = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  // App Config
  String version = '1.0.0';
  try {
    final packageInfo = await PackageInfo.fromPlatform();
    version = packageInfo.version;
  } catch (_) {
    // Fallback for test environments or unsupported platforms
  }
  sl.registerLazySingleton<AppConfig>(
    () => AppConfigImpl(appVersion: version),
  );

  // Initialize Business Logic Package Dependencies (Settings, Auth, Media, etc.)
  initBusinessDependencies(sl);
}
