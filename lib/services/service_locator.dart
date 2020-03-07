import 'package:get_it/get_it.dart';
import 'package:hbzs/services/local_authentication_service.dart';

GetIt locator = GetIt();

void setupLocator() {
 locator.registerLazySingleton(() => LocalAuthenticationService());
}