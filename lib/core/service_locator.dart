part of 'core.dart';

/// Generate service locator for registering all dependencies
class ServiceLocatorClassGenerator {
  static Future<void> generate({
    required String projectName,
  }) async {
    print("🛠️ Generating service locator...");

    Directory('$projectName/lib/core').createSync(recursive: true);
    final serviceLocatorDirectory = File('$projectName/lib/core/service_locator.dart');

    serviceLocatorDirectory.writeAsStringSync(
      """
import 'package:get_it/get_it.dart';
import 'package:$projectName/core/services/shared_preference_manager.dart';
import 'package:$projectName/core/network/dio_handler.dart';
// DO DELETE THIS COMMENTED CODE
// ::IMPORTS::

final GetIt serviceLocator = GetIt.instance;

/// Service locator setup
Future<void> setupServiceLocator() async {
 
  await SharedPreferenceManager.getInstance();
  serviceLocator.registerLazySingleton(() => DioSettings());
  
  // DO DELETE THIS COMMENTED CODE
  // ::REGISTERED_FEATURES::

}

// DO DELETE THIS COMMENTED CODE
// ::METHODS::

    """,
    );

    print("Done ✅");
  }
}
