import 'package:get_it/get_it.dart';
import 'package:launcher_schema/deeplink.service.dart';

final locator = GetIt.instance;

void setup() {
  locator.registerLazySingleton(() => DeepLinkService());

}