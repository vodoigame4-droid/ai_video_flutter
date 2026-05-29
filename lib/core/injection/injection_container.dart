import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:network/network.dart';
import '../utils/log_utils.dart';

// Auth
import '../../features/auth/data/datasources/auth_api_client.dart';
import '../../features/auth/data/datasources/auth_remote_datasource.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';

// Media
import '../../features/media/data/datasources/media_api_client.dart';
import '../../features/media/data/datasources/media_remote_datasource.dart';
import '../../features/media/domain/repositories/media_repository.dart';
import '../../features/media/data/repositories/media_repository_impl.dart';

// IAP
import '../../features/premium/data/datasources/iap_api_client.dart';
import '../../features/premium/data/datasources/iap_remote_datasource.dart';
import '../../features/premium/domain/repositories/iap_repository.dart';
import '../../features/premium/data/repositories/iap_repository_impl.dart';
import '../../features/splash/presentation/bloc/splash_bloc.dart';
import '../../features/onboarding/presentation/bloc/onboarding_bloc.dart';
import '../../features/home/presentation/blocs/home_bloc.dart';
import '../../features/dashboard/presentation/bloc/dashboard_bloc.dart';
import '../../features/profile/presentation/bloc/profile_bloc.dart';
import '../../features/profile/data/datasources/profile_local_datasource.dart';
import '../../features/settings/presentation/bloc/settings_bloc.dart';
import '../../features/profile/data/repositories/profile_repository_impl.dart';
import '../../features/profile/domain/repositories/profile_repository.dart';
import '../../features/profile/domain/usecases/get_user_videos_use_case.dart';
import '../../features/profile/domain/usecases/delete_user_video_use_case.dart';
import '../../features/profile/domain/usecases/update_video_progress_use_case.dart';
import '../../features/templates/data/datasources/templates_local_datasource.dart';
import '../../features/templates/data/repositories/templates_repository_impl.dart';
import '../../features/templates/domain/repositories/templates_repository.dart';
import '../../features/templates/domain/usecases/get_templates_use_case.dart';
import '../../features/templates/presentation/bloc/templates_bloc.dart';
import '../../features/create_video/presentation/bloc/create_video_bloc.dart';
import '../../features/create_video/presentation/bloc/generating_bloc.dart';
import '../../features/create_video/presentation/bloc/result_bloc.dart';
import '../../features/create_video/presentation/bloc/create_from_template_bloc.dart';
import '../../features/premium/presentation/bloc/iap/iap_bloc.dart';
import '../../features/video_player/presentation/bloc/video_player_bloc.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // Features - Splash
  sl.registerFactory(() => SplashBloc());

  // Features - Onboarding
  sl.registerFactory(() => OnboardingBloc());

  // Features - Home
  sl.registerFactory(() => HomeBloc(getTemplatesUseCase: sl()));

  // Features - Dashboard
  sl.registerFactory(() => DashboardBloc());

  // Features - Profile
  sl.registerLazySingleton<ProfileLocalDataSource>(
    () => ProfileLocalDataSourceImpl(),
  );
  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(sl()),
  );
  sl.registerFactory(() => GetUserVideosUseCase(sl()));
  sl.registerFactory(() => DeleteUserVideoUseCase(sl()));
  sl.registerFactory(() => UpdateVideoProgressUseCase(sl()));
  sl.registerFactory(() => ProfileBloc(
        getUserVideosUseCase: sl(),
        deleteUserVideoUseCase: sl(),
        updateVideoProgressUseCase: sl(),
      ));

  // Features - Templates
  sl.registerLazySingleton<TemplatesLocalDataSource>(
    () => TemplatesLocalDataSourceImpl(),
  );
  sl.registerLazySingleton<TemplatesRepository>(
    () => TemplatesRepositoryImpl(sl()),
  );
  sl.registerFactory(() => GetTemplatesUseCase(sl()));
  sl.registerFactory(() => TemplatesBloc(getTemplatesUseCase: sl()));

  // Features - Create Video
  sl.registerFactory(() => CreateVideoBloc());
  sl.registerFactory(() => GeneratingBloc(profileRepository: sl()));
  sl.registerFactory(() => ResultBloc(deleteUserVideoUseCase: sl()));
  sl.registerFactory(() => CreateFromTemplateBloc());

  // Features - Premium / Paywall
  sl.registerFactory(() => IapBloc());

  // Features - Video Player
  sl.registerFactory(() => VideoPlayerBloc());

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

  // Auth Feature
  sl.registerLazySingleton(() => AuthApiClient(sl<ApiClient>().dio));
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(apiClient: sl()),
  );
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: sl(),
      sharedPreferences: sl(),
    ),
  );

  // Media Feature
  sl.registerLazySingleton(() => MediaApiClient(sl<ApiClient>().dio));
  sl.registerLazySingleton<MediaRemoteDataSource>(
    () => MediaRemoteDataSourceImpl(apiClient: sl()),
  );
  sl.registerLazySingleton<MediaRepository>(
    () => MediaRepositoryImpl(remoteDataSource: sl()),
  );

  // IAP Feature
  sl.registerLazySingleton(() => IapApiClient(sl<ApiClient>().dio));
  sl.registerLazySingleton<IapRemoteDataSource>(
    () => IapRemoteDataSourceImpl(apiClient: sl()),
  );
  sl.registerLazySingleton<IapRepository>(
    () => IapRepositoryImpl(remoteDataSource: sl()),
  );

  // Shared Preferences
  final sharedPrefs = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  // Features - Settings
  sl.registerFactory(() => SettingsBloc(sharedPreferences: sl()));
}
