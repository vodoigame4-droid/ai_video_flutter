import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:network/network.dart';

// Settings
import '../../features/settings/presentation/bloc/settings_bloc.dart';
import '../../features/settings/domain/usecases/get_settings_usecase.dart';
import '../../features/settings/domain/usecases/save_settings_usecase.dart';

// Auth
import '../../features/auth/data/datasources/auth_api_client.dart';
import '../../features/auth/data/datasources/auth_remote_datasource.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/usecases/login_usecase.dart';
import '../../features/auth/domain/usecases/get_profile_usecase.dart';

// Media
import '../../features/media/data/datasources/media_api_client.dart';
import '../../features/media/data/datasources/media_remote_datasource.dart';
import '../../features/media/domain/repositories/media_repository.dart';
import '../../features/media/data/repositories/media_repository_impl.dart';
import '../../features/media/domain/usecases/get_home_categories_usecase.dart';
import '../../features/media/domain/usecases/get_categories_usecase.dart';
import '../../features/media/domain/usecases/get_themes_usecase.dart';
import '../../features/media/domain/usecases/upload_image_usecase.dart';
import '../../features/media/domain/usecases/create_tgv_usecase.dart';
import '../../features/media/domain/usecases/get_media_detail_usecase.dart';
import '../../features/media/domain/usecases/get_history_usecase.dart';
import '../../features/media/domain/usecases/get_media_statuses_usecase.dart';
import '../../features/media/domain/usecases/delete_media_usecase.dart';

// Liked Templates / Local DB
import '../../core/database/app_database.dart';
import '../../features/media/data/datasources/liked_templates_local_datasource.dart';
import '../../features/media/domain/repositories/liked_templates_repository.dart';
import '../../features/media/data/repositories/liked_templates_repository_impl.dart';
import '../../features/media/domain/usecases/liked_templates_usecases.dart';
import '../../features/media/domain/usecases/watch_liked_templates_usecase.dart';

// Premium / IAP
import '../../features/premium/data/datasources/iap_api_client.dart';
import '../../features/premium/data/datasources/iap_remote_datasource.dart';
import '../../features/premium/domain/repositories/iap_repository.dart';
import '../../features/premium/data/repositories/iap_repository_impl.dart';
import '../../features/premium/presentation/bloc/iap_bloc.dart';
import '../../features/premium/domain/usecases/verify_subscription_usecase.dart';
import '../../features/premium/domain/usecases/verify_product_usecase.dart';

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
  // Settings UseCases & Bloc
  sl.registerLazySingleton(() => GetSettingsUseCase(sharedPreferences: sl()));
  sl.registerLazySingleton(() => SaveSettingsUseCase(sharedPreferences: sl()));
  sl.registerFactory(
    () => SettingsBloc(
      getSettingsUseCase: sl(),
      saveSettingsUseCase: sl(),
    ),
  );

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
  sl.registerLazySingleton(() => LoginUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => GetProfileUseCase(authRepository: sl()));

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
  
  // Media UseCases
  sl.registerLazySingleton(() => GetHomeCategoriesUseCase(mediaRepository: sl()));
  sl.registerLazySingleton(() => GetCategoriesUseCase(mediaRepository: sl()));
  sl.registerLazySingleton(() => GetThemesUseCase(mediaRepository: sl()));
  sl.registerLazySingleton(() => UploadImageUseCase(mediaRepository: sl()));
  sl.registerLazySingleton(() => CreateTgvUseCase(mediaRepository: sl()));
  sl.registerLazySingleton(() => GetMediaDetailUseCase(mediaRepository: sl()));
  sl.registerLazySingleton(() => GetHistoryUseCase(mediaRepository: sl()));
  sl.registerLazySingleton(() => GetMediaStatusesUseCase(mediaRepository: sl()));
  sl.registerLazySingleton(() => DeleteMediaUseCase(mediaRepository: sl()));

  // Drift Database & Liked Templates Local Storage
  sl.registerLazySingleton<AppDatabase>(() => AppDatabase());
  sl.registerLazySingleton<LikedTemplatesLocalDataSource>(
    () => LikedTemplatesLocalDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<LikedTemplatesRepository>(
    () => LikedTemplatesRepositoryImpl(sl()),
  );
  sl.registerLazySingleton(() => GetLikedTemplatesUseCase(sl()));
  sl.registerLazySingleton(() => IsTemplateLikedUseCase(sl()));
  sl.registerLazySingleton(() => ToggleLikeTemplateUseCase(sl()));
  sl.registerLazySingleton(() => WatchLikedTemplatesUseCase(sl()));

  // Premium / IAP
  sl.registerLazySingleton(() => IapApiClient(sl<ApiClient>().dio));
  sl.registerLazySingleton<IapRemoteDataSource>(
    () => IapRemoteDataSourceImpl(apiClient: sl()),
  );
  sl.registerLazySingleton<IapRepository>(
    () => IapRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton(() => VerifySubscriptionUseCase(iapRepository: sl()));
  sl.registerLazySingleton(() => VerifyProductUseCase(iapRepository: sl()));
  sl.registerFactory(
    () => IapBloc(
      verifySubscriptionUseCase: sl(),
      verifyProductUseCase: sl(),
    ),
  );

  // Blocs
  sl.registerFactory(
    () => HomeBloc(
      getHomeCategoriesUseCase: sl(),
    ),
  );
  sl.registerFactory(
    () => TemplatesBloc(
      getCategoriesUseCase: sl(),
      getThemesUseCase: sl(),
    ),
  );
  sl.registerFactory(() => CreateVideoBloc());
  sl.registerFactory(
    () => CreateFromTemplateBloc(
      isTemplateLikedUseCase: sl(),
      toggleLikeTemplateUseCase: sl(),
    ),
  );
  sl.registerFactory(
    () => GeneratingBloc(
      uploadImageUseCase: sl(),
      createTgvUseCase: sl(),
      getMediaDetailUseCase: sl(),
      notificationRepository: sl(),
    ),
  );
  sl.registerFactory(
    () => ResultBloc(
      deleteMediaUseCase: sl(),
    ),
  );
  sl.registerFactory(() => VideoPlayerBloc());
  sl.registerFactory(
    () => ProfileBloc(
      getHistoryUseCase: sl(),
      deleteMediaUseCase: sl(),
      getMediaStatusesUseCase: sl(),
      watchLikedTemplatesUseCase: sl(),
    ),
  );
}
