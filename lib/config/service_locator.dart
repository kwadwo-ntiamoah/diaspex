import 'package:diaspex/domain/usecase/auth.usecase.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  // getIt.registerSingleton<Class>(Class());
  getIt.registerSingleton<AuthUseCase>(AuthUseCase());
}