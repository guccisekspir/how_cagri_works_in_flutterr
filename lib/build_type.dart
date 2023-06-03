import 'dart:io';

import 'package:how_cagri_work_on_flutter/utils/build_type_utils.dart';

enum BuildType {
  develop,
  stage,
  release,
  none,
}

BuildType get buildType => BuildTypeUtils.instance.buildType;

bool get isDevBuild => buildType == BuildType.develop;

bool get isStageBuild => buildType == BuildType.stage;

bool get isReleaseBuild => buildType == BuildType.release;

bool get isShowDevicePreview => false;

//todo starter: change to your
String getBaseUrl() => getBuildTypeData(
      develop: 'https://dev-api.how_cagri_work_on_flutter.ai',
      stage: 'https://api.how_cagri_work_on_flutter.ai',
      release: 'https://api.how_cagri_work_on_flutter.ai',
    );

String getWebSocketServer() => getBuildTypeData(
      develop: 'wss://develop.example.com:1312/webSocket',
      stage: 'wss://stage.example.com:1312/webSocket',
      release: 'wss://example.com:1312/webSocket',
    );

/// todo add your in-app products ids
const inAppProductsIds = <String>[];

String getStripePublishableKey() => getBuildTypeData(
      develop:
          'pk_test_51JpyoVBIN8Wf60ykrMpCkjl7x3GuPE5GOUnAzsshaAX2YTMPMN9p44jvkX9XnhPzFhldQ7AoSnVQYQV93goj6nYe00bxxsoLh8',
      stage:
          'pk_test_51JpyoVBIN8Wf60ykrMpCkjl7x3GuPE5GOUnAzsshaAX2YTMPMN9p44jvkX9XnhPzFhldQ7AoSnVQYQV93goj6nYe00bxxsoLh8',
      release:
          'pk_live_51JpyoVBIN8Wf60ykjY5b3jamu2SL2ZWCyHry0Evl7gCJHYQ3WjCwftviZVr31Zp51xDmDXnd54Zk8Eyu15vRg6BU00RK1E6yym',
    );

///TODO add release stripe client id
String getStripeClientId() => getBuildTypeData(
      develop: 'ca_Mjy1yzBsLz4cQQZKnsW5fBs1bazdGUPN',
      stage: 'ca_Mjy1yzBsLz4cQQZKnsW5fBs1bazdGUPN',
      release: 'ca_Mjy1en6bTtV27fI9mnPbgJ6rsUxV4HDX',
    );

String getGoogleClientId() => Platform.isAndroid
    ? '490037362937-n3p10tarq04vh19hg4bdghkd7lpt4fea.apps.googleusercontent.com'
    : '490037362937-0ke3ep17do3mg8nsa9bkc9i4mcgkps4n.apps.googleusercontent.com';

String countryStateCityAPIKey() =>
    'Vk1DaVNMVlhMemJGWGxkU1ZYYW1zQmJFVllMa3B2UVhhWHFkeDZ6cA==';
