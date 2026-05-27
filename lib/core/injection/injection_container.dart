import 'package:get_it/get_it.dart';
import '../../features/splash/presentation/bloc/splash_bloc.dart';
import '../../features/onboarding/presentation/bloc/onboarding_bloc.dart';
import '../../features/home/presentation/blocs/home_bloc.dart';
import '../../features/dashboard/presentation/bloc/dashboard_bloc.dart';
import '../../features/profile/presentation/bloc/profile_bloc.dart';
import '../../features/templates/data/datasources/templates_local_datasource.dart';
import '../../features/templates/data/repositories/templates_repository_impl.dart';
import '../../features/templates/domain/repositories/templates_repository.dart';
import '../../features/templates/domain/usecases/get_templates_use_case.dart';
import '../../features/templates/presentation/bloc/templates_bloc.dart';

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

  // Features - Templates
  sl.registerLazySingleton<TemplatesLocalDataSource>(
    () => TemplatesLocalDataSourceImpl(),
  );
  sl.registerLazySingleton<TemplatesRepository>(
    () => TemplatesRepositoryImpl(sl()),
  );
  sl.registerFactory(() => GetTemplatesUseCase(sl()));
  sl.registerFactory(() => TemplatesBloc(getTemplatesUseCase: sl()));
}
