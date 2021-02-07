import 'package:get_it/get_it.dart';

import 'firebase_service.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => FirebaseAuthService());
}
