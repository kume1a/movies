import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/helpers/device_uuid_provider.dart';

@lazySingleton
class AuthorizationService {
  AuthorizationService(
    this._deviceUUIDProvider,
    this._firebaseFirestore,
    this._sharedPreferences,
  );

  final DeviceUUIDProvider _deviceUUIDProvider;
  final FirebaseFirestore _firebaseFirestore;
  final SharedPreferences _sharedPreferences;

  static const String _collectionAuthorizationRequests = 'authorization_requests';

  static const String _fieldDeviceId = 'device_id';
  static const String _fieldIsAuthorized = 'is_authorized';

  static const String _keyIsAuthorized = 'key_is_authorized';
  static const String _keyLastAuthorizationCheckTimestamp =
      'key_last_authorization_check_timestamp';

  Future<bool> isAuthorized({bool useCache = false}) async {
    try {
      if (useCache) {
        final int? lastAuthorizationCheck =
            _sharedPreferences.getInt(_keyLastAuthorizationCheckTimestamp);
        if (lastAuthorizationCheck != null &&
            DateTime.now()
                    .difference(DateTime.fromMillisecondsSinceEpoch(lastAuthorizationCheck))
                    .inMinutes <
                15) {
          final bool? cachedAuthorizationStatus = _sharedPreferences.getBool(_keyIsAuthorized);
          if (cachedAuthorizationStatus != null && cachedAuthorizationStatus) {
            return true;
          }
        }
      }

      final String? deviceId = await _deviceUUIDProvider.getDeviceUUID();

      final QuerySnapshot<Map<String, dynamic>> snapshot = await _firebaseFirestore
          .collection(_collectionAuthorizationRequests)
          .where(_fieldDeviceId, isEqualTo: deviceId)
          .get(const GetOptions(source: Source.server));

      final QueryDocumentSnapshot<Map<String, dynamic>>? doc = snapshot.docs.firstOrNull;
      if (doc == null) {
        return false;
      }

      final dynamic isAuthorizedField = doc.get(_fieldIsAuthorized);

      // ignore: avoid_bool_literals_in_conditional_expressions
      final bool currentAuthorizationStatus = isAuthorizedField is bool ? isAuthorizedField : false;

      _sharedPreferences.setBool(_keyIsAuthorized, currentAuthorizationStatus);
      _sharedPreferences.setInt(
        _keyLastAuthorizationCheckTimestamp,
        DateTime.now().millisecondsSinceEpoch,
      );

      return currentAuthorizationStatus;
    } catch (e) {
      log('AuthorizationService.isAuthorized: ', error: e);
    }

    return false;
  }

  Future<bool> sendAuthorizationRequest() async {
    try {
      final String? deviceId = await _deviceUUIDProvider.getDeviceUUID();

      final QuerySnapshot<Map<String, dynamic>> snapshot = await _firebaseFirestore
          .collection(_collectionAuthorizationRequests)
          .where(_fieldDeviceId, isEqualTo: deviceId)
          .get(const GetOptions(source: Source.server));

      if (snapshot.size > 0) {
        return true;
      }

      await _firebaseFirestore.collection(_collectionAuthorizationRequests).add(<String, Object?>{
        _fieldDeviceId: deviceId,
        _fieldIsAuthorized: false,
      });

      return true;
    } catch (e) {
      log('AuthorizationService.sendAuthorizationRequest: ', error: e);
    }

    return false;
  }
}
