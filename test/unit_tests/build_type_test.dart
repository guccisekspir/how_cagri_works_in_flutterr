// ignore_for_file: avoid_function_literals_in_foreach_calls
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:how_cagri_work_on_flutter/build_type.dart';
import 'package:how_cagri_work_on_flutter/utils/build_type_utils.dart';

void main() {
  group('getBuildTypeFromEnvironment', () {
    group('from .env', () {
      const {
        'BUILD_TYPE=develop': BuildType.develop,
        'BUILD_TYPE=stage': BuildType.stage,
        'BUILD_TYPE=release': BuildType.release,
        'BUILD_TYPE=': BuildTypeUtils.fallbackBuildType,
        '': BuildTypeUtils.fallbackBuildType,
      }.forEach((stringInEnvFile, buildType) {
        test(buildType.name, () {
          dotenv.testLoad(fileInput: stringInEnvFile);
          expect(
            BuildTypeUtils.instance.getBuildTypeFromEnvironment(),
            buildType,
          );
        });
      });
    });

    group('from localBuildType', () {
      testLocalBuildType(() {
        const [
          BuildType.develop,
          BuildType.stage,
          BuildType.release,
        ].forEach((buildType) {
          test(buildType.name, () {
            BuildTypeUtils.instance.localBuildType = buildType;
            expect(
              BuildTypeUtils.instance.getBuildTypeFromEnvironment(),
              buildType,
            );
          });
        });
      });
    });
  });

  group('getTypeByString', () {
    const {
      'develop': BuildType.develop,
      'stage': BuildType.stage,
      'release': BuildType.release,
    }.forEach((key, buildType) {
      test(buildType.name, () {
        expect(BuildTypeUtils.instance.getTypeByString(key), buildType);
      });
    });
  });

  group('Only one build type must be true', () {
    testLocalBuildType(() {
      const [
        BuildType.develop,
        BuildType.stage,
        BuildType.release,
      ].forEach((buildType) {
        BuildTypeUtils.instance.localBuildType = buildType;
        test(buildType.name, () {
          expect(
            [
              isDevBuild,
              isStageBuild,
              isReleaseBuild,
            ].where((e) => e).length,
            1,
          );
        });
      });
    });
  });
}

void testLocalBuildType(VoidCallback test) {
  final buildTypeUtils = BuildTypeUtils.instance;

  final localBuildType = buildTypeUtils.localBuildType;
  test();
  buildTypeUtils.localBuildType = localBuildType;
}
