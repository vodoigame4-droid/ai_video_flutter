import 'package:get_it/get_it.dart';
import 'package:network/network.dart';

// Settings
import '../../features/settings/presentation/bloc/settings_bloc.dart';
import '../../features/settings/domain/usecases/get_settings_usecase.dart';
import '../../features/settings/domain/usecases/save_settings_usecase.dart';
import '../../features/settings/domain/usecases/get_onboarding_status_usecase.dart';
import '../../features/settings/domain/usecases/complete_onboarding_usecase.dart';

// Auth
import '../../features/auth/data/datasources/auth_api_client.dart';
import '../../features/auth/data/datasources/auth_remote_datasource.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/usecases/login_usecase.dart';
import '../../features/auth/domain/usecases/get_profile_usecase.dart';
import '../../features/auth/domain/usecases/auto_login_usecase.dart';
import '../../features/auth/domain/usecases/watch_profile_usecase.dart';
import '../../features/auth/domain/usecases/rate_app_usecase.dart';
import '../../features/auth/presentation/bloc/credit_badge/credit_badge_bloc.dart';

// Media
import '../../features/media/data/datasources/media_api_client.dart';
import '../../features/media/data/datasources/media_remote_datasource.dart';
import '../../features/media/domain/repositories/media_repository.dart';
import '../../features/media/data/repositories/media_repository_impl.dart';
import '../../features/media/domain/usecases/get_home_categories_usecase.dart';
import '../../features/media/domain/usecases/get_categories_usecase.dart';
import '../../features/media/domain/usecases/get_themes_usecase.dart';
import '../../features/media/domain/usecases/upload_image_usecase.dart';
import '../../features/media/domain/usecases/upload_video_usecase.dart';
import '../../features/media/domain/usecases/create_tgv_usecase.dart';
import '../../features/media/domain/usecases/create_image_to_video_usecase.dart';
import '../../features/media/domain/usecases/create_itv_single_source_usecase.dart';
import '../../features/media/domain/usecases/create_transition_video_usecase.dart';
import '../../features/media/domain/usecases/create_dancing_image_usecase.dart';
import '../../features/media/domain/usecases/create_extend_video_usecase.dart';
import '../../features/media/domain/usecases/create_itv_dual_source_usecase.dart';
import '../../features/media/domain/usecases/get_media_detail_usecase.dart';
import '../../features/media/domain/usecases/get_history_usecase.dart';
import '../../features/media/domain/usecases/get_media_statuses_usecase.dart';
import '../../features/media/domain/usecases/delete_media_usecase.dart';
import '../../features/media/domain/usecases/download_video_usecase.dart';
import '../../features/media/domain/usecases/share_video_usecase.dart';
import '../../features/media/domain/usecases/request_notification_permission_usecase.dart';
import '../../features/media/domain/usecases/subscribe_notification_topic_usecase.dart';
import '../../features/media/domain/usecases/get_suggestion_prompt_usecase.dart';
import '../../features/media/domain/usecases/get_onboarding_images_usecase.dart';
import '../../features/media/domain/usecases/watch_history_usecase.dart';
import '../../features/media/domain/usecases/get_banners_usecase.dart';

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
import '../../features/premium/domain/usecases/verify_subscription_android_usecase.dart';
import '../../features/premium/domain/usecases/verify_product_android_usecase.dart';
import '../../features/premium/domain/usecases/verify_subscription_ios_usecase.dart';
import '../../features/premium/domain/usecases/verify_product_ios_usecase.dart';
import '../../features/premium/domain/usecases/restore_subscription_android_usecase.dart';
import '../../features/premium/domain/usecases/restore_subscription_ios_usecase.dart';

// Daily Check-In
import '../../features/daily_check_in/data/datasources/daily_login_api_client.dart';
import '../../features/daily_check_in/data/datasources/daily_login_remote_datasource.dart';
import '../../features/daily_check_in/domain/repositories/daily_login_repository.dart';
import '../../features/daily_check_in/data/repositories/daily_login_repository_impl.dart';
import '../../features/daily_check_in/domain/usecases/get_daily_login_status_usecase.dart';
import '../../features/daily_check_in/domain/usecases/check_in_usecase.dart';
import '../../features/daily_check_in/presentation/bloc/daily_check_in_bloc.dart';

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
  sl.registerLazySingleton(() => GetOnboardingStatusUseCase(sharedPreferences: sl()));
  sl.registerLazySingleton(() => CompleteOnboardingUseCase(sharedPreferences: sl()));
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
  sl.registerLazySingleton(() => WatchProfileUseCase(sl()));
  sl.registerLazySingleton(() => RateAppUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => AutoLoginUseCase(
        authRepository: sl(),
        notificationRepository: sl(),
        sharedPreferences: sl(),
        appConfig: sl(),
      ));

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
  sl.registerLazySingleton(() => UploadVideoUseCase(mediaRepository: sl()));
  sl.registerLazySingleton(() => CreateTgvUseCase(mediaRepository: sl()));
  sl.registerLazySingleton(() => CreateImageToVideoUseCase(mediaRepository: sl()));
  sl.registerLazySingleton(() => CreateItvSingleSourceUseCase(mediaRepository: sl()));
  sl.registerLazySingleton(() => CreateTransitionVideoUseCase(mediaRepository: sl()));
  sl.registerLazySingleton(() => CreateDancingImageUseCase(mediaRepository: sl()));
  sl.registerLazySingleton(() => CreateExtendVideoUseCase(mediaRepository: sl()));
  sl.registerLazySingleton(() => CreateItvDualSourceUseCase(mediaRepository: sl()));
  sl.registerLazySingleton(() => GetMediaDetailUseCase(mediaRepository: sl()));
  sl.registerLazySingleton(() => GetHistoryUseCase(mediaRepository: sl()));
  sl.registerLazySingleton(() => GetMediaStatusesUseCase(mediaRepository: sl()));
  sl.registerLazySingleton(() => DeleteMediaUseCase(mediaRepository: sl()));
  sl.registerLazySingleton(() => DownloadVideoUseCase());
  sl.registerLazySingleton(() => ShareVideoUseCase());
  sl.registerLazySingleton(() => RequestNotificationPermissionUseCase(notificationRepository: sl()));
  sl.registerLazySingleton(() => SubscribeNotificationTopicUseCase(notificationRepository: sl()));
  sl.registerLazySingleton(() => GetSuggestionPromptUseCase(mediaRepository: sl()));
  sl.registerLazySingleton(() => GetOnboardingImagesUseCase(mediaRepository: sl()));
  sl.registerLazySingleton(() => WatchHistoryUseCase(sl()));
  sl.registerLazySingleton(() => GetBannersUseCase(mediaRepository: sl()));

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
  sl.registerLazySingleton(() => VerifySubscriptionAndroidUseCase(iapRepository: sl()));
  sl.registerLazySingleton(() => VerifyProductAndroidUseCase(iapRepository: sl()));
  sl.registerLazySingleton(() => VerifySubscriptionIosUseCase(iapRepository: sl()));
  sl.registerLazySingleton(() => VerifyProductIosUseCase(iapRepository: sl()));
  sl.registerLazySingleton(() => RestoreSubscriptionAndroidUseCase(iapRepository: sl()));
  sl.registerLazySingleton(() => RestoreSubscriptionIosUseCase(iapRepository: sl()));
  sl.registerLazySingleton(
    () => IapBloc(
      verifySubscriptionAndroidUseCase: sl(),
      verifyProductAndroidUseCase: sl(),
      verifySubscriptionIosUseCase: sl(),
      verifyProductIosUseCase: sl(),
      restoreSubscriptionAndroidUseCase: sl(),
      restoreSubscriptionIosUseCase: sl(),
      getProfileUseCase: sl(),
      watchProfileUseCase: sl(),
    ),
  );

  // Blocs
  sl.registerLazySingleton(
    () => HomeBloc(
      getHomeCategoriesUseCase: sl(),
      getProfileUseCase: sl(),
    ),
  );
  sl.registerFactory(
    () => TemplatesBloc(
      getCategoriesUseCase: sl(),
      getThemesUseCase: sl(),
    ),
  );
  sl.registerFactoryParam<CreateVideoBloc, int, void>((initialTab, _) => CreateVideoBloc(
        getSuggestionPromptUseCase: sl(),
        uploadImageUseCase: sl(),
        watchProfileUseCase: sl(),
        getProfileUseCase: sl(),
        initialTab: initialTab ?? 0,
      ));
  sl.registerFactory(
    () => CreateFromTemplateBloc(
      isTemplateLikedUseCase: sl(),
      toggleLikeTemplateUseCase: sl(),
    ),
  );
  sl.registerFactory(
    () => GeneratingBloc(
      uploadImageUseCase: sl(),
      uploadVideoUseCase: sl(),
      createTgvUseCase: sl(),
      createImageToVideoUseCase: sl(),
      createItvSingleSourceUseCase: sl(),
      createTransitionVideoUseCase: sl(),
      createDancingImageUseCase: sl(),
      createExtendVideoUseCase: sl(),
      createItvDualSourceUseCase: sl(),
      getMediaDetailUseCase: sl(),
      notificationRepository: sl(),
      getProfileUseCase: sl(),
      sharedPreferences: sl(),
    ),
  );
  sl.registerFactory(
    () => ResultBloc(
      deleteMediaUseCase: sl(),
      downloadVideoUseCase: sl(),
      shareVideoUseCase: sl(),
      watchProfileUseCase: sl(),
      getProfileUseCase: sl(),
    ),
  );
  sl.registerFactory(() => VideoPlayerBloc());
  sl.registerLazySingleton(
    () => ProfileBloc(
      getHistoryUseCase: sl(),
      deleteMediaUseCase: sl(),
      watchHistoryUseCase: sl(),
      watchLikedTemplatesUseCase: sl(),
    ),
  );
  sl.registerFactory(
    () => CreditBadgeBloc(
      watchProfileUseCase: sl(),
      getProfileUseCase: sl(),
    ),
  );

  // Daily Check-In
  sl.registerLazySingleton(() => DailyLoginApiClient(sl<ApiClient>().dio));
  sl.registerLazySingleton<DailyLoginRemoteDataSource>(
    () => DailyLoginRemoteDataSourceImpl(apiClient: sl()),
  );
  sl.registerLazySingleton<DailyLoginRepository>(
    () => DailyLoginRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton(() => GetDailyLoginStatusUseCase(dailyLoginRepository: sl()));
  sl.registerLazySingleton(() => CheckInUseCase(dailyLoginRepository: sl()));
  sl.registerLazySingleton(
    () => DailyCheckInBloc(
      getDailyLoginStatusUseCase: sl(),
      checkInUseCase: sl(),
      getProfileUseCase: sl(),
    ),
  );
}
