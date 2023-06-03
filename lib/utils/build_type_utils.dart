//import 'package:cr_logger/cr_logger.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:how_cagri_work_on_flutter/build_type.dart';

class BuildTypeUtils {
  BuildTypeUtils._();

  /// This build type will be used when some errors occurred
  /// while loading build type from environment
  static const fallbackBuildType = BuildType.develop;

  static final BuildTypeUtils instance = BuildTypeUtils._();

  /// Build type override
  BuildType localBuildType = BuildType.none;

  /// Current build type.
  ///
  /// First, init [BuildTypeUtils] to load build type from environment.
  BuildType buildType = fallbackBuildType;

  /// Init [BuildTypeUtils] allows you to use [buildType],
  /// [isDevBuild], [isStageBuild], [isReleaseBuild].
  ///
  /// Before init, current [buildType] equal to [fallbackBuildType].
  Future<void> init() async {
    /// Load the .env file contents into dotenv
    await dotenv.load().onError((error, stackTrace) {
      // log.e('BuildTypeUtils.init: dotenv.load(), $error, $stackTrace');
    });

    buildType = getBuildTypeFromEnvironment();
  }

  /// Use `--dart-define=Environment=develop` etc.
  /// as additional run arguments.
  ///
  /// Or define [BUILD_TYPE] in `assets/.env`
  ///
  /// </br>
  ///
  /// Build type override order:
  /// - [localBuildType]
  /// - [--dart-define=Environment] run argument
  /// - [BUILD_TYPE] from [assets/.env]
  /// - [fallbackBuildType]
  BuildType getBuildTypeFromEnvironment() {
    if (instance.localBuildType != BuildType.none) {
      return instance.localBuildType;
    }

    const environment = String.fromEnvironment('Environment');
    if (environment.isNotEmpty) {
      return getTypeByString(environment);
    }

    if (dotenv.isInitialized) {
      final type = dotenv.maybeGet('BUILD_TYPE');
      if (type != null) {
        return getTypeByString(type);
      }
    }

    return fallbackBuildType;
  }

  BuildType getTypeByString(String type) {
    switch (type) {
      case 'develop':
        return BuildType.develop;
      case 'stage':
        return BuildType.stage;
      case 'release':
        return BuildType.release;
      default:
        return fallbackBuildType;
    }
  }
}

T getBuildTypeData<T>({
  required T develop,
  required T stage,
  required T release,
}) {
  switch (buildType) {
    case BuildType.develop:
      return develop;
    case BuildType.stage:
      return stage;
    case BuildType.release:
      return release;
    default:
      return develop;
  }
}
