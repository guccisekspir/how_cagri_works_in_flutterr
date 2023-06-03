import 'package:how_cagri_work_on_flutter/data/database_api_client.dart';
import 'package:how_cagri_work_on_flutter/locator.dart';
import 'package:how_cagri_work_on_flutter/models/kipss_user.dart';

class DatabaseRepository {
  final DatabaseApiClient _dbApiClient = getIt<DatabaseApiClient>();

  Future<bool> coreSaveUser(KipssUser user) async {
    return await _dbApiClient.coreSaveUser(user);
  }

  Future<KipssUser?> coreGetUser(String userID) async {
    return await _dbApiClient.coreGetUser(userID);
  }
}
