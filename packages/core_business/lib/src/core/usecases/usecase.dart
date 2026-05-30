import '../resources/resource.dart';

abstract class UseCase<T, Params> {
  Future<Resource<T>> call(Params params);
}

class NoParams {}
