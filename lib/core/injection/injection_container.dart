import 'package:get_it/get_it.dart';
import '../../features/splash/presentation/bloc/splash_bloc.dart';
import '../../features/home/presentation/blocs/home_bloc.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // Features - Splash
  sl.registerFactory(() => SplashBloc());

  // Features - Home
  sl.registerFactory(() => HomeBloc());
}
