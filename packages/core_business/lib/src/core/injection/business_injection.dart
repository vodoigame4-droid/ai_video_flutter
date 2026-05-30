import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:network/network.dart';

// Settings
import '../../features/settings/presentation/bloc/settings_bloc.dart';

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

// Premium / IAP
import '../../features/premium/data/datasources/iap_api_client.dart';
import '../../features/premium/data/datasources/iap_remote_datasource.dart';
import '../../features/premium/domain/repositories/iap_repository.dart';
import '../../features/premium/data/repositories/iap_repository_impl.dart';
import '../../features/premium/presentation/bloc/iap_bloc.dart';

// Blocs
import '../../features/media/presentation/bloc/home/home_bloc.dart';
import '../../features/media/presentation/bloc/templates/templates_bloc.dart';
import '../../features/media/presentation/bloc/create_video/create_video_bloc.dart';
import '../../features/media/presentation/bloc/create_from_template/create_from_template_bloc.dart';
import '../../features/media/presentation/bloc/generating/generating_bloc.dart';
import '../../features/media/presentation/bloc/result/result_bloc.dart';
import '../../features/media/presentation/bloc/video_player/video_player_bloc.dart';
import '../../features/profile/presentation/bloc/profile_bloc.dart';

void initBusinessDependencies(GetIt sl) {
  // Settings
  sl.registerFactory(() => SettingsBloc(sharedPreferences: sl()));

  // Auth
  sl.registerLazySingleton(() => AuthApiClient(sl<ApiClient>().dio));
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(apiClient: sl()),
  );
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: sl(),
      sharedPreferences: sl(),
      appConfig: sl(),
    ),
  );

  // Media
  sl.registerLazySingleton(() => MediaApiClient(sl<ApiClient>().dio));
  sl.registerLazySingleton<MediaRemoteDataSource>(
    () => MediaRemoteDataSourceImpl(apiClient: sl()),
  );
  sl.registerLazySingleton<MediaRepository>(
    () => MediaRepositoryImpl(
      remoteDataSource: sl(),
      appConfig: sl(),
    ),
  );

  // Premium / IAP
  sl.registerLazySingleton(() => IapApiClient(sl<ApiClient>().dio));
  sl.registerLazySingleton<IapRemoteDataSource>(
    () => IapRemoteDataSourceImpl(apiClient: sl()),
  );
  sl.registerLazySingleton<IapRepository>(
    () => IapRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerFactory(() => IapBloc(iapRepository: sl()));

  // Blocs
  sl.registerFactory(() => HomeBloc(mediaRepository: sl()));
  sl.registerFactory(() => TemplatesBloc(mediaRepository: sl()));
  sl.registerFactory(() => CreateVideoBloc());
  sl.registerFactory(() => CreateFromTemplateBloc());
  sl.registerFactory(() => GeneratingBloc(mediaRepository: sl()));
  sl.registerFactory(() => ResultBloc(mediaRepository: sl()));
  sl.registerFactory(() => VideoPlayerBloc());
  sl.registerFactory(() => ProfileBloc(mediaRepository: sl()));
}
