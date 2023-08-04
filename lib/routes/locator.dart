import 'package:get_it/get_it.dart';
import 'package:user_app/routes/navigation_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
}
